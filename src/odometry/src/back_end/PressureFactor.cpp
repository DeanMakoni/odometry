#include"/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/back_end/PressureFactor.h"

namespace gtsam {

// Constructor: initializes the UnaryFactor with the provided key, measurement, and noise model
PressureFactor::PressureFactor(Key j, double z, const SharedNoiseModel& model)
    : NoiseModelFactor1<Pose3>(model, j), mz_(z) {}

// Destructor
PressureFactor::~PressureFactor() {}

// The evaluateError function calculates the error between the pose's Z position and the measurement
Vector PressureFactor::evaluateError(const Pose3& q, boost::optional<Matrix&> H) const {
  // If Jacobians are requested, return the Jacobian for the Z measurement
  if (H) {
    (*H) = (Matrix(1, 6) << 0.0, 0.0, 0.0, 0.0, 0.0, 1.0).finished();
  }
  
  gtsam::Point3 t_IMU_Pressure(-0.48, 0.35, -0.4); // Translation from IMU to Pressure sensor frame
  gtsam::Rot3 R_IMU_Pressure = gtsam::Rot3(); // No rotation assumed
  gtsam::Pose3 T_IMU_Pressure(R_IMU_Pressure, t_IMU_Pressure); // Pose3 representing the transformation
  gtsam::Pose3 transformedPose = T_IMU_Pressure.transformPoseTo(q);
  gtsam::Pose3 T_Pressure_IMU = T_IMU_Pressure.inverse();
  gtsam::Point3 point_Pressure(0, 0, mz_); 
  gtsam::Point3 transformedDepth = T_IMU_Pressure.transformFrom(point_Pressure); // transform to imu frame
  // Return the error: difference between the pose's Z and the measured Z
  return (Vector(1) << q.z() - mz_).finished();
}

// Clone method: creates a new instance of this factor
gtsam::NonlinearFactor::shared_ptr PressureFactor::clone() const {
  return boost::static_pointer_cast<gtsam::NonlinearFactor>(
      gtsam::NonlinearFactor::shared_ptr(new PressureFactor(*this)));
}

}  // namespace gtsam
