#include "include/odometry/DVLFactor.h"
#include <gtsam/nonlinear/NonlinearFactor.h>
#include <gtsam/geometry/Pose3.h>
#include <gtsam/navigation/NavState.h>

class DVLFactor : public gtsam::NoiseModelFactor1<gtsam::NavState> {
//private:
//    gtsam::Vector3 measured_velocity_; // Measured velocity from the DVL
//    gtsam::Pose3 body_P_sensor_; // Transform from body to sensor frame

//public:
    
    // Error function
    gtsam::Vector DVLFctor::evaluateError(const gtsam::NavState& state,
                                boost::optional<gtsam::Matrix&> H = boost::none) const override {
        // Predict velocity in sensor frame
        gtsam::Vector3 predicted_velocity = body_P_sensor_.rotation().unrotate(state.velocity());

        // Calculate error
        gtsam::Vector3 error = predicted_velocity - measured_velocity_;

        // Jacobian computation
        if (H) {
            *H = (gtsam::Matrix(3, 6) << body_P_sensor_.rotation().transpose(), gtsam::Matrix3::Zero()).finished();
        }

        return error;
    }
};

if ( z%5 == 0){
    std::cout << "Optimising" << std::endl;
        // Check it has been initialised
    int next_pose_key = this->key("pose");
    int next_velocity_key = this->key("velocity");
    int next_bias_key = this->key("imu_bias");
    int next_barometer_key = this->key("barometer");
    int next_dvl_key = this->key("dvl");
    
    //if (next_pose_key > 0){ 
      //imu_mutex.lock();
      //TODO: Set timestamp for this pose that we want to optimise
      this->set_timestamp("pose", msg->header.stamp);
   
      // add IMU and Bias factors to graph
      auto preint_imu =
        dynamic_cast<const PreintegratedCombinedMeasurements&>(*preintegrated);
      
      imuBias::ConstantBias zero_bias(Vector3(0, 0, 0), Vector3(0, 0, 0));
      graph->emplace_shared<CombinedImuFactor>(
       X(this->key("pose", -1)), V(this->key("pose", -1)),
       X(this->key("pose")), V(this->key("velocity")),
       B(this->key("imu_bias", -1)), B(this->key("imu_bias")),
       preint_imu
      );
      
    
      
      // add pressure factors 
      // check if timestamp is less than or equal to keyframe timestamp
      
                                     
      // check if timestamp is less than or equal to keyframe timestamp
    ros::Time sonar_timestamp = msg->header.stamp;
    bool velocity_updated = false;
    bool pressure_updated = false;
    
   // Iterate backward through the pressure messages
   // to find the latest that has a timestamp less than or equal to the keyframe
   for (auto it = pressure_messages_.rbegin(); it != pressure_messages_.rend(); ++it) {
   // depth_mutex.lock();
    if (it->header.stamp <= sonar_timestamp) {
      pressure = (it->fluid_pressure/ 1000);
   //  graph->emplace_shared<BarometricFactor>(X(this->key("pose")),
    //                                 P(this->key("barometer")),pressure,
    //                               pressure_noise_model);
  //    newNodes.insert(P(this->key("barometer")), pressure);
      ROS_WARN("Pressure message added to graph.");
      pressure_updated = true;
      pressure_messages_.clear();
    //  depth_mutex.unlock();
      break;
     }
    
   }

   if (!pressure_updated) {
     ROS_WARN("No suitable Pressure message found with timestamp <= sonar message timestamp. Using previous velocity.");
     pressure_messages_.clear();
     //depth_mutex.unlock();
   } 

   // Iterate backward through the DVL messages
   for (auto it = dvl_messages_.rbegin(); it != dvl_messages_.rend(); ++it) {
    if (it->header.stamp <= sonar_timestamp) {
      dvl_velocity = Vector3(it->velocity.x, it->velocity.y, it->velocity.z);
      gtsam::NavState navstate(gtsam::Rot3(), gtsam::Point3(), dvl_velocity );
     // graph->emplace_shared<DVLFactor>(X(this->key("pose")), D(this->key("dvl")), dvl_velocity, body_P_sensor, dvl_noise);
   //   newNodes.insert(D(this->key("dvl")), dvl_velocity);
      velocity_updated = true;
      ROS_WARN("Velocity message added to graph.");
      dvl_messages_.clear();
    //  velocity_mutex.unlock();
      break;
     }
   }

   if (!velocity_updated) {
     ROS_WARN("No suitable DVL message found with timestamp <= sonar message timestamp. Using previous velocity.");
     dvl_messages_.clear();
    // velocity_mutex.unlock();
   }
      
       // Add values to the graph
    
     prop_state = preintegrated->predict(prev_state, prev_bias);
     //plot raw values before trajectory
     std::ofstream initialFile("initial_positions.txt", std::ios::app);
        if (initialFile.is_open()) {
            initialFile << prop_state.pose().x() << " "
                        << prop_state.pose().y() << " "
                        << prop_state.pose().z() << std::endl;
            initialFile.close();
        } 
        
     newNodes.insert(X(this->key("pose")), prop_state.pose());
     newNodes.insert(V(this->key("velocity")), prop_state.v());
     newNodes.insert(B(this->key("imu_bias")), prev_bias);
    
      
      
     // Optimise and publish
     this->Optimise_and_publish();
     
     // Increment keys
     this->increment("pose");
     this->increment("velocity");
     this->increment("imu_bias");
     this->increment("barometer");
     this->increment("dvl");
    
// } 
 }
  z = z+1;
