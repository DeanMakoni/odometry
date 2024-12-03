#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/back_end/SSSFactor.h"

// Constructor
SSSFactor::SSSFactor(gtsam::Key key1, gtsam::Key key2, const gtsam::Point2& measured_translation, const gtsam::SharedNoiseModel& model)
    : gtsam::NoiseModelFactor2<gtsam::Pose3, gtsam::Pose3>(model, key1, key2), measured_translation(measured_translation) {}

// Error function: computes the difference between predicted and measured relative pose
gtsam::Vector SSSFactor::evaluateError(const gtsam::Pose3& pose1, const gtsam::Pose3& pose2,
                                       boost::optional<gtsam::Matrix&> H1,
                                       boost::optional<gtsam::Matrix&> H2) const {
    // Extract the translation (x, y) from pose1 and pose2
    gtsam::Point2 pose1_xy(pose1.x(), pose1.y());
    gtsam::Point2 pose2_xy(pose2.x(), pose2.y());

    // Compute the translation difference: (pose2.x - pose1.x, pose2.y - pose1.y)
    gtsam::Point2 translation_diff = pose2_xy - pose1_xy;

    // Compute the error as (translation_diff - measured_translation)
    gtsam::Point2 error = translation_diff - measured_translation;

    // Implement Jacobians
    
   // If H1 (Jacobian wrt pose1) is requested
if (H1) {
    *H1 = gtsam::Matrix::Zero(2, 6);

    // Derivative of error w.r.t. pose1 translation (negative identity matrix for x, y translation)
    (*H1)(0, 0) = -1.0;  // x error w.r.t. x position of pose1
    (*H1)(1, 1) = -1.0;  // y error w.r.t. y position of pose1

    // Derivative of error w.r.t. pose1 rotation around z-axis (only rotation in z affects x-y plane)
    (*H1)(0, 5) = -1.0 * (pose2.y() - pose1.y());  // d(error_x) / d(theta_z)
    (*H1)(1, 5) = 1.0 * (pose2.x() - pose1.x());   // d(error_y) / d(theta_z)
}

// If H2 (Jacobian wrt pose2) is requested
if (H2) {
    *H2 = gtsam::Matrix::Zero(2, 6);

    // Derivative of error w.r.t. pose2 translation (positive identity matrix for x, y translation)
    (*H2)(0, 0) = 1.0;  // x error w.r.t. x position of pose2
    (*H2)(1, 1) = 1.0;  // y error w.r.t. y position of pose2

    // Derivative of error w.r.t. pose2 rotation around z-axis
    (*H2)(0, 5) = 1.0 * (pose2.y() - pose1.y());   // d(error_x) / d(theta_z)
    (*H2)(1, 5) = -1.0 * (pose2.x() - pose1.x());  // d(error_y) / d(theta_z)
}


    // Return the error as a 2D vector (x, y)
    return (gtsam::Vector(2) << error.x(), error.y()).finished();
}

// Clone function (required by GTSAM)
gtsam::NonlinearFactor::shared_ptr SSSFactor::clone() const {
    return boost::make_shared<SSSFactor>(*this);
}

