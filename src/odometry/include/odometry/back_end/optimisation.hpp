//Dean
#ifndef OPTIMISATION_HPP
#define OPTIMISATION_HPP

#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/back_end/graphmanager.hpp"
#include"/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/front_end/IMU.h"
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

// Include custom factors
//#include "include/odometry/DVLFactor.h"

#include <opencv2/opencv.hpp>
#include <cmath>
#include <vector>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/imgproc/imgproc.hpp>

class Optimisation {
public:
    // Constructor
    Optimisation()
         {
        // Set ISAM2 parameters
        parameters.relinearizeThreshold = 0.01;
        parameters.relinearizeSkip = 1;
        parameters.optimizationParams = gtsam::ISAM2DoglegParams();
        parameters.factorization = gtsam::ISAM2Params::QR;
        this->ISAM = new ISAM2(parameters);
        //optimised_odometry_publisher_ = nh_.advertise<nav_msgs::Odometry>("optimised_odometry_topic", 10);
        //path_publisher_ = nh_.advertise<nav_msgs::Path>("path_topic", 10);
        //pose_publisher_ = nh_.advertise<geometry_msgs::Pose>("pose_topic", 10);
    }

    /**
     * Optimise using ISAM2 and publish
     */
    void Optimise_and_publish(const GraphManager& graphManager,const IMU& Imu);
    //States
    gtsam::NavState  prev_state;
    gtsam::NavState prop_state;
    // Priors 
    gtsam::Pose3 prior_pose;
    gtsam::Vector3 prior_velocity;
    
    // ros publishers
    
    //std::string optimised_odometry_topic;
    //ros::Publisher optimised_odometry_publisher_;
    //ros::Publisher path_publisher_;
    //std::string pose_topic_;
    //ros::Publisher pose_publisher_;
    
private:
    gtsam::ISAM2* ISAM;
    gtsam::Values result;
    gtsam::ISAM2Params parameters;
    
    
    
};

#endif // OPTIMISATION_HPP
