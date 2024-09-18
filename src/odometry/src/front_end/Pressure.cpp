//Dean
#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/front_end/Pressure.h"

// Constructor
PRESSURE::PRESSURE() {
    // Initialize the noise model
    //pressure_noise_model = gtsam::noiseModel::Isotropic::Variance(1, 1.0e-6);
     pressure_noise_model = gtsam::noiseModel::Isotropic::Variance(1, 25);
}


// Method to add a pressure message to the vector
void PRESSURE::AddPressureMessage(const sensor_msgs::FluidPressure& pressure_msg) {
    pressure_messages_.push_back(pressure_msg);
}


// Method to add a Pressure Factor to the graph
void PRESSURE::AddPressureFactor(gtsam::NonlinearFactorGraph& graph, gtsam::Key pose_key, gtsam::Key barometer_key, const ros::Time& sonar_timestamp) {
    bool pressure_updated = false;
    for (auto it = pressure_messages_.rbegin(); it != pressure_messages_.rend(); ++it) {
        //std::lock_guard<std::mutex> lock(depth_mutex); // Use RAII for safer locking
        if (it->header.stamp <= sonar_timestamp) {
            this->pressure = it->fluid_pressure;
             double depth = pressure/ (1000* 9.80665) + 0.32; // 0.3 if for presure sensor trnaslation. Hard coded for now.
            // Convert measurement from pressure frame to world frame
            graph.emplace_shared<gtsam::PressureFactor>(pose_key, depth, this->pressure_noise_model);
            std::cout<<"Presuure is "<< pressure<<std::endl;
            std::cout<<"Height is "<< depth<<std::endl;
            ROS_WARN("Pressure message added to graph.");
            pressure_updated = true;
            pressure_messages_.clear(); // Clear messages after use
            break;
        }
    }
    
   if (!pressure_updated) {
     ROS_WARN("No suitable Pressure message found with timestamp <= sonar message timestamp. Using previous velocity.");
     pressure_messages_.clear();
     //depth_mutex.unlock();
   } 
}


// Method to add pressure values to nodes
void PRESSURE::AddPressureValues(gtsam::Values& newNodes, gtsam::Key pressure_key) {
    newNodes.insert(pressure_key, this->pressure);
}

