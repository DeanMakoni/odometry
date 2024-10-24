#ifndef TPS_H
#define TPS_H

#include <vector>
#include <boost/numeric/ublas/matrix.hpp>
#include <boost/numeric/ublas/matrix.hpp>

#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/Mapping/linalg3d.h"
#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/Mapping/ludecomposition.h"

class TPS {
public:
    //static float grid[GRID_W][GRID_H];

    std::vector< Vec > control_points;
    std::vector< Vec > sen_points;
    std::vector<float> x_reference, y_reference, x_matched, y_matched;
    std::vector<double> x_output, y_output;

    int selected_cp = -1;

    double regularization = 0.0;
    double bending_energy = 0.0;

    double tps_base_func(double r);

    void calc_tps_x(std::vector<float>& x_reference, std::vector<float>& y_reference,
                           std::vector<float>& x_matched, std::vector<float>& y_matched);

    void calc_tps_y(std::vector<float>& x_reference, std::vector<float>& y_reference,
                           std::vector<float>& x_matched, std::vector<float>& y_matched);

    std::vector< Vec > fillVec(std::vector<float> x_cfp,std::vector<float> y_cfp,
    					std::vector<float> x_tlp,std::vector<float> y_tlp);
};

#endif
