//Dean

#ifndef SSS_IMAGE_PROCESSING_H
#define SSS_IMAGE_PROCESSING_H

#include <opencv2/opencv.hpp>
#include <stdexcept>
#include <vector>

class SSSImageProcessing  {

public:
    // Constructor
    SSSImageProcessing();
    // Method to correct distortion in the SSS image
    cv::Mat correctDistortion(const cv::Mat& sssImage, double H, const cv::Mat& L_slope);

    // Method to equalize column brightness in the image
    void equalizeColumnBrightness(cv::Mat& image);

    // Method to compute the phase correlation between two images
    cv::Point2d phaseCorrelation(const cv::Mat& img1, const cv::Mat& img2);

    // Method to compute the slant range of the SSS image
    cv::Mat computeSlantRange(const cv::Mat& sssImage, double sonarFrequency, double soundSpeed, double minSlantRange, double maxSlantRange);

    // Method to remove the nadir line from the image
    cv::Mat removeNadir(const cv::Mat& img);
private:

    // Global vector to store corrected images
    std::vector<cv::Mat> CorrectedImages;   
};

#endif // SSS_IMAGE_PROCESSING_H

