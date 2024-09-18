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
    
    // Georeferencing data using GeographicLib
    double latitude;              // Latitude of the georeferenced image
    double longitude;             // Longitude of the georeferenced image
    double altitude;              // Altitude (optional)

    // Constructor for convenience
    SSSFrame(const cv::Mat& img, gtsam::Key key, double lat, double lon, double alt = 0.0)
        : image(img), poseKey(key), latitude(lat), longitude(lon), altitude(alt) {}

    // Function to get a local cartesian coordinate system (if needed)
    GeographicLib::LocalCartesian getLocalCartesian(double refLat, double refLon, double refAlt = 0.0) const {
        return GeographicLib::LocalCartesian(refLat, refLon, refAlt);
    }

    // Static method to calculate distance between two frames in 2D space (X and Y directions)
    static std::pair<double, double> calculateXYDistance(const SSSFrame& frame1, const SSSFrame& frame2) {
        // Reference point for local cartesian conversion, usually one of the frames or an arbitrary point
        double refLat = frame1.latitude;
        double refLon = frame1.longitude;
        double refAlt = frame1.altitude;

        // Create a LocalCartesian reference system using the first frame's location
        GeographicLib::LocalCartesian localCartesian(refLat, refLon, refAlt);

        // Convert the latitude, longitude, and altitude of both frames to local cartesian coordinates
        double x1, y1, z1;
        localCartesian.Forward(frame1.latitude, frame1.longitude, frame1.altitude, x1, y1, z1);

        double x2, y2, z2;
        localCartesian.Forward(frame2.latitude, frame2.longitude, frame2.altitude, x2, y2, z2);

        // Calculate the difference in X (East-West) and Y (North-South)
        double dx = x2 - x1; // X-axis (East-West)
        double dy = y2 - y1; // Y-axis (North-South)

        // Return the distances as a pair of (dx, dy)
        return {dx, dy};
    }
};

#endif // SSSFRAME_H
