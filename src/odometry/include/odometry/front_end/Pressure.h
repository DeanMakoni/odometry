//Dean

#ifndef PRESSURE_H
#define PRESSURE_H

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

class PRESSURE {
public:

    // Constructor
    PRESSURE();
    
    // Method to add a pressure message to the vector
    void AddPressureMessage(const sensor_msgs::FluidPressure& pressure_msg);

    // Method to add a Pressure Factor to the graph
    void AddPressureFactor(std::shared_ptr<gtsam::NonlinearFactorGraph> graph, gtsam::Key pose_key, gtsam::Key barometer_key, 
                           const ros::Time& sonar_timestamp);

    // Method to add pressure values to nodes
    void AddPressureValues(gtsam::Values& newNodes, gtsam::Key pressure_key);

private:
    // Vector to store pressure messages
    std::vector<sensor_msgs::FluidPressure> pressure_messages_;
    gtsam::SharedNoiseModel pressure_noise_model;
    double pressure;
};

#endif // PRESSURE_H
