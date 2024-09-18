// Dean Makoni
// 1 July 2024

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
#include"/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/back_end/DVLFactor.h"
#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/back_end/graphmanager.hpp"
#include"/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/back_end/optimisation.hpp"
#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/front_end/DVL.h"
#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/front_end/IMU.h"
#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/front_end/Pressure.h"
#include"/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/front_end/sssimageprocessing.h"
#include"/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/front_end/SSSFrame.h"

#include <opencv2/opencv.hpp>
#include <cmath>
#include <vector>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <omp.h>
#include <GeographicLib/UTMUPS.hpp>

using namespace std;
using namespace gtsam;
using gtsam::symbol_shorthand::B;  // Bias  (ax,ay,az,gx,gy,gz)
using gtsam::symbol_shorthand::V;  // Vel   (xdot,ydot,zdot)
using gtsam::symbol_shorthand::X;  // Pose3 (x,y,z,r,p,y)//
using gtsam::symbol_shorthand::P;  // Pressure bias
using gtsam::symbol_shorthand::D;  // DVL
using gtsam::symbol_shorthand::L;  // Landmark point


class ROSVO {
public:
    ROSVO(ros::NodeHandle nh);
    virtual ~ROSVO();

    
    int pressure_bias = 0; // barometric bias that will be constrained
    int pressure_count = 0;
   
    // Thread Management
    mutable std::mutex stereo_mutex;
    mutable std::mutex imu_mutex;
    mutable std::mutex sss_mutex;
    mutable std::mutex depth_mutex;
    mutable std::mutex velocity_mutex; 
    gtsam::Key biasKey = gtsam::Symbol('b', 0);
    int p = 1; // ISAM counter
    int b = 0; // barometer count
    ros::Time prev_imu_timestamp;
    ros::Time initialisation_time;
    gtsam::Pose3 body_P_sensor;
    
   // Scenario testing
   double total_time = 10.0; // Total time for simulation
   double dt = 0.01; // Time step
   double current_time = 0.0; // Initialize current time
   int z = 1;
   bool initialised = false;
   std::shared_ptr<ConstantTwistScenario> scenario;
   // Scenarios
   std::shared_ptr<ConstantTwistScenario>  zeroTwist;
   std::shared_ptr<ConstantTwistScenario> forwardMotion;
   std::shared_ptr<ConstantTwistScenario>  loop;  // -30 degrees in radians
   std::shared_ptr<ConstantTwistScenario>  sick;
   // std::shared_ptr<ScenarioRunner>  runner
   std::unique_ptr<ScenarioRunner> runner;
   // Create a std::vector to hold SSSFrame objects
   std::vector<SSSFrame> frames; 
   
   
protected:
   
    // ----> Thread functions
   
    void dvlCallback(const cola2_msgs::DVL::ConstPtr& msg);
    void imuCallback(const sensor_msgs::Imu::ConstPtr& msg);
    void SSSimageCallback(const sensor_msgs::Image::ConstPtr& msg);
    void pressureCallback(const sensor_msgs::FluidPressure::ConstPtr& msg);
    void groundCallback(const nav_msgs::Odometry::ConstPtr& msg);
    

private:
    
   

    bool prev_image = false;
    uint64_t prev_timestamp;

    // node handle 
    ros::NodeHandle nh_;

    // Subscribers
    std::string stereo_topic_;
    ros::Subscriber image_stereo_subscriber;

    // IMU subscriber
    std::string imu_topic;
    ros::Subscriber imu_subscriber;

    // sonar subscriber
    std::string sonar_topic;
    ros::Subscriber sonar_subscriber;
    
    // dvl subsriber
    std::string dvl_topic;
    ros::Subscriber dvl_subscriber;
    
    // Pressure subscriber
    std::string depth_topic;
    ros::Subscriber depth_subscriber;

    // Publishers
    std::string vo_tf2_topic_;
    ros::Publisher vo_tf2_publisher_;

    

    std::string matched_points_topic_;
    ros::Publisher matched_points_publisher_;

    std::string kf_tf2_topic_;
    ros::Publisher kf_tf2_publisher_;

   
    
    //ground truth 
     ros::Subscriber ground_truth_sub;
     ros::Publisher ground_path_pub_;
     nav_msgs::Path path_;

    // keyframe selectors
    float min_distance_;
    float min_rotation_;
    Eigen::Affine3f curr_position_;

    // image_downsample
    int down_sample_;
    uint count;
  
  
    std::shared_ptr<GraphManager> graphManager;
    std::shared_ptr<Optimisation> optimisation;
    std::shared_ptr<IMU> Imu;
    std::shared_ptr<PRESSURE> Pressure;
    std::shared_ptr<DVL> dvl;
    std::shared_ptr<SSSImageProcessing> ImageProcessing;
    
};

ROSVO::ROSVO(ros::NodeHandle nh): nh_(nh){

    
  ROS_WARN("ROS Node running");
  stereo_topic_ = "camera/zed/image_rectified";
  imu_topic = "/girona500/navigator/imu";
  sonar_topic = "/girona500/SSS/image";
  depth_topic = "/girona500/navigator/pressure";
  dvl_topic = "/girona500/navigator/dvl";
  vo_tf2_topic_ = "vo/tf2";
  kf_tf2_topic_ = "kf/tf2";


  min_distance_ = 2.0;
  min_rotation_ = 0.2536;

  count = 0;
  down_sample_ = 15;
  
  // Initialize publishers and subscribers
   
  imu_subscriber = nh_.subscribe<sensor_msgs::Imu>(imu_topic, 100, &ROSVO::imuCallback, this);
  //imu_subscriber = nh_.subscribe<sensor_msgs::Imu>("/imu_adis_ros", 100, &ROSVO::imuCallback, this);
  sonar_subscriber = nh_.subscribe(sonar_topic, 100, &ROSVO::SSSimageCallback, this);
  dvl_subscriber = nh_.subscribe(dvl_topic, 100, &ROSVO::dvlCallback, this);
  depth_subscriber = nh_.subscribe( depth_topic, 100, &ROSVO::pressureCallback, this);
  ground_truth_sub = nh_.subscribe("/girona500/navigator/odometry",100 , &ROSVO::groundCallback, this);
  //ground_truth_sub = nh_.subscribe("/odometry",100 , &ROSVO::groundCallback, this);

  vo_tf2_publisher_ = nh_.advertise<geometry_msgs::TransformStamped>("vo_tf2_topic", 10);
  //pose_publisher_ = nh_.advertise<geometry_msgs::Pose>("pose_topic", 10);
  matched_points_publisher_ = nh_.advertise<sensor_msgs::PointCloud2>("matched_points_topic", 10);
  kf_tf2_publisher_ = nh_.advertise<geometry_msgs::TransformStamped>("kf_tf2_topic", 10);
  //optimised_odometry_publisher_ = nh_.advertise<nav_msgs::Odometry>("optimised_odometry_topic", 10);
  //path_publisher_ = nh_.advertise<nav_msgs::Path>("path_topic", 10);
  ground_path_pub_ = nh_.advertise<nav_msgs::Path>("ground_path", 10);
  path_.header.frame_id = "map_frame_id";
    
  ROS_INFO("Subscribers and Publishers initialized.");
    
     
  // Instantiate GraphManager using a unique pointer
  graphManager = std::make_shared<GraphManager>();
  // Instantiate Optimisation using a unique pointer
  optimisation = std::make_shared<Optimisation>();
  ImageProcessing = std::make_shared<SSSImageProcessing>();
  // Initialise factor graph keys
  graphManager->set_named_key("barometer", 0, 1);
  graphManager->set_named_key("pose", 0, 1);
  graphManager->set_named_key("velocity", 0, 1);
  graphManager->set_named_key("imu_bias", 0, 1);
  graphManager->set_named_key("landmark", 0, 1);
  graphManager->set_named_key("dvl", 0, 1);
  
  // intialise key for Timestamp
  graphManager->set_timestamp(0, ros::Time(0, 0));
    
   // We use the sensor specs to build the noise model for the IMU factor.
   double accel_noise_sigma = 0.00001;
   double gyro_noise_sigma = 0.00001;
   double accel_bias_rw_sigma = 0.00001;
   double gyro_bias_rw_sigma = 0.000000001;
   gtsam::imuBias::ConstantBias prior_imu_bias;
   gtsam::imuBias::ConstantBias prev_bias;
   
    
   // Instantiate IMU using a unique pointer
   Imu = std::make_shared<IMU>(
        accel_noise_sigma, 
        gyro_noise_sigma, 
        accel_bias_rw_sigma, 
        gyro_bias_rw_sigma, 
        prior_imu_bias, 
        prev_bias
    );
   // Instantiate Pressure sensor using a unique pointer
   Pressure = std::make_shared<PRESSURE>();
   // Instantiate DVL sensor using a unique pointer
   dvl = std::make_shared<DVL>();
   
   double angleStdDev = 0.000001745; // rad
   double angularVelocityStdDev = 0.00001745; // rad/s

   // Set up the standard deviation vectors
   Vector3 angleStdDevVec(angleStdDev, angleStdDev, angleStdDev);
   Vector3 angularVelocityStdDevVec(angularVelocityStdDev, angularVelocityStdDev, angularVelocityStdDev);

   // Calculate the covariance matrices
   Matrix33 angleCov = I_3x3  * std::pow(angleStdDev, 2);
   Matrix33 angularVelocityCov = I_3x3 * std::pow(angularVelocityStdDev, 2);
    
   // Define the translation (convert mm to meters)
   gtsam::Point3 translation(-0.89865, -0.37725, -0.78355);
  
   // Define the rotation in RPY (convert degrees to radians)
   double roll = 0.0 * M_PI / 180.0;
   double pitch = 0.0* M_PI / 180.0;
   double yaw = 180.0 * M_PI / 180.0;
   gtsam::Rot3 rotation = gtsam::Rot3::Yaw(yaw) * gtsam::Rot3::Pitch(pitch) * gtsam::Rot3::Roll(roll);

   // Combine into a Pose3 object
   gtsam::Pose3 body_P_sensor(rotation, translation);
   //body_P_sensor = gtsam::Pose3(gtsam::Rot3(), gtsam::Point3(0.0, 0.0, 0.0));     
   // Vector3 linearVelocityVector(1.0, 0.0, 0.0);  // Example linear velocity
   //  Vector3 angularVelocityVector(0.0, 0.0, 0); // Example angular velocity
   // Define linear velocity (2 m/s along the x-axis)
   // Define linear velocity (2 m/s along the x-axis)
   Vector3 linearVelocity(2, 0.0, 0.0);

   // Define angular velocities for different scenarios
   Vector3 zeroOmega(0, 0, 0);  // No rotation
   Vector3 loopOmega(0, -M_PI / 6, 0);  // Loop: -30 degrees/s around y-axis
   Vector3 sickOmega(M_PI / 6, -M_PI / 6, 0);  // Spiral: 30 degrees/s around x and -30 degrees/s around y

   // Create different scenarios
   zeroTwist =  std::make_shared<ConstantTwistScenario>(zeroOmega, zeroOmega);  // Stationary
   forwardMotion = std::make_shared<ConstantTwistScenario>(zeroOmega, linearVelocity);  // Forward motion
   loop = std::make_shared<ConstantTwistScenario>(loopOmega, linearVelocity);  // Loop motion
   sick = std::make_shared<ConstantTwistScenario>(sickOmega, linearVelocity);  // Spiral motion
   // scenario = std::make_shared<ConstantTwistScenario>(angularVelocityVector, linearVelocityVector);
   
   
    
    Matrix33 measured_acc_cov = I_3x3 * pow(accel_noise_sigma, 2);
    Matrix33 measured_omega_cov = I_3x3 * pow(gyro_noise_sigma, 2);
    Matrix33 integration_error_cov = I_3x3 * 1e-8;  // error committed in integrating position from velocities
    Matrix33 bias_acc_cov = I_3x3 * pow(accel_bias_rw_sigma, 2);
    Matrix33 bias_omega_cov = I_3x3 * pow(gyro_bias_rw_sigma, 2);
    Matrix66 bias_acc_omega_init = I_6x6 * 1e-5;  // error in the bias used for preintegration
    auto p = PreintegratedCombinedMeasurements::Params::MakeSharedD(9.81); // set gravity here
   
   // gravity vector 
 //  gtsam::Vector3 gravityVector(0, 0, -9.81);  // Gravity vector in NED frame
 //  p->n_gravity = gravityVector;
   // PreintegrationBase params:
   p->accelerometerCovariance =
        measured_acc_cov;  // acc white noise in continuous
   p->integrationCovariance =
      integration_error_cov;  // integration uncertainty continuous
   // should be using 2nd order integration
   // PreintegratedRotation params:
   p->gyroscopeCovariance =
      measured_omega_cov;  // gyro white noise in continuous
   // PreintegrationCombinedMeasurements params:
   p->biasAccCovariance = bias_acc_cov;      // acc bias in continuous
   p->biasOmegaCovariance = bias_omega_cov;  // gyro bias in continuous
   p->biasAccOmegaInt = bias_acc_omega_init;
   
   // Create a ScenarioRunner
  //CombinedScenarioRunner  runner( forwardMotion,p, dt, prior_imu_bias);
   runner = std::make_unique<ScenarioRunner>(*sick,p, dt, prior_imu_bias); 
}

ROSVO::~ROSVO() {
    // Destructor
}


// Callback function for IMU data
void ROSVO::imuCallback(const sensor_msgs::Imu::ConstPtr& msg) {

  ROS_INFO("IMU Data");
  // Lock the thread
  imu_mutex.lock();           
 
 if (initialised == true && msg->header.stamp >= initialisation_time){
 
 	int next_pose_key = graphManager->key("pose");
 	int next_velocity_key = graphManager->key("velocity");
 	int next_bias_key = graphManager->key("imu_bias");
 	auto current_timestamp = msg->header.stamp;
 	// Get NavState at current time
 
 if (next_pose_key == 0){
       
       std::cout << "initial pose key: " <<next_pose_key << std::endl;
       std::cout << "initial velocity key: " <<next_velocity_key << std::endl;
       NavState initial_state = sick->navState(0);
       // Get NavState at current time
       //geometry_msgs::Quaternion orient = msg->orientation; 
       //geometry_msgs::Quaternion orient = msg->orientation; 
       //prior_pose = Pose3(gtsam::Rot3::Quaternion(orient.x, orient.y,orient.z,orient.w), Point3(0, 0,0));
       //prior_pose = Pose3(gtsam::Rot3::Ypr(1, 1,10), Point3(0, 0,0));
       //prior_velocity = Vector3(0,0,0);
       //prior_pose = Pose3(Rot3(), Point3(0, 0,0));
       //prior_pose = Pose3(gtsam::Rot3::Ypr(1, 1,1), Point3(0, 0,0));
       //prior_velocity = Vector3(0,0,0);
       // prior_pose = initial_state.pose();
       // prior_velocity = initial_state.v();
       
       double height = 10;
       optimisation->prev_state = NavState(optimisation->prior_pose, optimisation->prior_velocity);
       optimisation->prop_state = optimisation->prev_state;
       
       graphManager->getNewNodes().insert(X(next_pose_key), optimisation->prior_pose);
       graphManager->getNewNodes().insert(V(next_velocity_key),optimisation->prior_velocity);
       graphManager->getNewNodes().insert(B(next_bias_key), imuBias::ConstantBias());
       //graph->emplace_shared< PriorFactor<Pose3> >(X(next_pose_key),initial_state.pose(), pose_noise);
       //graph->emplace_shared< PriorFactor<Vector3> >(V(next_velocity_key), initial_state.v(), velocity_noise_model);
       graphManager->getGraph().emplace_shared< PriorFactor<Pose3> >(X(next_pose_key),optimisation->prior_pose, Imu->pose_noise);
       graphManager->getGraph().emplace_shared< PriorFactor<Vector3> >(V(next_velocity_key), optimisation->prior_velocity, Imu->velocity_noise_model);
       graphManager->getGraph().emplace_shared< PriorFactor<imuBias::ConstantBias> >(B(next_bias_key), Imu->prior_imu_bias, Imu->bias_noise_model);
       
      
      std::ofstream ofs("graph1.dot");
      graphManager->getGraph().saveGraph(ofs);
      ofs.close();
           
      graphManager->increment("pose");
      graphManager->increment("velocity");
      graphManager->increment("imu_bias");      
      prev_imu_timestamp = msg->header.stamp;
       
    }
    
    
 else{
 
  // Ensure current timestamp is greater than the previous timestamp
  
 double dt1;
 if (current_timestamp.toSec() <= prev_imu_timestamp.toSec()) {
        ROS_WARN("Current IMU timestamp is not greater than the previous timestamp. Skipping this IMU message.");
        dt1 = 0.005;
        }
        
   else{
       // Calculate dt
        dt1 = (msg->header.stamp - prev_imu_timestamp).toSec();
        std::cout<< dt1<<endl;
        std::cout<< msg->header.stamp<<endl;
        std::cout<< msg->linear_acceleration<<endl;
        std::cout<< msg->angular_velocity<<endl;
        
        // Access linear acceleration covariance directly
  std::cout << "Linear Acceleration Covariance:" << std::endl;
  for (size_t i = 0; i < 9; ++i) {
    std::cout << msg->linear_acceleration_covariance[i] << " ";
    if ((i + 1) % 3 == 0) {
      std::cout << std::endl;
    }
  }

  // Access angular acceleration covariance directly
  std::cout << "Angular Acceleration Covariance:" << std::endl;
  for (size_t i = 0; i < 9; ++i) {
    std::cout << msg->angular_velocity_covariance[i] << " ";
    if ((i + 1) % 3 == 0) {
      std::cout << std::endl;
    }
  }
        
   }
  
  prev_imu_timestamp = msg->header.stamp;
 
 //RCLCPP_INFO(get_logger(), "IMU topic received");
 Vector3 measuredAcc (msg->linear_acceleration.x, msg->linear_acceleration.y, msg->linear_acceleration.z);
 Vector3 measuredOmega (msg->angular_velocity.x, msg->angular_velocity.y, msg->angular_velocity.z);
 

 //Check the time stamp 
 // Get IMU measurements from the scenario runner
 //Vector3 measuredOmega = runner->measuredAngularVelocity(current_time);
 //Vector3 measuredAcc = runner->measuredSpecificForce(current_time);
 
 Imu->getPreintegrated()->integrateMeasurement(measuredAcc,measuredOmega, dt1);
 
  
 // File to save NavStates
 std::ofstream navStateFile("navstates.txt",std::ios::app);
 
 // Get NavState at current time
 NavState state = sick->navState(current_time + dt);
  
  if (navStateFile.is_open())
  {
            
 // Log NavState pose
 navStateFile << state.pose().translation().transpose() << std::endl;
 
 }
 current_time += dt;

 
 ROS_INFO("Intergrated");
 
  } 
 }
 // unlock the thread 
 imu_mutex.unlock();
 
}
             


// Callback function for Fluid Pressure data
void ROSVO::pressureCallback(const sensor_msgs::FluidPressure::ConstPtr& msg) {
    ROS_INFO("Pressure Data");
   Pressure->AddPressureMessage(*msg); 
    // Lock the thread  
 depth_mutex.lock();
 ROS_INFO("Barometer topic received");
 // get latest barometer key
// if (msg->header.stamp >= this->timestamp("pose")){
 
    
// }
 
// else{
 //   ROS_WARN("Pressure message timestamp is less than the keyframe timestamp");
//  } 
 
 depth_mutex.unlock();
}

// Callback function for DVL data
void ROSVO::dvlCallback(const cola2_msgs::DVL::ConstPtr& msg) {
    ROS_INFO("DVL Data: [velocity x: %f, y: %f, z: %f]", 
             msg->velocity.x, 
             msg->velocity.y, 
             msg->velocity.z);
   
   velocity_mutex.lock();
  // if (msg->header.stamp >= this->timestamp("pose")){
  // Create a local copy of the message
    cola2_msgs::DVL modified_msg;

    // Add 5 to each velocity component
    modified_msg.velocity.x += 5.0;
    modified_msg.velocity.y += 8.0;
    modified_msg.velocity.z += 9.0;
    
    dvl->AddDVLMessage(*msg);
    
//    } 
//   else{
 //    ROS_WARN("DVL message timestamp is less than the keyframe timestamp");
 //  } 
   velocity_mutex.unlock();       
}


// Ground Truth callback 
void ROSVO::groundCallback(const nav_msgs::Odometry::ConstPtr& msg)
    {
     
     if (initialised == false){
       
        const geometry_msgs::Pose& pose = msg->pose.pose;
        double x = pose.position.x;
        double y = pose.position.y;
        double z = pose.position.z;
        
        // Extract orientation in quaternion
      const geometry_msgs::Quaternion& quat = pose.orientation;
      gtsam::Rot3 rotation(quat.w, quat.x, quat.y, quat.z);

      // Construct the GTSAM Pose3
      optimisation->prior_pose = Pose3(rotation, Point3(x, y, z));
        
       
      const geometry_msgs::Twist& twist = msg->twist.twist;
      optimisation->prior_velocity = Vector3(twist.linear.x, twist.linear.y, twist.linear.z);
       
       // store initalisation time
       initialisation_time = msg->header.stamp; 
       initialised = true;
     }
     // Open the file in append mode
    std::ofstream groundTruthFile("ground_truth.txt", std::ios::app);

    if (groundTruthFile.is_open())
    {
        // Write the position data to the file
        groundTruthFile << msg->pose.pose.position.x << " "
                        << msg->pose.pose.position.y << " "
                        << msg->pose.pose.position.z << std::endl;

        // Close the file
        groundTruthFile.close();
    
    }
  }
// Callback function for Image data
// Using SSS image as a call back function
void ROSVO::SSSimageCallback(const sensor_msgs::Image::ConstPtr& msg) {
    
     sss_mutex.lock();
     // Convert ROS image message to OpenCV image
     cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
     //cv::Mat sssImage = cv_ptr->image;
     std::string imagePath = "/home/jetson/Desktop/sss3.jpg";  // Modify this path
     cv::Mat sssImage = cv::imread(imagePath);
    
     if (sssImage.empty()) {
          ROS_ERROR("Received empty SSS image.");
         return;
      }
            
    // Check it has been initialised
    int next_pose_key = graphManager->key("pose");
    int next_velocity_key = graphManager->key("velocity");
    int next_bias_key = graphManager->key("imu_bias");
    int next_barometer_key = graphManager->key("barometer");
    int next_dvl_key = graphManager->key("dvl");
    std::cout << "pose key: " <<next_pose_key << std::endl;
    std::cout << "velocity key: " <<next_velocity_key << std::endl;
    if (next_pose_key > 0){ 
     
      //TODO: Set timestamp for this pose that we want to optimise
      graphManager->set_timestamp("pose", msg->header.stamp);
      ros::Time sonar_timestamp = msg->header.stamp;
      // add imu factors
      Imu->AddCombinedIMUFactor(graphManager->getGraph(), X(graphManager->key("pose", -1)),
                             V(graphManager->key("pose", -1)), X(graphManager->key("pose")), V(graphManager->key("velocity")),
                             B(graphManager->key("imu_bias", -1)), B(graphManager->key("imu_bias")));
      // add IMU values to graph
      Imu->AddValuesToNodes(optimisation->prev_state, 
                            optimisation->prop_state, 
                            graphManager->getNewNodes(), 
                            X(graphManager->key("pose")), V(graphManager->key("velocity")),
                            B(graphManager->key("imu_bias")) );
      // add pressure factors      
      Pressure->AddPressureFactor(graphManager->getGraph(), X(graphManager->key("pose")), P(graphManager->key("barometer")),sonar_timestamp);
      //add Pressure values
      Pressure->AddPressureValues(graphManager->newNodes, P(graphManager->key("barometer")));
      //add DVL factors
      dvl->AddDVLFactor(graphManager->getGraph(), sonar_timestamp,
                     X(graphManager->key("pose")), D(graphManager->key("dvl")), body_P_sensor);
     //add DVL values
      dvl->AddDVLValues(graphManager->newNodes,D(graphManager->key("dvl")));
     
     
    
    //cv::Mat L_slope = ImageProcessing->computeSlantRange(sssImage, 13.6364, 1531,1, 100);
     /// Call SSS image processing functions
   //cv::Mat correctedImage = correctDistortion(sssImage,depth, L_slope);
    cv::Mat nadirRemoved = ImageProcessing->removeNadir(sssImage);
    cv::Mat brightnessEqualised = ImageProcessing->equalizeColumnBrightness(nadirRemoved);
   // Display the image
    cv::imshow("SSS Image", sssImage);
    cv::waitKey(1);
    cv::imshow("Nadir Removed", nadirRemoved);
    cv::waitKey(1);
    cv::imshow("Brightness Equalised", brightnessEqualised);
    cv::waitKey(1);
    
    if (!frames.empty()) {
    // Assign temporal global id  by using previous pose
     gtsam::Pose3 temp_pose = optimisation->prop_state.pose();
     gtsam::Point3 translation = temp_pose.translation();
     // Extract the x and y coordinates
     double x_t = translation.x();
     double y_t = translation.y();
     // store the georeferenced image
     double lat, lon, alt1;
     int zone;
     bool northp;
     GeographicLib::UTMUPS::Reverse(x_t, y_t, zone, northp, lat, lon);
     SSSFrame sourceFrame(brightnessEqualised,X(graphManager->key("pose")), lat, lon, alt1);
     // compare with prev frame fisrst
     SSSFrame& prevFrame = frames.back();
     // Compute phase correlation and translation
     cv::Point2d phase_translation = ImageProcessing->phaseCorrelation(brightnessEqualised, prevFrame.image);
     gtsam::Point2 measured_translation(phase_translation.x, phase_translation.y);
     // add factor to graph
     ImageProcessing->AddSSSFactor(graphManager->getGraph(),sourceFrame.poseKey , prevFrame.poseKey , measured_translation);
     ImageProcessing->AddSSSValues(graphManager->newNodes, prevFrame.poseKey, 
             optimisation->getResult().at<gtsam::Pose3>(prevFrame.poseKey));
   
     #pragma omp parallel for
     for (int i = 0; i < frames.size()-1; ++i) {
        // Calculate X and Y distances between the source frame and the current frame
        auto distanceXY = SSSFrame::calculateXYDistance(sourceFrame, frames[i]);
        double dx = distanceXY.first;  // X distance (East-West)
        double dy = distanceXY.second; // Y distance (North-South)

        // Check if the distances are within the threshold
        if (std::abs(dx) <= 5) {
            // Compute phase correlation and translation
            cv::Point2d translation = ImageProcessing->phaseCorrelation(brightnessEqualised, frames[i].image);
            gtsam::Point2 measured_translation(translation.x, translation.y);
            // add factor to graph
            ImageProcessing->AddSSSFactor(graphManager->getGraph(),sourceFrame.poseKey ,frames[i].poseKey , measured_translation);
            ImageProcessing->AddSSSValues(graphManager->newNodes, frames[i].poseKey, 
             optimisation->getResult().at<gtsam::Pose3>(frames[i].poseKey));
            #pragma omp critical
            {   
                std::cout << "Overlap with frame " << i << " (Key: " << frames[i].poseKey << ")\n";
                std::cout << "X distance: " << dx << " meters, Y distance: " << dy << " meters\n";
                
            }
        }
    }
     
    } 
   

     // Optimise and publish
     optimisation->Optimise_and_publish(*graphManager,*Imu);
    
     gtsam::Pose3 optimised_pose = optimisation->getResult().at<gtsam::Pose3>(X(graphManager->key("pose")));
     gtsam::Point3 translation = optimised_pose.translation();
     // Extract the x and y coordinates
     double x_t = translation.x();
     double y_t = translation.y();
     // store the georeferenced image
     double lat, lon, alt1;
     int zone;
     bool northp;
     GeographicLib::UTMUPS::Reverse(x_t, y_t, zone, northp, lat, lon);
     SSSFrame frame(brightnessEqualised,X(graphManager->key("pose")), lat, lon, alt1);
     // Add frames to the vector
     frames.emplace_back(frame);   
     
     // Increment keys
     graphManager->increment("pose");
     graphManager->increment("velocity");
     graphManager->increment("imu_bias");
     graphManager->increment("barometer");
     graphManager->increment("dvl");
     
     
     }
 sss_mutex.unlock();
}


int main(int argc, char** argv) {

    ros::init(argc, argv, "odometry_node");
    ros::NodeHandle nh;
    ROSVO odometry_node(nh);
    ros::spin();
    return 0;
    
}
