//Dean

#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/front_end/DVL.h"

// Constructor
DVL::DVL() {
	//initialise noise moel
	dvl_noise = gtsam::noiseModel::Isotropic::Sigma(3, 0.1);
}

// Method to add DVL messages to the vector
void DVL::AddDVLMessage(const cola2_msgs::DVL& dvl_msg) {
   
    dvl_messages_.push_back(dvl_msg);
}

// Method to add DVL factors to the graph
void DVL::AddDVLFactor(gtsam::NonlinearFactorGraph& graph, const ros::Time& sonar_timestamp,
                       gtsam::Key pose_key, gtsam::Key dvl_key, const gtsam::Pose3& body_P_sensor) {
    //std::lock_guard<std::mutex> lock(velocity_mutex);

    // Iterate backward through the DVL messages
    for (auto it = dvl_messages_.rbegin(); it != dvl_messages_.rend(); ++it) {
        if (it->header.stamp <= sonar_timestamp) {
            this->dvl_velocity = gtsam::Vector3(it->velocity.x, it->velocity.y, it->velocity.z);
            gtsam::NavState navstate(gtsam::Rot3(), gtsam::Point3(), dvl_velocity);

            graph.emplace_shared<DVLFactor>(
              pose_key,dvl_key , this->dvl_velocity, body_P_sensor, this->dvl_noise);

            //velocity_updated = true;
            ROS_WARN("Velocity message added to graph.");
            dvl_messages_.clear();
            break;
        }
    }

    //if (!velocity_updated) {
   //     ROS_WARN("No suitable DVL message found with timestamp <= sonar message timestamp. Using previous velocity.");
  //      dvl_messages_.clear();
  //  }
     //velocity_mutex.unlock();   
}

// Method to add DVL values to the graph
void DVL::AddDVLValues(gtsam::Values& newNode,gtsam::Key dvl_key) {
    //std::lock_guard<std::mutex> lock(velocity_mutex);
    newNode.insert(dvl_key, this->dvl_velocity);
}
