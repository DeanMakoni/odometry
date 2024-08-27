#ifndef DVLFACTOR_H
#define DVLFACTOR_H
#include <ros/ros.h>
#include <sensor_msgs/Imu.h>
#include <sensor_msgs/FluidPressure.h>
#include <cola2_msgs/DVL.h>
#include <sensor_msgs/Image.h>
#include <tf2_ros/transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>
#include <sensor_msgs/Imu.h>
#include <nav_msgs/Odometry.h>
#include <sensor_msgs/PointCloud2.h>
#include <nav_msgs/Path.h>
#include <Eigen/Dense>

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


using namespace gtsam;

/**
 * @brief DVLFactor is a custom factor for incorporating DVL (Doppler Velocity Log) measurements
 * into a factor graph. It relates the robot's pose and velocity to the measured velocity
 * in the sensor frame.
 */
class DVLFactor : public NoiseModelFactor2<Pose3, Vector3> {
private:
    Vector3 measured_velocity_; ///< Measured velocity from the DVL
    Pose3 body_P_sensor_; ///< Transform from body to sensor frame

public:
    /**
     * @brief Constructor for the DVLFactor.
     *
     * @param pose_key The key associated with the robot's pose.
     * @param velocity_key The key associated with the robot's velocity.
     * @param measured_velocity The measured velocity from the DVL.
     * @param body_P_sensor The transform from the robot body frame to the sensor frame.
     * @param model The noise model associated with this factor.
     */
    DVLFactor(Key pose_key, Key velocity_key, const Vector3& measured_velocity,
              const Pose3& body_P_sensor, const SharedNoiseModel& model);

    /**
     * @brief Evaluate the error of the factor.
     *
     * @param pose The robot's pose.
     * @param velocity The robot's velocity.
     * @param H1 Optional Jacobian w.r.t the pose.
     * @param H2 Optional Jacobian w.r.t the velocity.
     * @return The error vector.
     */
    Vector evaluateError(const Pose3& pose, const Vector3& velocity,
                         boost::optional<Matrix&> H1 = boost::none,
                         boost::optional<Matrix&> H2 = boost::none) const override;
};

#endif // DVLFACTOR_H
