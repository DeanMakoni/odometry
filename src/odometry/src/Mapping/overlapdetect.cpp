/// DEan mAKONI
// 2024

#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/Mapping/overlapdetect.hpp"


    OverlapDetect() : m(0.0), b(0.0) {}

    // Method to extract x, y from gtsam::Values (z is ignored)
    void OverlapDetect::extractXY(const gtsam::Values& values) {
        x_vals.clear();
        y_vals.clear();
        
        for (const auto& key_value : values) {
            const gtsam::Point3& point = key_value.value.cast<gtsam::Point3>(); // Extract Point3 (x, y, z)
            x_vals.push_back(point.x()); // Only use x
            y_vals.push_back(point.y()); // Only use y
        }
    }

    // Method to perform least squares approximation to find m (slope) and b (intercept)
    void OverlapDetect::calculateLeastSquares() {
        if (x_vals.size() != y_vals.size() || x_vals.empty()) {
            std::cerr << "Error: x and y vectors are not the same size or are empty!" << std::endl;
            return;
        }

        double sum_x = 0.0, sum_y = 0.0, sum_xx = 0.0, sum_xy = 0.0;
        int N = x_vals.size();

        for (int i = 0; i < N; ++i) {
            double x = x_vals[i];
            double y = y_vals[i];
            sum_x += x;
            sum_y += y;
            sum_xx += x * x;
            sum_xy += x * y;
        }

        // Calculate slope (m) and intercept (b)
        m = (N * sum_xy - sum_x * sum_y) / (N * sum_xx - sum_x * sum_x);
        b = (sum_y - m * sum_x) / N;
    }

    // Getter for slope
    double OverlapDetect::getSlope() const {
        return m;
    }

    // Getter for intercept
    double OverlapDetect::getIntercept() const {
        return b;
    }

    // Print the results
    void OverlapDetect::printResults() const {
        std::cout << "Slope (m): " << m << std::endl;
        std::cout << "Intercept (b): " << b << std::endl;
    }
    
    // function usedto calculate the equation of the overlap line
    // D is swath width
    // use positive swath D for the first survey line
    // use negative swath D for the second survey line
    // for two edge overlaps create two object of the class. One for each trackline
    std::vector<float> OverlapDetect::edgeoverlap(double D){
         
         std::vector<float> y;   
    	 int N = x_vals.size();
    	 
    	 for (int i = 0; i < N; i++){
    	     y[i] = this.getSlope*x_vals[i] + this.getIntercept() + D;
    	 }
    }
    
 
/**
// Example usage
int main() {
    // Assuming you have your gtsam::Values result populated with Point3 (x, y, z)
    gtsam::Values result;
    
    // Example: Insert some dummy Point3 values into gtsam::Values
    result.insert(0, gtsam::Point3(1.0, 2.0, 3.0));
    result.insert(1, gtsam::Point3(2.0, 3.0, 3.0));
    result.insert(2, gtsam::Point3(3.0, 5.0, 3.0));
    result.insert(3, gtsam::Point3(4.0, 7.0, 3.0));

    // Create an instance of OverlapDetect
    OverlapDetect overlapDetect;

    // Extract x and y values from gtsam::Values
    overlapDetect.extractXY(result);

    // Calculate the slope and intercept using least squares
    overlapDetect.calculateLeastSquares();

    // Print the results
    overlapDetect.printResults();

    return 0;
}

