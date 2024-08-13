#ifndef DVLFACTOR_H
#define DVLFACTOR_H

#include <gtsam/nonlinear/NonlinearFactor.h>
#include <gtsam/geometry/Pose3.h>
#include <gtsam/navigation/NavState.h>

class DVLFactor : public gtsam::NoiseModelFactorN<gtsam::NavState, double> {
private:
    gtsam::Vector3 measured_velocity_; // Measured velocity from the DVL
    gtsam::Pose3 body_P_sensor_; // Transform from body to sensor frame

public:
   // Constructor
    DVLFactor(gtsam::Key key, gtsam::Key dvlkey, const gtsam::Vector3& measured_velocity,
              const gtsam::Pose3& body_P_sensor,
              const gtsam::SharedNoiseModel& model)
        : gtsam::NoiseModelFactorN<gtsam::NavState>(model, key, dvlkey),
          measured_velocity_(measured_velocity), body_P_sensor_(body_P_sensor) {}


    // Error function
    gtsam::Vector evaluateError(const gtsam::NavState& state,
                                boost::optional<gtsam::Matrix&> H = boost::none) const override;
};

#endif // DVLFACTOR_H


