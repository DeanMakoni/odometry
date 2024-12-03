//Dean
#include"/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/back_end/optimisation.hpp"
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
#include <gtsam/base/FastList.h>
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

using namespace std;
using namespace gtsam;
using gtsam::symbol_shorthand::B;  // Bias  (ax,ay,az,gx,gy,gz)
using gtsam::symbol_shorthand::V;  // Vel   (xdot,ydot,zdot)
using gtsam::symbol_shorthand::X;  // Pose3 (x,y,z,r,p,y)//
using gtsam::symbol_shorthand::P;  // Pressure bias
using gtsam::symbol_shorthand::D;  // DVL
using gtsam::symbol_shorthand::L;  // Landmark point

// Optimisie and pubblissh using ISAM
void Optimisation::Optimise_and_publish(GraphManager& graphManager, IMU& Imu,int64_t timestamp_ms) {

    // Check if the pose key has reached a multiple of 30 for batch re-optimization
     int max_key = graphManager.key("pose");
     // Instead of batch re-optimization, perform marginalization every 30 poses
        
    
    // ISAM2 solver
    try {
        int max_key = graphManager.key("pose");
        ROS_INFO("ISAM solver");
        
        this->ISAM->update(graphManager.getGraph(), graphManager.getNewNodes());
        ROS_INFO("ISAM solver Done for ");
       
        this->result = ISAM->calculateEstimate();
        
        ROS_INFO("Calculation done.");
        
       // prior_pose = result.at<gtsam::Pose3>(gtsam::Symbol('X', this->key("pose")));
        //prior_pose = result.at<gtsam::Pose3>(X(this->key("pose")));
        //prior_velocity = result.at<gtsam::Vector3>(V(this->key("velocity")));
        // Overwrite the beginning of the preintegration for the next step.
        
        // Update previous bias
        Imu.getPrevBias() = result.at<gtsam::imuBias::ConstantBias>(B(graphManager.key("imu_bias")));
       

       
      // Plotting stuff 
      gtsam::Pose3 current_pose1 = result.at<gtsam::Pose3>(X(graphManager.key("pose")));
      gtsam::Vector3 current_velocity1 = result.at<gtsam::Vector3>(V(graphManager.key("velocity")));
      gtsam::imuBias::ConstantBias current_bias = result.at<gtsam::imuBias::ConstantBias>(B(graphManager.key("imu_bias")));

      // Extract position
     gtsam::Point3 position1 = current_pose1.translation();

     // Extract biases
     gtsam::Vector3 gyro_bias = current_bias.gyroscope();
     gtsam::Vector3 accel_bias = current_bias.accelerometer();
       
     // Extract accelerometer and gyroscope biases
     gtsam::Vector3 accel_bias1 = Imu.getPrevBias().accelerometer();
     gtsam::Vector3 gyro_bias1 = Imu.getPrevBias().gyroscope();

     // Open files to write biases
     std::ofstream accel_bias_file("accelerometer_biases.txt", std::ios::app);
     std::ofstream gyro_bias_file("gyroscope_biases.txt", std::ios::app);
     std::ofstream navstate_file("position_bias.txt", std::ios::app);
     std::ofstream bias_file("biases.txt", std::ios::app);

 if (navstate_file.is_open() && bias_file.is_open()) {
    // Save position and velocity
    navstate_file << position1.x() << " " << position1.y() << " " << position1.z() << " "
                  << current_velocity1.x() << " " << current_velocity1.y() << " " << current_velocity1.z() << "\n";
    
    // Save biases
    bias_file << gyro_bias.x() << " " << gyro_bias.y() << " " << gyro_bias.z() << " "
              << accel_bias.x() << " " << accel_bias.y() << " " << accel_bias.z() << "\n";
    
    navstate_file.close();
    bias_file.close();
}

    // Write biases to files
     if (accel_bias_file.is_open() && gyro_bias_file.is_open()) {
        accel_bias_file << accel_bias1.transpose() << std::endl;
      gyro_bias_file << gyro_bias1.transpose() << std::endl;
     }

      // Close files
     accel_bias_file.close();
     gyro_bias_file.close();
   
 // Plotting stuff  
        
     // Reset the preintegration object
     Imu.getPreintegrated()->resetIntegrationAndSetBias(Imu.getPrevBias());
     
     
        
        
        /// Save graph 
      //  if ( max_key == 3){
           // Export the graph to a DOT file
    //       std::ofstream ofs("graph.dot");
    //       graph->saveGraph(ofs);
     //      ofs.close();
     //   }
        //poses to file for plotting
        ofstream positionsFile("positions.txt", std::ios::app);
         //for (int key = 0; key < max_key; ++key) {
         if (positionsFile.is_open()) {
            gtsam::Pose3 pose = result.at<gtsam::Pose3>(X(graphManager.key("pose")));
            gtsam::Vector3 position = pose.translation();
            positionsFile << position.x() << " " << position.y() << " " << position.z() <<" "<< timestamp_ms << endl;
            ///ROS_INFO("Optimised height:  %f", position.z());
            positionsFile.close();
        }
     
      
     // velocity file
      gtsam::Vector3 optimised_velocity = result.at<gtsam::Vector3>(V(graphManager.key("velocity")));
      std::ofstream velocity_file("velocity.txt", std::ios::app);
     
      if (velocity_file.is_open()) {
 	   velocity_file << optimised_velocity.x() << " "
                  << optimised_velocity.y() << " "
                  << optimised_velocity.z() << " "
                  << timestamp_ms
                  <<std::endl;
    	velocity_file.close();
      }
      /**
      std::ofstream residualsFile("residuals1.txt");
      std::vector<double> residuals;
      size_t graph_size = graphManager.getGraph().size();
      std::cout << "Graph Size: " << graph_size << std::endl;
        for (size_t i = 0; i < graphManager.getGraph().size(); ++i) {
            gtsam::NonlinearFactor::shared_ptr factor = graphManager.getGraph().at(i);
            double error = factor->error(result);
            residuals.push_back(error);
            residualsFile << i << " " << error << std::endl; // Write pose number and residual
            ROS_INFO("Factor %zu error: %f", i, error);
        }
        residualsFile.close();
       **/
      
      //gtsam::Matrix poseCovariance = ISAM->marginalCovariance(X(graphManager.key("pose")));
     // gtsam::Matrix velocityCovariance = ISAM->marginalCovariance(V(graphManager.key("velocity")));
     // std::ofstream poseCovarianceFile("pose_covariance_per_pose.txt");
     // std::ofstream velocityCovarianceFile("velocity_covariance_per_pose.txt");
      /**
      for (int key = 0; key <= max_key; ++key) {
            //gtsam::Matrix poseCovariance = ISAM->marginalCovariance(X(key));
           // gtsam::Matrix velocityCovariance = ISAM->marginalCovariance(V(key));

            // Save pose covariance
            for (size_t i = 0; i < poseCovariance.rows(); ++i) {
                poseCovarianceFile << poseCovariance(i, i) << " "; // Diagonal elements
            }
            poseCovarianceFile << std::endl;

            // Save velocity covariance
            for (size_t i = 0; i < velocityCovariance.rows(); ++i) {
                velocityCovarianceFile << velocityCovariance(i, i) << " "; // Diagonal elements
            }
            velocityCovarianceFile << std::endl;
        }

        poseCovarianceFile.close();
        velocityCovarianceFile.close();
        **/
    //  gtsam::Marginals marginals(*graph, result);
     // std::vector<gtsam::Key> variables = { X(this->key("pose")) };
     //std::vector<Key> variables =  { X(static_cast<unsigned long>(this->key("pose"))), X(static_cast<unsigned long>(this->key("pose", -1))) };
      //KeyVector keys = { Symbol('x', 1), Symbol('x', 2) };
      //gtsam::Matrix jointCovariance = marginals.jointMarginalCovariance(keys);
     //Print the joint covariance matrix
     // std::cout << "Joint Marginal Covariance:\n" << jointCovariance << std::endl;
   //   gtsam::Matrix poseCovariance1 = marginals.marginalCovariance(X(this->key("pose")));
     // std::cout << "Pose Covariance:\n" << poseCovariance << std::endl;
      // Compute and print velocity covariance
  //    gtsam::Matrix velocityCovariance1 = marginals.marginalCovariance(V(this->key("velocity")));
    //  std::cout << "Velocity Covariance:\n" << velocityCovariance << std::endl;

        // Reset the graph
        
        graphManager.getGraph().resize(0);
        graphManager.getNewNodes().clear();
        
        //if (this->marginalize == true) {
        
        if (max_key % 500 == 0) {
            ROS_INFO("Performing marginalization at key 30");

            // Define the window size for the sliding window (e.g., keep only the last 5 poses)
            int window_size = 5;
            int oldest_key_to_keep = max_key - window_size;
            gtsam::Symbol symbol(this->marginalize);
            // Extract the integer index
            int marginaliseKey = static_cast<int>(symbol.index());
            //int oldest_key_to_keep = marginaliseKey - window_size;
            //gtsam::Values currentEstimate = this->ISAM->getLinearizationPoint();
            gtsam::FastList<gtsam::Key> keysToMarginalize;
            
            for (int i = 0; i <= oldest_key_to_keep; ++i) {  
                     gtsam::Key poseKey = X(i);
                     gtsam::Key velocityKey = V(i);
                     gtsam::Key biasKey = B(i);
                     gtsam::Key dvlKey = D(i);
                     gtsam::Key pressureKey = P(i);
                     // Check if the keys exist in the current ISAM result or values
                    if (this->ISAM->valueExists(poseKey)) {
                           keysToMarginalize.push_back(poseKey);
                     }
                    if (this->ISAM->valueExists(velocityKey)) {
                          keysToMarginalize.push_back(velocityKey);
                    }
                    if (this->ISAM->valueExists(biasKey)) {
                          keysToMarginalize.push_back(biasKey);
                   }
                   if (this->ISAM->valueExists(dvlKey)) {
                          keysToMarginalize.push_back(dvlKey);
                   }
                   if (this->ISAM->valueExists(pressureKey)) {
                          keysToMarginalize.push_back(pressureKey);
                   }
                   
               }
             
           
            // start adding to keysToMarginalize for next round in this variable.
            
            //this->ISAM->update();
            this->ISAM->marginalizeLeaves(keysToMarginalize);  // Marginalize out old keys
            this->marginalize == false;
            std::ofstream ofs("marginalisedgraph.dot");
            graphManager.getGraph().saveGraph(ofs);
            ofs.close();
          } 
        
        /**
        // Publish poses
        nav_msgs::Odometry optimised_odometry_msg;
        optimised_odometry_msg.header.stamp = ros::Time::now();
        optimised_odometry_msg.header.frame_id = "map_frame_id";
        optimised_odometry_msg.child_frame_id = "body_frame_id";
        
        gtsam::Pose3 current_pose = result.at<gtsam::Pose3>(X(graphManager.key("pose")));
        gtsam::Vector3 current_velocity = result.at<gtsam::Vector3>(V(graphManager.key("velocity")));
        ROS_INFO("Pose Id correct");
        
        // Extract position
        gtsam::Vector3 position = current_pose.translation();
        // Extract quaternion
        gtsam::Rot3 rotation = current_pose.rotation();
        gtsam::Quaternion quaternion = rotation.toQuaternion();
        
        // msg for pose_publisher
        geometry_msgs::Pose pose_msg;
        // Set position
        pose_msg.position.x = position.x();
        pose_msg.position.y = position.y();
        pose_msg.position.z = position.z();
        
        // Set orientation
        pose_msg.orientation.w = quaternion.w();
        pose_msg.orientation.x = quaternion.x();
        pose_msg.orientation.y = quaternion.y();
        pose_msg.orientation.z = quaternion.z();
        
        // Populate the twist message
        geometry_msgs::Twist twist_msg;
        twist_msg.linear.x = current_velocity.x();
        twist_msg.linear.y = current_velocity.y();
        twist_msg.linear.z = current_velocity.z();
        
        // Assign twist and pose message to the odometry message
        optimised_odometry_msg.twist.twist.linear = twist_msg.linear;
        optimised_odometry_msg.pose.pose = pose_msg;
        **/
        // Odometry msg covariance
        
        /**
        for (int i = 0; i < 6; ++i) {
            for (int j = 0; j < 6; ++j) {
                optimised_odometry_msg.pose.covariance[i * 6 + j] = poseCovariance(i, j);
                optimised_odometry_msg.twist.covariance[i * 6 + j] = poseCovariance(i, j);
            }
        }
        
        // Publish Optimised Path and change path
        nav_msgs::Path path;
        const std::string frame_id_prefix;
        path.header.stamp = graphManager.timestamp(max_key);
        path.header.frame_id = "map_frame_id";
        
        for (int key = 0; key <= max_key; ++key) {
            geometry_msgs::PoseStamped pose_stamped_msg;
            pose_stamped_msg.header.stamp = graphManager.timestamp(key);
            pose_stamped_msg.header.frame_id = frame_id_prefix + "_" + std::to_string(key);
            gtsam::Pose3 current_pose = result.at<gtsam::Pose3>(X(key));
            gtsam::Vector3 position = current_pose.translation();
            gtsam::Rot3 rotation = current_pose.rotation();
            gtsam::Quaternion quaternion = rotation.toQuaternion();
            
            // Set position
            pose_stamped_msg.pose.position.x = position.x();
            pose_stamped_msg.pose.position.y = position.y();
            pose_stamped_msg.pose.position.z = position.z();
            
            // Set orientation
            pose_stamped_msg.pose.orientation.w = quaternion.w();
            pose_stamped_msg.pose.orientation.x = quaternion.x();
            pose_stamped_msg.pose.orientation.y = quaternion.y();
            pose_stamped_msg.pose.orientation.z = quaternion.z();
            
            path.poses.push_back(pose_stamped_msg);
        }
        **/
       // this->pose_publisher_.publish(pose_msg);
       // this->optimised_odometry_publisher_.publish(optimised_odometry_msg);
       // this->path_publisher_.publish(path);
      
        
    } catch (const gtsam::IndeterminantLinearSystemException& ex) {
        result.print();
        ROS_INFO("Did not solve correctly");
    }
   
 /**   
   if ((max_key) % 30 == 0) {
          ROS_INFO("Performing batch re-optimization at key 30");

          gtsam::Values initialEstimate;
         for (int i = 0; i <= max_key; ++i) {
               // Define the keys
              gtsam::Key poseKey = X(i);
              gtsam::Key velocityKey = V(i);
              gtsam::Key biasKey = B(i);

             // Insert only if the key exists in the current result
             if (result.exists(poseKey)) {
                   initialEstimate.insert(poseKey, result.at<gtsam::Pose3>(poseKey)); // Current pose estimate
             }
            if (result.exists(velocityKey)) {
                initialEstimate.insert(velocityKey, result.at<gtsam::Vector3>(velocityKey)); // Current velocity estimate
             }
           if (result.exists(biasKey)) {
                initialEstimate.insert(biasKey, result.at<gtsam::imuBias::ConstantBias>(biasKey)); // Current bias estimate
           }
         }

     try {
        // Run batch optimization using Levenberg-Marquardt optimizer
        gtsam::LevenbergMarquardtOptimizer batchOptimizer(graphManager.getGraph(), initialEstimate);
        result = batchOptimizer.optimize();

        // Update ISAM2 with optimized result
        this->ISAM->update();
        ROS_INFO("Batch re-optimization completed");

      } catch (const gtsam::IndeterminantLinearSystemException& ex) {
           ROS_ERROR("Batch re-optimization failed due to an indeterminate linear system");
          return;
       }
 } **/
 
}


