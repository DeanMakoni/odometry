//Dean
//Graph manager class

#ifndef GRAPH_MANAGER_HPP
#define GRAPH_MANAGER_HPP

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
#include <map>
#include <string>
#include <limits>
#include <ros/time.h> // Assuming ROS time is being used
#include <gtsam/nonlinear/NonlinearFactorGraph.h>
#include <gtsam/nonlinear/Values.h>
#include <memory>

class GraphManager {
public:
    /**
     * @brief Constructor for GraphManager
     */
    GraphManager() : graph(std::make_shared<gtsam::NonlinearFactorGraph>()) {}

    /**
     * @brief Destructor for GraphManager
     */
    ~GraphManager() {
        // No need for manual cleanup due to smart pointers
    }

    /**
     * @brief Structure to hold information about a named key. Named keys are used to keep track of the index for which
     * data should be added to the graph.
     */
    struct NamedKeyInfo {
        NamedKeyInfo(int key = 0, unsigned int priority = 0) : key(key), priority(priority) {}

        // Key/index used to acquire gtsam::Key in graph
        int key;

        // Priority of the named key, used in various operations. 0 is maximum priority.
        unsigned int priority;
    };

    // Associative container to store keys
    std::map<std::string, NamedKeyInfo> keys;

    // All Timestamps (key -> time)
    std::map<int, ros::Time> timestamps_;

    // Graph and key management functions

    /**
     * @brief Get the timestamp associated with a particular key value.
     *
     * @param key
     * @return const ros::Time&
     */
    const ros::Time& timestamp(int key) const {
        return timestamps_.at(key);
    }

    /**
     * @brief Get the timestamp associated with a named key.
     *
     * @param name
     * @return const ros::Time&
     */
    const ros::Time& timestamp(const std::string& name, int offset = 0) const {
        int key_value = key(name, offset);
        return timestamp(key_value);
    }

    // Set timestamps
    void set_timestamp(int key, const ros::Time& timestamp) {
        timestamps_[key] = timestamp;
    }

    void set_timestamp(const std::string& name, const ros::Time& timestamp, int offset = 0) {
        int key_value = key(name, offset);
        set_timestamp(key_value, timestamp);
    }

    /**
     * @brief Increment a named key.
     *
     * @param name
     */
    void increment(const std::string& name) {
        keys[name].key++;
    }

    /**
     * @brief Get the key value for a named key.
     *
     * @param name
     * @return int
     */
    int key(const std::string& name, int offset = 0) const {
        return keys.at(name).key + offset;
    }

    /**
     * @brief Return the smallest key value of the named keys with priority <= priority arg (highest = 0).
     *
     * @param priority
     * @return int
     */
    int minimum_key(unsigned int priority = std::numeric_limits<unsigned int>::max()) const {
        int min_key = std::numeric_limits<int>::max();
        for (const auto& [name, info] : keys) {
            if (info.priority <= priority) {
                min_key = std::min(min_key, info.key);
            }
        }
        return min_key;
    }

    /**
     * @brief Set/create a named key.
     *
     * @param name
     * @param key
     * @param priority
     */
    void set_named_key(const std::string& name, int key = 0, unsigned int priority = 0) {
        keys[name] = NamedKeyInfo(key, priority);
    }

   // Accessor methods for graph and newNodes
   gtsam::NonlinearFactorGraph& getGraph() const;
   gtsam::Values& getNewNodes();
   std::shared_ptr<gtsam::NonlinearFactorGraph> graph;
   gtsam::Values newNodes;  // Initialize if needed or remove if unused
   
   
private:
    
};

#endif // GRAPH_MANAGER_HPP
