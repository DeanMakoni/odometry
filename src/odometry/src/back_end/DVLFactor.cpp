// Dean
// Dean Makoni
// 1 July 2024
#include"/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/back_end/DVLFactor.h"
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
// include custom factors 
//#include "include/odometry/DVLFactor.h"

#include <opencv2/opencv.hpp>
#include <cmath>
#include <vector>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/imgproc/imgproc.hpp>


// Constructor implementation
DVLFactor::DVLFactor(Key pose_key, Key velocity_key,
                     const Vector3& measured_velocity,
                     const SharedNoiseModel& model)
    : NoiseModelFactor2<Pose3, Vector3>(model, pose_key, velocity_key),
      measured_velocity_(measured_velocity) {}

// Error function implementation
Vector DVLFactor::evaluateError(const Pose3& pose, const Vector3& velocity,
                                boost::optional<Matrix&> H1, boost::optional<Matrix&> H2) const {
    // Predict velocity in sensor frame
   // Vector3 predicted_velocity = body_P_sensor_.rotation().unrotate(pose.rotation().rotate(velocity));
   //  Vector3 predicted_velocity = body_P_sensor_.rotation().unrotate(pose.rotation().rotate(velocity));
    // Print the predicted velocity
    //std::cout << "Predicted Velocity: " << velocity.transpose() << std::endl;
    // Print the measured velocity
    //std::cout << "Measured Velocity: " << measured_velocity_.transpose() << std::endl;
    
    // Calculate error
    Vector3 error = velocity - measured_velocity_;
     
    if (H1 || H2) {
        // Compute the Jacobian w.r.t the pose
        if (H1) {
            *H1 = (Matrix(3, 6) << -body_P_sensor_.rotation().transpose() * pose.rotation().matrix(), Matrix3::Zero()).finished();
        }
        // Compute the Jacobian w.r.t the velocity
        if (H2) {
            (*H2) = gtsam::Matrix33::Identity();
        }
    }

    return error;
}


