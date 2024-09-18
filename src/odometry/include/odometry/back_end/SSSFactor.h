//Dean

#ifndef SSS_BETWEEN_FACTOR_H
#define SSS_BETWEEN_FACTOR_H

#include <gtsam/nonlinear/NonlinearFactor.h>
#include <gtsam/geometry/Pose3.h>
#include <gtsam/base/Matrix.h>

class SSSFactor : public gtsam::NoiseModelFactor2<gtsam::Pose3, gtsam::Pose3> {
private:
    gtsam::Point2 measured_translation;  // The measured translation between two macthing SSS images

public:
    // Constructor
    SSSFactor(gtsam::Key key1, gtsam::Key key2, const gtsam::Point2& measured_translation, const gtsam::SharedNoiseModel& model);

    // Error function: computes the difference between predicted and measured relative pose
    gtsam::Vector evaluateError(const gtsam::Pose3& pose1, const gtsam::Pose3& pose2,
                                boost::optional<gtsam::Matrix&> H1 = boost::none,
                                boost::optional<gtsam::Matrix&> H2 = boost::none) const override;

    // Clone function (required by GTSAM)
    virtual gtsam::NonlinearFactor::shared_ptr clone() const override;
};

#endif // SSS_BETWEEN_FACTOR_H
