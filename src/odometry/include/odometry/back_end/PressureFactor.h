#pragma once

#include <gtsam/geometry/Pose3.h>
#include <gtsam/inference/Key.h>
#include <gtsam/nonlinear/NonlinearFactor.h>
#include <boost/shared_ptr.hpp>

namespace gtsam {

// Custom unary factor to represent a GPS-like measurement that only observes the Z position
class PressureFactor : public NoiseModelFactor1<Pose3> {
 private:
  double mz_;  // The Z measurement value

 public:
  // Typedef for a smart pointer to the UnaryFactor
  typedef boost::shared_ptr<PressureFactor> shared_ptr;

  // Constructor: takes a Key for the pose, the Z measurement, and the noise model
  PressureFactor(Key j, double z, const SharedNoiseModel& model);

  // Destructor
  virtual ~PressureFactor();

  // The evaluateError function calculates the error between the pose's Z position and the measurement
  Vector evaluateError(const Pose3& q, boost::optional<Matrix&> H = boost::none) const override;

  // Clone method: creates a new instance of this factor
  virtual gtsam::NonlinearFactor::shared_ptr clone() const override;
};

}  // namespace gtsam
