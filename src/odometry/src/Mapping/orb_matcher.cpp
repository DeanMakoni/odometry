#include <opencv2/opencv.hpp>
#include <iostream>
#include <vector>
#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/Mapping/orb_matcher.h"

OrbFeatureMatcher::OrbFeatureMatcher(int nfeatures = 500) {
    cv::setNumThreads(0);
    detector = cv::ORB::create(nfeatures);
    if (detector == nullptr) {
        std::cerr << "Error: Failed to create ORB detector." << std::endl;
        exit(1);
    }
    matcher = cv::BFMatcher::create(cv::NORM_HAMMING, true);
}

std::pair<cv::Mat, int> OrbFeatureMatcher::matchAndFilter(const cv::Mat& img1, const cv::Mat& img2) {
    std::vector<cv::KeyPoint> keypoints1, keypoints2;
    cv::Mat descriptors1, descriptors2;

    std::cout << "Detector start " << std::endl;
    detector->detectAndCompute(img1, cv::noArray(), keypoints1, descriptors1);
    detector->detectAndCompute(img2, cv::noArray(), keypoints2, descriptors2);
    std::cout << "Detector end " << std::endl;

    if (descriptors1.empty() || descriptors2.empty()) {
        std::cerr << "Failed to detect features or compute descriptors!" << std::endl;
        return {cv::Mat(), 0};
    }

    std::cout << "Keypoints in Image 1: " << keypoints1.size() << std::endl;
    std::cout << "Keypoints in Image 2: " << keypoints2.size() << std::endl;

    std::vector<cv::DMatch> matches;
    matcher->match(descriptors1, descriptors2, matches);

    std::cout << "Initial Matches: " << matches.size() << std::endl;

    std::vector<float> x_reference, y_reference, x_matched, y_matched;
    int inlierMatchCount = filterMatchesWithRansac(matches, keypoints1, keypoints2, x_reference, y_reference, x_matched, y_matched);

    cv::Mat imgMatches;
    cv::drawMatches(img1, keypoints1, img2, keypoints2, matches, imgMatches);
    cv::imshow("Filtered Matches", imgMatches);
    cv::waitKey(0);

    std::cout << "Matched Coordinates:" << std::endl;
    std::cout << "Reference Image X Coordinates: ";
    for (auto x : x_reference) std::cout << x << " ";
    std::cout << std::endl;

    std::cout << "Reference Image Y Coordinates: ";
    for (auto y : y_reference) std::cout << y << " ";
    std::cout << std::endl;

    std::cout << "Matched Image X Coordinates: ";
    for (auto x : x_matched) std::cout << x << " ";
    std::cout << std::endl;

    std::cout << "Matched Image Y Coordinates: ";
    for (auto y : y_matched) std::cout << y << " ";
    std::cout << std::endl;

    return {imgMatches, inlierMatchCount};
}

int OrbFeatureMatcher::filterMatchesWithRansac(std::vector<cv::DMatch>& matches, 
                                               const std::vector<cv::KeyPoint>& keypoints1, 
                                               const std::vector<cv::KeyPoint>& keypoints2,
                                               std::vector<float>& x_reference, 
                                               std::vector<float>& y_reference, 
                                               std::vector<float>& x_matched, 
                                               std::vector<float>& y_matched) {
    if (matches.size() < 4) {
        std::cerr << "Not enough matches to apply RANSAC." << std::endl;
        return 0;
    }

    std::vector<cv::Point2f> points1, points2;
    for (const auto& match : matches) {
        points1.push_back(keypoints1[match.queryIdx].pt);
        points2.push_back(keypoints2[match.trainIdx].pt);
    }

    std::vector<unsigned char> inliersMask(points1.size());
    cv::Mat homography = cv::findHomography(points1, points2, cv::RANSAC, 3, inliersMask);

    if (homography.empty()) {
        std::cerr << "Homography could not be computed!" << std::endl;
        return 0;
    }

    std::vector<cv::DMatch> inlierMatches;
    for (size_t i = 0; i < inliersMask.size(); ++i) {
        if (inliersMask[i]) {
            inlierMatches.push_back(matches[i]);
            x_reference.push_back(points1[i].x);
            y_reference.push_back(points1[i].y);
            x_matched.push_back(points2[i].x);
            y_matched.push_back(points2[i].y);
        }
    }

    std::cout << "Inlier Matches after RANSAC: " << inlierMatches.size() << std::endl;
    matches = inlierMatches;

    return inlierMatches.size();
}

int main() {
    cv::Mat img1 = cv::imread("butterfly.jpg", cv::IMREAD_GRAYSCALE);
    cv::Mat img2 = cv::imread("butterfly.jpg", cv::IMREAD_GRAYSCALE);
    
    cv::Mat img2_scaled;
    cv::resize(img2, img2_scaled, cv::Size(), 2.0, 2.0, cv::INTER_LINEAR);

    if (img1.empty() || img2.empty()) {
        std::cerr << "Could not open or find the images!" << std::endl;
        return -1;
    }

    OrbFeatureMatcher matcher;
    auto [imgMatches, inlierMatchCount] = matcher.matchAndFilter(img1, img2_scaled);
    
    std::cout << "Number of matches after RANSAC: " << inlierMatchCount << std::endl;

    return 0;
}

