//Dean
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
    // change translation to body frame , it is in sensor frame right now 
    gtsam::Point2 error = translation_diff - measured_translation;
  
    // implement Jacobians not sure if this is the correct implementations
    
    // If H1 (Jacobian wrt pose1) is requested
    if (H1) {
        // The Jacobian is 2x6, where the 2 corresponds to the x, y error and the 6 corresponds to the 6 DOF of Pose3.
        // The first three columns are for translation, the next three are for rotation.
        *H1 = gtsam::Matrix::Zero(2, 6);

        // Derivative of error w.r.t. pose1 translation (negative identity matrix since translation1 decreases the error)
        (*H1).block<2, 3>(0, 0) = -gtsam::Matrix::Identity(2, 2);

        // Derivative of error w.r.t. pose1 rotation (cross-product term for small z-rotation around the origin)
        gtsam::Vector3 p1_translation = pose1.translation();
        (*H1)(0, 5) = -p1_translation.y();  // derivative wrt rotation z
        (*H1)(1, 5) = p1_translation.x();   // derivative wrt rotation z
    }

    // If H2 (Jacobian wrt pose2) is requested
    if (H2) {
        *H2 = gtsam::Matrix::Zero(2, 6);

        // Derivative of error w.r.t. pose2 translation (positive identity matrix)
        (*H2).block<2, 3>(0, 0) = gtsam::Matrix::Identity(2, 2);

        // Derivative of error w.r.t. pose2 rotation (cross-product term for small z-rotation around the origin)
        gtsam::Vector3 p2_translation = pose2.translation();
        (*H2)(0, 5) = -p2_translation.y();  // derivative wrt rotation z
        (*H2)(1, 5) = p2_translation.x();   // derivative wrt rotation z
    }

    // Return the error as a 2D vector (x, y)
    return (gtsam::Vector(2) << error.x(), error.y()).finished();
}

// Clone function (required by GTSAM)
gtsam::NonlinearFactor::shared_ptr SSSFactor::clone() const {
    return boost::make_shared<SSSFactor>(*this);
}

