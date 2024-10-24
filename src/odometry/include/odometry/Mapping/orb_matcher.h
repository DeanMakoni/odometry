// OrbFeatureMatcher.hpp
// Dean Makoni
// 24 October

#ifndef ORBFEATUREMATCHER_HPP
#define ORBFEATUREMATCHER_HPP

#include <opencv2/opencv.hpp>
#include <iostream>
#include <vector>

class OrbFeatureMatcher {
public:
    // Constructor to initialize the ORB detector and matcher
    OrbFeatureMatcher(int nfeatures = 500);

    // Method to match and filter features between two images
    void matchAndFilter(const cv::Mat& img1, const cv::Mat& img2);

private:
    cv::Ptr<cv::ORB> detector;     // ORB feature detector
    cv::Ptr<cv::BFMatcher> matcher; // BruteForce Matcher

    // Helper method to filter matches using RANSAC and extract matched coordinates
    void filterMatchesWithRansac(std::vector<cv::DMatch>& matches, 
                                 const std::vector<cv::KeyPoint>& keypoints1, 
                                 const std::vector<cv::KeyPoint>& keypoints2,
                                 std::vector<float>& x_reference, 
                                 std::vector<float>& y_reference, 
                                 std::vector<float>& x_matched, 
                                 std::vector<float>& y_matched);
};

#endif // ORBFEATUREMATCHER_HPP
