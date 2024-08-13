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



class DVLFactor : public NoiseModelFactor2<gtsam::Pose3, gtsam::Vector3>{
private:
    gtsam::Vector3 measured_velocity_; // Measured velocity from the DVL
    gtsam::Pose3 body_P_sensor_; // Transform from body to sensor frame

public:
    // Constructor
    DVLFactor(gtsam::Key pose_key, gtsam::Key velocity_key,
              const gtsam::Vector3& measured_velocity,
              const gtsam::Pose3& body_P_sensor,
              const gtsam::SharedNoiseModel& model)
        : gtsam::NoiseModelFactor2<gtsam::Pose3, gtsam::Vector3>(model, pose_key, velocity_key),
          measured_velocity_(measured_velocity), body_P_sensor_(body_P_sensor) {}

    // Error function
    // Error function
    gtsam::Vector evaluateError(const gtsam::Pose3& pose, const gtsam::Vector3& velocity,
                                boost::optional<gtsam::Matrix&> H1 = boost::none,
                                boost::optional<gtsam::Matrix&> H2 = boost::none) const override {
        // Predict velocity in sensor frame
        gtsam::Vector3 predicted_velocity = body_P_sensor_.rotation().unrotate(pose.rotation().rotate(velocity));

        // Calculate error
        gtsam::Vector3 error = predicted_velocity - measured_velocity_;

        // Jacobian computation
        if (H1 || H2) {
            // Compute the Jacobian w.r.t the pose
            if (H1) {
                *H1 = (gtsam::Matrix(3, 6) << -body_P_sensor_.rotation().transpose() * pose.rotation().matrix(), gtsam::Matrix3::Zero()).finished();
            }
            // Compute the Jacobian w.r.t the velocity
            if (H2) {
                *H2 = body_P_sensor_.rotation().transpose() * pose.rotation().matrix();
            }
        }

        return error;
    }
    
};



class ROSVO {
public:
    ROSVO(ros::NodeHandle nh);
    virtual ~ROSVO();

    std::shared_ptr<gtsam::PreintegrationType> preintegrated;
    int pressure_bias = 0; // barometric bias that will be constrained
    int pressure_count = 0;
    gtsam::imuBias::ConstantBias prior_imu_bias;
    gtsam::imuBias::ConstantBias prev_bias;
   
    // Thread Management
    mutable std::mutex stereo_mutex;
    mutable std::mutex imu_mutex;
    mutable std::mutex depth_mutex;
    mutable std::mutex velocity_mutex;
    
    // Create iSAM2 object
    gtsam::ISAM2* ISAM = 0;
    gtsam::Key biasKey = gtsam::Symbol('b', 0);
    int p = 1; // ISAM counter
    int b = 0; // barometer count
    // Initialize factor graph and values estimates on nodes (continually updated by isam.update())
    gtsam::NonlinearFactorGraph* graph = new gtsam::NonlinearFactorGraph();
    gtsam::Values newNodes;
    gtsam::Values result; // current estimate of values
    gtsam::Pose3 prev_camera_pose;
    gtsam::Pose3 prior_pose;
    gtsam::Vector3 prior_velocity;
    double prior_pressure; // change this value accordingly
    bool start; // used to initialise visoextractor_
    int landmark_id; // landmark ID represents the index in the FeatureSPtrVectorSptr
    int frame_index_; // indexing frames for initialisation
    // Initialize VIO Variables
    double fx;
    double fy; // Camera calibration intrinsics
    double cx;
    double cy;
    double resolution_x; // Image distortion intrinsics
    double resolution_y;
    double Tx; // Camera calibration extrinsic: distance from cam0 to cam1
    gtsam::Matrix4 T_cam_imu_mat; // Transform to get to camera IMU frame from camera frame
    double pressure; 
    gtsam::Vector3 dvl_velocity;
    std::vector<cola2_msgs::DVL> dvl_messages_;
    std::vector<sensor_msgs::FluidPressure> pressure_messages_;
    ros::Time prev_imu_timestamp;
    ros::Time initialisation_time;
    gtsam::Pose3 body_P_sensor;
    gtsam::NavState  prev_state;
    gtsam::NavState prop_state;
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
    // Global vector to store corrected images
    std::vector<cv::Mat> CorrectedImages;
protected:
    /**
     * Optimise using ISAM2 and publish
     */
    void Optimise_and_publish();

    /**
     * @brief Structure to hold information about a named key. Named keys are used to keep track of the index for which
     * data should be added to the graph.
     */
    struct NamedKeyInfo {
        NamedKeyInfo(const int key = 0, const unsigned int priority = 0) : key(key), priority(priority) {}

        // Key/index used to acquire gtsam::Key in graph
        int key;

        // Priority of the named key, used in various operations. 0 is maximum priority.
        unsigned int priority;
    };

    // associative container to store keys
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
    const ros::Time& timestamp(const int key) const;

    /**
     * @brief Get the timestamp associated with a named key.
     *
     * @param name
     * @return const ros::Time&
     */
    const ros::Time& timestamp(const std::string& key, const int offset = 0) const;

    // Set timestamps
    void set_timestamp(const int key, const ros::Time& timestamp);
    void set_timestamp(const std::string& key, const ros::Time& timestamp, const int offset = 0);

    /**
     * @brief Increment a named key.
     *
     * @param name
     */
    void increment(const std::string& name);

    /**
     * @brief Get the key value for a named key.
     *
     * @param name
     * @return int
     */
    int key(const std::string& name, const int offset = 0) const;

    /**
     * @brief Return the smallest key value of the named keys with priority <= priority arg (highest = 0).
     *
     * @return int maximum priority of named keys used in the evaluation of the minimum key.
     */
    int minimum_key(const unsigned int priority = std::numeric_limits<unsigned int>::max()) const;

    /**
     * @brief Set/create a named key.
     *
     * @param name
     * @param value
     */
    void set_named_key(const std::string& name, const int key = 0, const unsigned int priority = 0);

   
    // ----> Thread functions
   
    void dvlCallback(const cola2_msgs::DVL::ConstPtr& msg);
    void imuCallback(const sensor_msgs::Imu::ConstPtr& msg);
    void SSSimageCallback(const sensor_msgs::Image::ConstPtr& msg);
    void pressureCallback(const sensor_msgs::FluidPressure::ConstPtr& msg);
    void groundCallback(const nav_msgs::Odometry::ConstPtr& msg);
    // IMU biases
    
    // Side Scan Sonar Image processing functions
    cv::Mat correctDistortion(const cv::Mat& sssImage, double H, const cv::Mat& L_slope);
    void equalizeColumnBrightness(cv::Mat& image);
    cv::Point2d phaseCorrelation(const cv::Mat& img1, const cv::Mat& img2);
    cv::Mat computeSlantRange(const cv::Mat& sssImage, double sonarFrequency, double soundSpeed, double minSlantRange, double maxSlantRange);
    cv::Mat removeNadir(const cv::Mat& img);

private:
    // Noise models
    gtsam::noiseModel::Isotropic::shared_ptr prior_landmark_noise = gtsam::noiseModel::Isotropic::Sigma(3, 0.1);
    //gtsam::noiseModel::Diagonal::shared_ptr pose_noise = gtsam::noiseModel::Diagonal::Sigmas(
    //    (gtsam::Vector(6) << 0.01, 0.01, 0.01, 0.5, 0.5, 0.5).finished() // (roll,pitch,yaw in rad; std on x,y,z in meters)
   // );
    gtsam::noiseModel::Isotropic::shared_ptr pose_landmark_noise = gtsam::noiseModel::Isotropic::Sigma(3, 10.0); // one pixel in u and v

    // Noise models for IMU
    gtsam::noiseModel::Isotropic::shared_ptr velocity_noise_model = gtsam::noiseModel::Isotropic::Sigma(3, 0.00001); // m/s
     gtsam::noiseModel::Isotropic::shared_ptr  pose_noise = gtsam::noiseModel::Isotropic::Sigma(6, 0.00001); // m/s
    gtsam::noiseModel::Isotropic::shared_ptr bias_noise_model = gtsam::noiseModel::Isotropic::Sigma(6, 1e-4);
    //Create the Gaussian noise model for pressure and dvl
    gtsam::SharedNoiseModel pressure_noise_model = gtsam::noiseModel::Isotropic::Variance(1, 1.0e-6);
    gtsam::SharedNoiseModel dvl_noise = gtsam::noiseModel::Isotropic::Sigma(3, 0.1);


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

    std::string pose_topic_;
    ros::Publisher pose_publisher_;

    std::string matched_points_topic_;
    ros::Publisher matched_points_publisher_;

    std::string kf_tf2_topic_;
    ros::Publisher kf_tf2_publisher_;

    std::string optimised_odometry_topic;
    ros::Publisher optimised_odometry_publisher_;
    ros::Publisher path_publisher_;
    
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
};

ROSVO::ROSVO(ros::NodeHandle nh): nh_(nh){

      start = true;
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
  
  // Initialise factor graph keys
  this->set_named_key("barometer", 0, 1);
  this->set_named_key("pose", 0, 1);
  this->set_named_key("velocity", 0, 1);
  this->set_named_key("imu_bias", 0, 1);
  this->set_named_key("landmark", 0, 1);
  this->set_named_key("dvl", 0, 1);
  
  // intialise key for Timestamp
   this->set_timestamp(0, ros::Time(0, 0));

    // Initialize publishers and subscribers
   // image_stereo_subscriber = nh_.subscribe("stereo_topic", 10, &ROSVO::callback_function, this);
    imu_subscriber = nh_.subscribe<sensor_msgs::Imu>(imu_topic, 100, &ROSVO::imuCallback, this);
    //imu_subscriber = nh_.subscribe<sensor_msgs::Imu>("/imu_adis_ros", 100, &ROSVO::imuCallback, this);
    sonar_subscriber = nh_.subscribe(sonar_topic, 100, &ROSVO::SSSimageCallback, this);
    dvl_subscriber = nh_.subscribe(dvl_topic, 100, &ROSVO::dvlCallback, this);
    depth_subscriber = nh_.subscribe( depth_topic, 100, &ROSVO::pressureCallback, this);
    ground_truth_sub = nh_.subscribe("/girona500/navigator/odometry",100 , &ROSVO::groundCallback, this);
    //ground_truth_sub = nh_.subscribe("/odometry",100 , &ROSVO::groundCallback, this);

    vo_tf2_publisher_ = nh_.advertise<geometry_msgs::TransformStamped>("vo_tf2_topic", 10);
    pose_publisher_ = nh_.advertise<geometry_msgs::Pose>("pose_topic", 10);
    matched_points_publisher_ = nh_.advertise<sensor_msgs::PointCloud2>("matched_points_topic", 10);
    kf_tf2_publisher_ = nh_.advertise<geometry_msgs::TransformStamped>("kf_tf2_topic", 10);
    optimised_odometry_publisher_ = nh_.advertise<nav_msgs::Odometry>("optimised_odometry_topic", 10);
    path_publisher_ = nh_.advertise<nav_msgs::Path>("path_topic", 10);
    ground_path_pub_ = nh_.advertise<nav_msgs::Path>("ground_path", 10);
    path_.header.frame_id = "map_frame_id";
    
    ROS_INFO("Subscribers and Publishers initialized.");
    
    // initialise ISAM2  parameters
    ISAM2Params parameters;
    parameters.relinearizeThreshold = 0.01;
    parameters.relinearizeSkip = 1;
    parameters.optimizationParams = ISAM2DoglegParams();
    parameters.factorization = gtsam::ISAM2Params::QR;
    ISAM = new ISAM2(parameters);
    
    // We use the sensor specs to build the noise model for the IMU factor.
    double accel_noise_sigma = 0.00001;
    double gyro_noise_sigma = 0.00001;
    double accel_bias_rw_sigma = 0.00001;
    double gyro_bias_rw_sigma = 0.000000001;
    Matrix33 measured_acc_cov = I_3x3 * pow(accel_noise_sigma, 2);
    Matrix33 measured_omega_cov = I_3x3 * pow(gyro_noise_sigma, 2);
    Matrix33 integration_error_cov = I_3x3 * 1e-8;  // error committed in integrating position from velocities
    Matrix33 bias_acc_cov = I_3x3 * pow(accel_bias_rw_sigma, 2);
    Matrix33 bias_omega_cov = I_3x3 * pow(gyro_bias_rw_sigma, 2);
    Matrix66 bias_acc_omega_init = I_6x6 * 1e-5;  // error in the bias used for preintegration
    
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

  
 
   prev_bias = prior_imu_bias;
   
  // preintegrated = std::make_shared<PreintegratedImuMeasurements>(p1, prior_imu_bias);
   preintegrated = std::make_shared<PreintegratedCombinedMeasurements>(p, prior_imu_bias);
   assert(preintegrated);
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
 /**
 if (initialised == false) {
     // receive imu values and store the in a buffer
      // Check if there at least two imu values in the buufer
      // if so compute the interpolated IMU message at the deskew timestamp.
     imu_buffer.push_back(msg);
 
     if (imu_buffer.size > 1) {
         if (!rclcpp_new_state_time.is_zero()) {
             aru::core::utilities::imu::ImuSPtr imu = interpolated_imu(new_state_time);
             initialised == true; 
         }
     }
 
}
**/
 if (initialised == true && msg->header.stamp >= initialisation_time){
 
 int next_pose_key = this->key("pose");
 int next_velocity_key = this->key("velocity");
 int next_bias_key = this->key("imu_bias");
 auto current_timestamp = msg->header.stamp;
 // Get NavState at current time
 
if (next_pose_key == 0){
       
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
       prev_state = NavState(prior_pose, prior_velocity);
       prop_state = prev_state;
       
       newNodes.insert(X(next_pose_key), initial_state.pose());
       newNodes.insert(V(next_velocity_key),initial_state.velocity() );
       newNodes.insert(B(next_bias_key), imuBias::ConstantBias());
       //graph->emplace_shared< PriorFactor<Pose3> >(X(next_pose_key),initial_state.pose(), pose_noise);
       //graph->emplace_shared< PriorFactor<Vector3> >(V(next_velocity_key), initial_state.v(), velocity_noise_model);
       graph->emplace_shared< PriorFactor<Pose3> >(X(next_pose_key),prior_pose, pose_noise);
       graph->emplace_shared< PriorFactor<Vector3> >(V(next_velocity_key), prior_velocity, velocity_noise_model);
       graph->emplace_shared< PriorFactor<imuBias::ConstantBias> >(B(next_bias_key), prior_imu_bias, bias_noise_model);
       
      
      std::ofstream ofs("graph1.dot");
      graph->saveGraph(ofs);
      ofs.close();
           
     this->increment("pose");
     this->increment("velocity");
     this->increment("imu_bias");      
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
 
 preintegrated->integrateMeasurement(measuredAcc,measuredOmega, dt1);
 
  
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
    
    // Lock the thread  
 depth_mutex.lock();
 ROS_INFO("Barometer topic received");
 // get latest barometer key
// if (msg->header.stamp >= this->timestamp("pose")){
 
    pressure_messages_.push_back(*msg);
 
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
     dvl_messages_.push_back(*msg);
  
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
      prior_pose = Pose3(rotation, Point3(x, y, z));
        
       
      const geometry_msgs::Twist& twist = msg->twist.twist;
      prior_velocity = Vector3(twist.linear.x, twist.linear.y, twist.linear.z);
       
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
    ROS_INFO("Image Data");
    
        // Convert ROS image message to OpenCV image
      cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
      cv::Mat sssImage = cv_ptr->image;
      if (sssImage.empty()) {
          ROS_ERROR("Received empty SSS image.");
         return;
        }
     //cv::imshow("SSS Image", sssImage);
     //cv::waitKey(1);
     
            
    // Check it has been initialised
    int next_pose_key = this->key("pose");
    int next_velocity_key = this->key("velocity");
    int next_bias_key = this->key("imu_bias");
    int next_barometer_key = this->key("barometer");
    int next_dvl_key = this->key("dvl");
    
    if (next_pose_key > 0){ 
      imu_mutex.lock();
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
    depth_mutex.lock();
    if (it->header.stamp <= sonar_timestamp) {
      pressure = (it->fluid_pressure/ 1000);
      std::cout << pressure << std::endl;
      graph->emplace_shared<BarometricFactor>(X(this->key("pose")),
                                     P(this->key("barometer")),pressure,
                                   pressure_noise_model);
      newNodes.insert(P(this->key("barometer")), pressure);
      ROS_WARN("Pressure message added to graph.");
      pressure_updated = true;
      pressure_messages_.clear();
      depth_mutex.unlock();
      break;
     }
    
   }

   if (!pressure_updated) {
     ROS_WARN("No suitable Pressure message found with timestamp <= sonar message timestamp. Using previous velocity.");
     pressure_messages_.clear();
     depth_mutex.unlock();
   } 
  
   double depth = pressure / (1000.0 * 9.81);
   cv::Mat L_slope = computeSlantRange(sssImage, 13.6364, 1531,1, 100);
   /// Call SSS image processing functions
   //cv::Mat correctedImage = correctDistortion(sssImage,depth, L_slope);
    cv::Mat result = removeNadir(sssImage);
    cv::imshow("SSS Image", sssImage);
    cv::waitKey(1);
    cv::imshow("Nadir Removed", result);
    cv::waitKey(1);
   //cv::imshow("Corrected Image after sticthing", correctedImage);  
   equalizeColumnBrightness(result);
   // Display the image
   // Display the image
   
   
   /**
   //cv::imshow("Corrected Image after brightness equalisation", correctedImage);
   CorrectedImages.push_back(correctedImage);
   
   // Compare the new corrected image with all previously stored images
   // this might need changes
   for (const auto& prevImage : CorrectedImages) {
        cv::Point2d translation = phaseCorrelation(prevImage, correctedImage);
        //ROS_INFO("Translation with previous image: x = %f, y = %f", translation.x, translation.y);
    }
   **/
   // Iterate backward through the DVL messages
   for (auto it = dvl_messages_.rbegin(); it != dvl_messages_.rend(); ++it) {
    if (it->header.stamp <= sonar_timestamp) {
      //dvl_velocity = Vector3(it->velocity.x, it->velocity.y, it->velocity.z);
      gtsam::NavState navstate(gtsam::Rot3(), gtsam::Point3(), dvl_velocity );
      graph->emplace_shared<DVLFactor>(X(this->key("pose")), D(this->key("dvl")), dvl_velocity, body_P_sensor, dvl_noise);
      newNodes.insert(D(this->key("dvl")), dvl_velocity);
      std::cout << dvl_velocity << std::endl;
      velocity_updated = true;
      ROS_WARN("Velocity message added to graph.");
      dvl_messages_.clear();
      velocity_mutex.unlock();
      break;
     }
   }

   if (!velocity_updated) {
     ROS_WARN("No suitable DVL message found with timestamp <= sonar message timestamp. Using previous velocity.");
     dvl_messages_.clear();
     velocity_mutex.unlock();
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
     imu_mutex.unlock();
     }
}

void ROSVO::Optimise_and_publish() {
    // ISAM2 solver
    try {
        int max_key = this->key("pose");
        ROS_INFO("ISAM solver");
        
        ISAM->update(*graph, newNodes);
        ROS_INFO("ISAM solver Done for ");
        std::cout << p << std::endl;
        p = p + 1;
        result = ISAM->calculateEstimate();
        
        ROS_INFO("Calculation done.");
        
       // prior_pose = result.at<gtsam::Pose3>(gtsam::Symbol('X', this->key("pose")));
        //prior_pose = result.at<gtsam::Pose3>(X(this->key("pose")));
        //prior_velocity = result.at<gtsam::Vector3>(V(this->key("velocity")));
        // Overwrite the beginning of the preintegration for the next step.
       prev_state =
          NavState(result.at<Pose3>(X(this->key("pose"))), result.at<gtsam::Vector3>((V(this->key("velocity")))));
        // Update previous bias
       prev_bias = result.at<gtsam::imuBias::ConstantBias>(B(this->key("imu_bias")));
       
       
      // Plotting stuff 
       gtsam::Pose3 current_pose1 = result.at<gtsam::Pose3>(X(this->key("pose")));
      gtsam::Vector3 current_velocity1 = result.at<gtsam::Vector3>(V(this->key("velocity")));
      gtsam::imuBias::ConstantBias current_bias = result.at<gtsam::imuBias::ConstantBias>(B(this->key("imu_bias")));

   // Extract position
   gtsam::Point3 position1 = current_pose1.translation();

   // Extract biases
   gtsam::Vector3 gyro_bias = current_bias.gyroscope();
   gtsam::Vector3 accel_bias = current_bias.accelerometer();
       
       // Extract accelerometer and gyroscope biases
   gtsam::Vector3 accel_bias1 = prev_bias.accelerometer();
   gtsam::Vector3 gyro_bias1 = prev_bias.gyroscope();

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
     preintegrated->resetIntegrationAndSetBias(prev_bias);
        
        
        
        /// Save graph 
      //  if ( max_key == 3){
           // Export the graph to a DOT file
    //       std::ofstream ofs("graph.dot");
    //       graph->saveGraph(ofs);
     //      ofs.close();
     //   }
        //poses to file for plotting
        ofstream positionsFile("positions.txt");
         for (int key = 0; key < max_key; ++key) {
            gtsam::Pose3 pose = result.at<gtsam::Pose3>(X(key));
            gtsam::Vector3 position = pose.translation();
            positionsFile << position.x() << " " << position.y() << " " << position.z() << endl;
        }
        positionsFile.close();
       /** 
       std::ofstream residualsFile("residuals.txt");
        std::vector<double> residuals;
        for (size_t i = 0; i < graph->size(); ++i) {
            gtsam::NonlinearFactor::shared_ptr factor = graph->at(i);
            double error = factor->error(result);
            residuals.push_back(error);
            residualsFile << i << " " << error << std::endl; // Write pose number and residual
            ROS_INFO("Factor %zu error: %f", i, error);
        }
        residualsFile.close();
        **/
        // Iterate through each factor in the graph
        
       vector<double> residuals;
       for (size_t i = 0; i < graph->size(); ++i){
        NonlinearFactor::shared_ptr factor = graph->at(i);
        
        // Compute the error for the factor given the current values
        double error = factor->error(result);
        
        // Store the residual
        residuals.push_back(error);
        
        // Print the residual
        cout << "Factor " << i << " error: " << error << endl;
       }
      
       cout << "Residuals: ";
      for (double r : residuals) {
        cout << r << " ";
      }
      cout << endl;
      
      gtsam::Matrix poseCovariance = ISAM->marginalCovariance(X(this->key("pose")));
      gtsam::Matrix velocityCovariance = ISAM->marginalCovariance(V(this->key("velocity")));
      std::ofstream poseCovarianceFile("pose_covariance_per_pose.txt");
      std::ofstream velocityCovarianceFile("velocity_covariance_per_pose.txt");
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
      std::cout << "Pose Covariance:\n" << poseCovariance << std::endl;
      // Compute and print velocity covariance
  //    gtsam::Matrix velocityCovariance1 = marginals.marginalCovariance(V(this->key("velocity")));
      std::cout << "Velocity Covariance:\n" << velocityCovariance << std::endl;

        // Reset the graph
        graph->resize(0);
        newNodes.clear();
        
        
        
        // Publish poses
        nav_msgs::Odometry optimised_odometry_msg;
        optimised_odometry_msg.header.stamp = ros::Time::now();
        optimised_odometry_msg.header.frame_id = "map_frame_id";
        optimised_odometry_msg.child_frame_id = "body_frame_id";
        
        gtsam::Pose3 current_pose = result.at<gtsam::Pose3>(X(this->key("pose")));
        gtsam::Vector3 current_velocity = result.at<gtsam::Vector3>(V(this->key("velocity")));
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
        
        // Odometry msg covariance
        
        
        for (int i = 0; i < 6; ++i) {
            for (int j = 0; j < 6; ++j) {
                optimised_odometry_msg.pose.covariance[i * 6 + j] = poseCovariance(i, j);
                optimised_odometry_msg.twist.covariance[i * 6 + j] = poseCovariance(i, j);
            }
        }
        
        // Publish Optimised Path and change path
        nav_msgs::Path path;
        const std::string frame_id_prefix;
        path.header.stamp = this->timestamp(max_key);
        path.header.frame_id = "map_frame_id";
        
        for (int key = 0; key <= max_key; ++key) {
            geometry_msgs::PoseStamped pose_stamped_msg;
            pose_stamped_msg.header.stamp = this->timestamp(key);
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
        
        pose_publisher_.publish(pose_msg);
        optimised_odometry_publisher_.publish(optimised_odometry_msg);
        path_publisher_.publish(path);
        
    } catch (const gtsam::IndeterminantLinearSystemException& ex) {
        result.print();
        ROS_INFO("Did not solve correctly");
    }
}

void ROSVO::increment(const std::string& key_) {
    ++keys.at(key_).key;
}

int ROSVO::key(const std::string& key_, const int offset) const {
    return keys.at(key_).key + offset;
}

int ROSVO::minimum_key(const unsigned int priority_) const {
    bool minimum_key_found{false};
    int minimum_key_ = std::numeric_limits<int>::max();
    for (const auto& kv : keys) {
        const auto& key_info = kv.second;
        if (key_info.priority <= priority_) {
            minimum_key_ = std::min(minimum_key_, key_info.key);
            minimum_key_found = true;
        }
    }
    if (!minimum_key_found) {
        throw std::runtime_error("No named keys with requested priority <= " + std::to_string(priority_) + " exist.");
    }
    return minimum_key_;
}

void ROSVO::set_named_key(const std::string& name, const int key_, const unsigned int priority_) {
    if (!keys.emplace(name, NamedKeyInfo{key_, priority_}).second) {
        keys.at(name) = NamedKeyInfo{key_, priority_};
    }
}

const ros::Time& ROSVO::timestamp(const int key_) const {
    assert(key_ >= 0);
    return timestamps_.at(key_);
}

const ros::Time& ROSVO::timestamp(const std::string& key_, const int offset) const {
    return timestamp(key(key_, offset));
}

void ROSVO::set_timestamp(const int key_, const ros::Time& timestamp_) {
    assert(key_ >= 0);
    auto emplace_it = timestamps_.emplace(key_, timestamp_);
    emplace_it.first->second = timestamp_;
}

void ROSVO::set_timestamp(const std::string& key_, const ros::Time& timestamp_, const int offset) {
    set_timestamp(key(key_, offset), timestamp_);
}

cv::Mat ROSVO::correctDistortion(const cv::Mat& sssImage, double H, const cv::Mat& L_slope) {
    if (sssImage.empty() || L_slope.empty()) {
        throw std::runtime_error("Input image or L_slope is empty.");
    }
    
    int rows = sssImage.rows;
    int cols = sssImage.cols;
    int channels = sssImage.channels();
    
    // Create an empty vector to store the non-nadir pixels
    std::vector<cv::Vec3b> nonNadirPixels;
    
    for (int y = 0; y < rows; ++y) {
        for (int x = 0; x < cols; ++x) {
            // Extract L_slope value
            double Ls = L_slope.at<double>(y, x);
            
            // Skip nadir pixels
            if (Ls <= H) {
                continue;
            }
            
            // Calculate L_feature using the given formula
            double L_feature = std::sqrt(Ls * Ls - H * H);
            
            // Calculate the new x position based on L_feature
            int new_x = static_cast<int>(L_feature);
            
            if (new_x >= 0 && new_x < cols) {
                if (channels == 1) {
                    // Single-channel image (grayscale)
                    nonNadirPixels.push_back(cv::Vec3b(sssImage.at<uchar>(y, x), 0, 0));
                } else if (channels == 3) {
                    // Multi-channel image (RGB)
                    nonNadirPixels.push_back(sssImage.at<cv::Vec3b>(y, x));
                }
            }
        }
    }
    
    // Determine the size of the new image
    int newCols = static_cast<int>(nonNadirPixels.size() / rows);
    cv::Mat correctedImage = cv::Mat::zeros(rows, newCols, sssImage.type());
    
    // Fill the new image with the non-nadir pixels
    int idx = 0;
    for (int y = 0; y < rows; ++y) {
        for (int x = 0; x < newCols; ++x) {
            if (channels == 1) {
                correctedImage.at<uchar>(y, x) = nonNadirPixels[idx][0];
            } else if (channels == 3) {
                correctedImage.at<cv::Vec3b>(y, x) = nonNadirPixels[idx];
            }
            idx++;
        }
    }
    
    return sssImage;
}

// Function to equalize column brightness
void ROSVO::equalizeColumnBrightness(cv::Mat& image) {
    // Calculate the overall average brightness of the image
    double overallSum = cv::sum(image)[0];
    double overallAverage = overallSum / (image.rows * image.cols);

    // Calculate the average brightness for each column
    std::vector<double> columnAverages(image.cols, 0.0);
    for (int col = 0; col < image.cols; ++col) {
        double columnSum = 0.0;
        for (int row = 0; row < image.rows; ++row) {
            columnSum += image.at<uchar>(row, col);
        }
        columnAverages[col] = columnSum / image.rows;
    }

    // Adjust the pixel values based on the column brightness offset
    for (int col = 0; col < image.cols; ++col) {
        double offset = columnAverages[col] - overallAverage;
        for (int row = 0; row < image.rows; ++row) {
            int newValue = static_cast<int>(image.at<uchar>(row, col) - offset);
            image.at<uchar>(row, col) = cv::saturate_cast<uchar>(newValue);
        }
    }
}

// Function to compute the phase correlation
cv::Point2d ROSVO::phaseCorrelation(const cv::Mat& img1, const cv::Mat& img2) {
    // Convert images to float type
    cv::Mat img1_float, img2_float;
    img1.convertTo(img1_float, CV_32F);
    img2.convertTo(img2_float, CV_32F);

    // Perform Fourier Transform
    cv::Mat fft1, fft2;
    cv::dft(img1_float, fft1, cv::DFT_COMPLEX_OUTPUT);
    cv::dft(img2_float, fft2, cv::DFT_COMPLEX_OUTPUT);

    // Compute the cross-power spectrum
    cv::Mat fft1_conj;
    cv::mulSpectrums(fft1, fft2, fft1_conj, 0, true);
    cv::normalize(fft1_conj, fft1_conj, 0, 1, cv::NORM_MINMAX);

    // Inverse Fourier Transform to get phase correlation
    cv::Mat ifft;
    cv::idft(fft1_conj, ifft, cv::DFT_SCALE | cv::DFT_REAL_OUTPUT);
    
    // Find the peak location in the phase correlation
    cv::Point peakLoc;
    cv::minMaxLoc(ifft, nullptr, nullptr, nullptr, &peakLoc);
    
    // Return the translation vector
    cv::Point2d translation(peakLoc.x - img1.cols / 2, peakLoc.y - img1.rows / 2);
    return translation;
}

cv::Mat ROSVO::computeSlantRange(const cv::Mat& sssImage, double sonarFrequency, double soundSpeed, double minSlantRange, double maxSlantRange) {
    
    if (sssImage.empty()) {
        throw std::runtime_error("Input image is empty.");
    }
    
    int rows = sssImage.rows;
    int cols = sssImage.cols;
    cv::Mat slantRangeImage = cv::Mat::zeros(rows, cols, CV_64F);

    double timeInterval = 1.0 / sonarFrequency; // Adjust based on actual sonar settings

    for (int y = 0; y < rows; ++y) {
        double range = y * timeInterval * soundSpeed / 2.0; // Two-way travel time
        for (int x = 0; x < cols; ++x) {
            if (range >= minSlantRange || range <= maxSlantRange) {
                slantRangeImage.at<double>(y, x) = range;
            } else {
                slantRangeImage.at<double>(y, x) = 0.0; // Zero out pixels in the nadir range
            }
        }
    }
    
    return slantRangeImage;
}


cv::Mat ROSVO::removeNadir(const cv::Mat& img) {
     if (img.empty()) {
        std::cerr << "Error: Empty image provided!" << std::endl;
        return cv::Mat();
    }

    // Convert to grayscale
    int rows = img.rows;
    int cols = img.cols;
    cv::Mat gray = cv::Mat::zeros(rows, cols, CV_64F);
    
    
    cv::cvtColor(img, gray, cv::COLOR_BGR2GRAY);
    
    
    ROS_WARN("Gray Image");
    // Apply adaptive threshold to isolate the nadir
    cv::Mat binary;
    cv::adaptiveThreshold(gray, binary, 255, cv::ADAPTIVE_THRESH_MEAN_C, cv::THRESH_BINARY_INV, 15, 5);
    ROS_WARN("Adaptive Threshhold");
    
    // Find contours to locate the nadir
    // Find contours to locate the nadir
    // Check if binary image is valid
if (binary.empty()) {
    std::cerr << "Error: Binary image is empty!" << std::endl;
   
}

    // Check binary image type
    if (binary.type() != CV_8UC1) {
    std::cerr << "Error: Binary image type is not CV_8UC1!" << std::endl;
    
}
    ROS_WARN("Adaptive Threshhold 12");
    std::vector<std::vector<cv::Point>> contours;
    std::vector<cv::Vec4i> hierarchy;
    ROS_WARN("Adaptive Threshhold 13");
    cv::findContours(binary, contours, hierarchy, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);
    
    
    ROS_WARN("Contours");
    if (contours.empty()) {
        std::cerr << "Error: No contours found!" << std::endl;
        return img;
    }

    // Assuming the largest contour near the center is the nadir
    int nadir_start = img.cols / 2;
    int nadir_end = img.cols / 2;

    for (size_t i = 0; i < contours.size(); i++) {
        cv::Rect boundingBox = cv::boundingRect(contours[i]);
        if (boundingBox.x < img.cols / 2 && boundingBox.x + boundingBox.width > img.cols / 2) {
            nadir_start = boundingBox.x;
            nadir_end = boundingBox.x + boundingBox.width;
            break;
        }
    }

    // Ensure that nadir_start and nadir_end are within bounds
    nadir_start = std::max(0, nadir_start);
    nadir_end = std::min(img.cols, nadir_end);

    if (nadir_start >= nadir_end) {
        std::cerr << "Error: Nadir detection failed, invalid bounds!" << std::endl;
        
    }

    // Extract the left and right parts of the image
    cv::Rect left_roi(0, 0, nadir_start, img.rows);
    cv::Rect right_roi(nadir_end, 0, img.cols - nadir_end, img.rows);
    ROS_WARN("Rectangle");
    if (left_roi.width <= 0 || right_roi.width <= 0) {
        std::cerr << "Error: Invalid ROI dimensions!" << std::endl;
        
    }

    cv::Mat left_img = img(left_roi);
    cv::Mat right_img = img(right_roi);

    // Join the two parts
    cv::Mat result;
    cv::hconcat(left_img, right_img, result);

    return result;
}


int main(int argc, char** argv) {

    ros::init(argc, argv, "odometry_node");
    ros::NodeHandle nh;
    ROSVO odometry_node(nh);
    ros::spin();
    return 0;
    
}
