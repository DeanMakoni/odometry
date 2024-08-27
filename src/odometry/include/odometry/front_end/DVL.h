//Dean

#ifndef DVL_H
#define DVL_H

#include <ros/ros.h>
#include <cola2_msgs/DVL.h>
#include <gtsam/nonlinear/NonlinearFactorGraph.h>

#include <gtsam/nonlinear/Values.h>
#include <mutex>
#include <vector>

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
#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/back_end/DVLFactor.h"

class DVL {
public:
    // Constructor
    DVL();

    // Method to add DVL messages to the vector
    void AddDVLMessage(const cola2_msgs::DVL& dvl_msg);

    // Method to add DVL factors to the graph
    void AddDVLFactor(std::shared_ptr<gtsam::NonlinearFactorGraph> graph, const ros::Time& sonar_timestamp,
                       gtsam::Key pose_key, gtsam::Key dvl_key, const gtsam::Pose3& body_P_sensor);

    // Method to add DVL values to the graph
    void AddDVLValues(gtsam::Values& newNodes,gtsam::Key dvl_key);

private:
    std::vector<cola2_msgs::DVL> dvl_messages_;
    std::mutex dvl_mutex;
    gtsam::Vector3 dvl_velocity;
    gtsam::SharedNoiseModel dvl_noise;
};

#endif // DVL_H
