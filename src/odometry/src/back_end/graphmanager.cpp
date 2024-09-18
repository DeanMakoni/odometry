#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/back_end/graphmanager.hpp"
#include <stdexcept>
#include <cassert>



// Return a const pointer to the graph
gtsam::NonlinearFactorGraph& GraphManager::getGraph() const {
    return *graph;
}

// Return a const reference to newNodes
gtsam::Values& GraphManager::getNewNodes() {
    return newNodes;
}
