// IMU.h
#ifndef IMU_HPP
#define IMU_HPP

#include <ros/ros.h>
#include <sensor_msgs/Imu.h>
#include <sensor_msgs/FluidPressure.h>
#include <cola2_msgs/DVL.h>
#include <sensor_msgs/Image.h>
#include <tf2_ros/transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>
#include <nav_msgs/Odometry.h>
#include <sensor_msgs/PointCloud2.h>
#include <nav_msgs/Path.h>
#include <Eigen/Dense>

// GTSAM related includes.
#include <gtsam/navigation/Scenario.h>
#include <gtsam/navigation/ScenarioRunner.h>
#include <gtsam/inference/Symbol.h>
#include <gtsam/navigation/CombinedImuFactor.h>
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
#include <vector>
#include <opencv2/opencv.hpp>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/imgproc/imgproc.hpp>

using namespace std;
using namespace gtsam;

class IMU {
public:
    // Constructor with parameters
    IMU(
        double accel_noise_sigma,
        double gyro_noise_sigma,
        double accel_bias_rw_sigma,
        double gyro_bias_rw_sigma,
        const gtsam::imuBias::ConstantBias prior_imu_bias,
        const gtsam::imuBias::ConstantBias prev_bias
    );

    // Method to add combined IMU factor to the graph
    void AddCombinedIMUFactor(std::shared_ptr<gtsam::NonlinearFactorGraph> graph, gtsam::Key prev_pose_key,
                             gtsam::Key prev_velocity_key, gtsam::Key pose_key, gtsam::Key velocity_key,
                             gtsam::Key prev_bias_key, gtsam::Key bias_key);
    void AddValuesToNodes(const gtsam::NavState prev_state, 
                          const gtsam::NavState prop_state, 
                          gtsam::Values& newNodes,
                           gtsam::Key pose_key,
                           gtsam::Key velocity_key,
                           gtsam::Key bias_key);
    // Getter for preintegrated
    std::shared_ptr<gtsam::PreintegratedCombinedMeasurements> getPreintegrated() const;
    
    // Getter for prev_bias
    gtsam::imuBias::ConstantBias getPrevBias() const;
    
      // Noise models for IMU
    gtsam::noiseModel::Isotropic::shared_ptr velocity_noise_model; // m/s
    gtsam::noiseModel::Isotropic::shared_ptr  pose_noise; // m/s
    gtsam::noiseModel::Isotropic::shared_ptr bias_noise_model;
    
    // IMU biases
    gtsam::imuBias::ConstantBias prior_imu_bias;
    gtsam::imuBias::ConstantBias prev_bias;
    
     //IMU specifications
    double accel_noise_sigma;
    double gyro_noise_sigma;
    double accel_bias_rw_sigma;
    double gyro_bias_rw_sigma; 
    
    // Preintegration parameters
    std::shared_ptr<gtsam::PreintegratedCombinedMeasurements::Params> p;

    // Preintegrated measurements
    std::shared_ptr<gtsam::PreintegratedCombinedMeasurements> preintegrated;
    
    // Vector to store IMU messages
    std::vector<sensor_msgs::Imu> imu_messages_;
    
   
    
private:

    
    
   
    
    // IMU Time
    ros::Time prev_imu_timestamp; 
    
   
      
};

#endif // IMU_HPP
