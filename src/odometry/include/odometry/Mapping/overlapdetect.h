#ifndef OVERLAPDETECT_HPP
#define OVERLAPDETECT_HPP

#include <iostream>
#include <vector>
#include <gtsam/geometry/Point3.h>
#include <gtsam/nonlinear/Values.h>

class OverlapDetect {
private:
    std::vector<double> x_vals;
    std::vector<double> y_vals;
    double m; // slope
    double b; // intercept

public:
    // Constructor
    OverlapDetect();

    // Method to extract x, y from gtsam::Values (z is ignored)
    void extractXY(const gtsam::Values& values);

    // Method to perform least squares approximation to find m (slope) and b (intercept)
    void calculateLeastSquares();

    // Getter for slope
    double getSlope() const;

    // Getter for intercept
    double getIntercept() const;

    // Print the results
    void printResults() const;

    // Function to calculate the equation of the overlap line
    std::vector<float> edgeoverlap(double D);
};

#endif // OVERLAPDETECT_HPP
