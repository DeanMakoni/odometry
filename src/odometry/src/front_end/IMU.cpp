//Dean
// IMU.cpp
#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/front_end/IMU.h"
#include <ros/ros.h>
#include <sensor_msgs/Imu.h>
#include <sensor_msgs/FluidPressure.h>
#include <cola2_msgs/DVL.h>
#include <sensor_msgs/Image.h>
#include <tf2_ros/transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>
#include <sensor_msgs/Imu.h>
#include <nav_msgs/Odometry.h>
#include <sensor_msgs/PointCloud2.h>
#include <nav_msgs/Path.h>
#include <Eigen/Dense>

// GTSAM related includes.
#include <gtsam/navigation/Scenario.h>
#include <gtsam/navigation/ScenarioRunner.h>
#include <gtsam/inference/Symbol.h>
#include <gtsam/navigation/CombinedImuFactor.h>
#include <gtsam/navigation/GPSFactor.h>
#include <gtsam/navigation/ImuFactor.h>
#include <gtsam/navigation/BarometricFactor.h>
#include <gtsam/nonlinear/ISAM2.h>
#include <gtsam/nonlinear/LevenbergMarquardtOptimizer.h>
#include <gtsam/nonlinear/NonlinearFactorGraph.h>
#include <gtsam/slam/BetweenFactor.h>
#include <gtsam/slam/dataset.h>
#include <gtsam/nonlinear/NonlinearFactor.h>
#include <gtsam/geometry/Pose3.h>
#include <gtsam/navigation/NavState.h>
#include <gtsam/nonlinear/Marginals.h>
#include <gtsam/inference/Key.h>
#include <iostream>
#include <fstream>

using namespace std;
using namespace gtsam;

// Constructor implementation
IMU::IMU(
    double accel_noise_sigma,
    double gyro_noise_sigma,
    double accel_bias_rw_sigma,
    double gyro_bias_rw_sigma,
    const gtsam::imuBias::ConstantBias prior_imu_bias,
    const gtsam::imuBias::ConstantBias prev_bias
) :accel_noise_sigma(accel_noise_sigma),
   gyro_noise_sigma(gyro_noise_sigma),
   accel_bias_rw_sigma(accel_bias_rw_sigma),
   gyro_bias_rw_sigma(gyro_bias_rw_sigma),
   prior_imu_bias(prior_imu_bias), 
   prev_bias(prev_bias) {

    Matrix33 measured_acc_cov = I_3x3 * pow(accel_noise_sigma, 2);
    Matrix33 measured_omega_cov = I_3x3 * pow(gyro_noise_sigma, 2);
    Matrix33 integration_error_cov = I_3x3 * 1e-8;  // error committed in integrating position from velocities
    Matrix33 bias_acc_cov = I_3x3 * pow(accel_bias_rw_sigma, 2);
    Matrix33 bias_omega_cov = I_3x3 * pow(gyro_bias_rw_sigma, 2);
    Matrix66 bias_acc_omega_init = I_6x6 * 1e-5;  // error in the bias used for preintegration
    
    // Initialize preintegration parameters
    this->p = gtsam::PreintegratedCombinedMeasurements::Params::MakeSharedD(9.81); // Set gravity

    // Set the covariance matrices
    this->p->accelerometerCovariance = measured_acc_cov;
    this->p->integrationCovariance = integration_error_cov;
    this->p->gyroscopeCovariance = measured_omega_cov;
    this->p->biasAccCovariance = bias_acc_cov;
    this->p->biasOmegaCovariance = bias_omega_cov;
    this->p->biasAccOmegaInt = bias_acc_omega_init;

    // Initialize preintegrated measurements
    this->preintegrated = std::make_shared<gtsam::PreintegratedCombinedMeasurements>(this->p, prior_imu_bias);
    assert(this->preintegrated);
     // Noise models for IMU
    this->velocity_noise_model = gtsam::noiseModel::Isotropic::Sigma(3, 0.00001); // m/s
    this->pose_noise = gtsam::noiseModel::Isotropic::Sigma(6, 0.00001); // m/s
    this->bias_noise_model = gtsam::noiseModel::Isotropic::Sigma(6, 1e-4);
    
}

void IMU::AddCombinedIMUFactor(std::shared_ptr<gtsam::NonlinearFactorGraph> graph, gtsam::Key prev_pose_key,
                             gtsam::Key prev_velocity_key, gtsam::Key pose_key, gtsam::Key velocity_key,
                             gtsam::Key prev_bias_key, gtsam::Key bias_key) {
     if (!graph) {
        throw std::runtime_error("Graph pointer is null.");
    }

    // Check that preintegrated is initialized
    if (!preintegrated) {
        throw std::runtime_error("PreintegratedCombinedMeasurements is not initialized.");
    }

    // Cast preintegrated to PreintegratedCombinedMeasurements
    const auto& preint_imu = dynamic_cast<const gtsam::PreintegratedCombinedMeasurements&>(*preintegrated);

    // Define zero bias
    gtsam::imuBias::ConstantBias zero_bias(gtsam::Vector3(0, 0, 0), gtsam::Vector3(0, 0, 0));

    // Add the IMU and bias factors to the graph
    graph->emplace_shared<gtsam::CombinedImuFactor>(
        prev_pose_key, 
        prev_velocity_key,
        pose_key, 
        velocity_key,
        prev_bias_key, 
        bias_key,
        preint_imu
    );
}

void IMU::AddValuesToNodes(const gtsam::NavState prev_state, 
                           const gtsam::NavState prop_state, 
                           gtsam::Values& newNodes, gtsam::Key pose_key,
                           gtsam::Key velocity_key,
                           gtsam::Key bias_key) {
    // Predict the next state using preintegrated IMU data
    prop_state = this->getPreintegrated()->predict(prev_state, prev_bias);

    // Plot raw values before trajectory
    std::ofstream initialFile("initial_positions.txt", std::ios::app);
    if (initialFile.is_open()) {
        initialFile << prop_state.pose().x() << " "
                    << prop_state.pose().y() << " "
                    << prop_state.pose().z() << std::endl;
        initialFile.close();
    }

    // Add predicted values to the graph
    newNodes.insert(pose_key, prop_state.pose());
    newNodes.insert(velocity_key, prop_state.v());
    newNodes.insert(bias_key, prev_bias);
}

std::shared_ptr<gtsam::PreintegratedCombinedMeasurements> IMU::getPreintegrated() const {
    return preintegrated;
}

gtsam::imuBias::ConstantBias IMU::getPrevBias() const {
    return prev_bias;
}
