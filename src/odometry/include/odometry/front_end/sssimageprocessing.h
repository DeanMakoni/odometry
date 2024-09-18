//Dean

#ifndef SSS_IMAGE_PROCESSING_H
#define SSS_IMAGE_PROCESSING_H

#include <opencv2/opencv.hpp>
#include <stdexcept>
#include <vector>
#include"/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/front_end/image_registration.h"
#include <GeographicLib/LocalCartesian.hpp>
#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/back_end/SSSFactor.h"
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

class SSSImageProcessing  {

public:
    // Constructor
    SSSImageProcessing();
    // Method to correct distortion in the SSS image
    cv::Mat correctDistortion(const cv::Mat& sssImage, double H, const cv::Mat& L_slope);

    // Method to equalize column brightness in the image
    cv::Mat equalizeColumnBrightness(cv::Mat& image);

    // Method to compute the phase correlation between two images
    cv::Point2d phaseCorrelation(const cv::Mat& img1, const cv::Mat& img2);

    // Method to compute the slant range of the SSS image
    cv::Mat computeSlantRange(const cv::Mat& sssImage, double sonarFrequency, double soundSpeed, double minSlantRange, double maxSlantRange);

    // Method to remove the nadir line from the image
    cv::Mat removeNadir(const cv::Mat& img);
    // Global vector to store corrected images
    std::vector<cv::Mat> CorrectedImages;  
    
    // Method to add SSS factors to the graph
    void AddSSSFactor(gtsam::NonlinearFactorGraph& graph, gtsam::Key key1, gtsam::Key key2, const gtsam::Point2& measured_translation);
                      
    // Method to add SSS values to the graph
    void AddSSSValues(gtsam::Values& newNodes, gtsam::Key posekey2, const gtsam::Pose3& pose);
    
private:
     gtsam::SharedNoiseModel sss_noise_model;
     
};

#endif // SSS_IMAGE_PROCESSING_H

