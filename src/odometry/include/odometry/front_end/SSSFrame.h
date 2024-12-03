#ifndef SSSFRAME_H
#define SSSFRAME_H

// Include OpenCV for image handling
#include <opencv2/core.hpp>        // for cv::Mat

// Include GTSAM for key management (pose tracking)
#include <gtsam/nonlinear/Values.h> // for gtsam::Key

// Include GeographicLib for georeferencing
#include <GeographicLib/Geocentric.hpp>
#include <GeographicLib/LocalCartesian.hpp>
#include <cmath> // for sqrt

struct SSSFrame {
    cv::Mat image;                // OpenCV image matrix
    const gtsam::Key poseKey;           // GTSAM pose key (ID for the pose)
    const gtsam::Pose3& poseValue;
    // Georeferencing data using GeographicLib
    double latitude;              // Latitude of the georeferenced image
    double longitude;             // Longitude of the georeferenced image
    double altitude;              // Altitude (optional)

    // Constructor for convenience
    SSSFrame(const cv::Mat& img, gtsam::Key key, const gtsam::Pose3& pose)
        : image(img), poseKey(key),poseValue(pose) {}

    // Function to get a local cartesian coordinate system (if needed)
    GeographicLib::LocalCartesian getLocalCartesian(double refLat, double refLon, double refAlt = 0.0) const {
        return GeographicLib::LocalCartesian(refLat, refLon, refAlt);
    }

    // Static method to calculate distance between two frames using their pose keys
    static std::pair<double, double> calculateXYDistance(const SSSFrame& frame1, const SSSFrame& frame2) {
    
        // Retrieve poses associated with the keys
        gtsam::Pose3 pose1 = frame1.poseValue;
        gtsam::Pose3 pose2 = frame2.poseValue;

        // Calculate the difference in X and Y
        double dx = pose2.x() - pose1.x(); // X-axis
        double dy = pose2.y() - pose1.y(); // Y-axis

        // Return the distances as a pair of (dx, dy)
        return {dx, dy};
    }
};

#endif // SSSFRAME_H
