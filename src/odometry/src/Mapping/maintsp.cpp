#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/Mapping/tsp.h"
#include <iostream>

int main() {
    // Create a TPS object
    TPS tps;

    // Example control points and reference points
    std::vector<float> x_cfp = {1.0f, 2.0f, 3.0f};
    std::vector<float> y_cfp = {4.0f, 5.0f, 6.0f};
    std::vector<float> x_tlp = {7.0f, 8.0f, 9.0f};
    std::vector<float> y_tlp = {10.0f, 11.0f, 12.0f};

    // Fill the control points with TPS
    tps.fillVec(x_cfp, y_cfp, x_tlp, y_tlp);

    // You can also call TPS calculations here if needed
    // Example: tps.calc_tps_x(x_cfp, y_cfp, x_tlp, y_tlp);

    std::cout << "TPS calculation complete!" << std::endl;

    return 0;
}

