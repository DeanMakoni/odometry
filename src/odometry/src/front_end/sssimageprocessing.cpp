// Dean

#include"/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/front_end/sssimageprocessing.h"

// Constructor implementation
SSSImageProcessing::SSSImageProcessing() {
    sss_noise_model = gtsam::noiseModel::Isotropic::Variance(1, 5);
}

cv::Mat SSSImageProcessing::correctDistortion(const cv::Mat& sssImage, double H, const cv::Mat& L_slope) {
    if (sssImage.empty() || L_slope.empty()) {
        throw std::runtime_error("Input image or L_slope is empty.");
    }
    
    int rows = sssImage.rows;
    int cols = sssImage.cols;
    int channels = sssImage.channels();
    
    std::vector<cv::Vec3b> nonNadirPixels;
    
    for (int y = 0; y < rows; ++y) {
        for (int x = 0; x < cols; ++x) {
            double Ls = L_slope.at<double>(y, x);
            if (Ls <= H) continue;
            double L_feature = std::sqrt(Ls * Ls - H * H);
            int new_x = static_cast<int>(L_feature);
            if (new_x >= 0 && new_x < cols) {
                if (channels == 1) {
                    nonNadirPixels.push_back(cv::Vec3b(sssImage.at<uchar>(y, x), 0, 0));
                } else if (channels == 3) {
                    nonNadirPixels.push_back(sssImage.at<cv::Vec3b>(y, x));
                }
            }
        }
    }
    
    int newCols = static_cast<int>(nonNadirPixels.size() / rows);
    cv::Mat correctedImage = cv::Mat::zeros(rows, newCols, sssImage.type());
    
    int idx = 0;
    for (int y = 0; y < rows; ++y) {
        for (int x = 0; x < newCols; ++x) {
            if (channels == 1) {
                correctedImage.at<uchar>(y, x) = nonNadirPixels[idx][0];
            } else if (channels == 3) {
                correctedImage.at<cv::Vec3b>(y, x) = nonNadirPixels[idx];
            }
            idx++;
        }
    }
    
    return correctedImage;
}

cv::Mat SSSImageProcessing::equalizeColumnBrightness(cv::Mat& image) {
    // Ensure the image is either grayscale (1 channel) or color (3 channels)
    CV_Assert(image.channels() == 1 || image.channels() == 3);

    std::vector<cv::Mat> channels;
    
    // If the image is color (BGR), split into three channels (B, G, R)
    if (image.channels() == 3) {
        cv::split(image, channels);  // Split into B, G, R channels
    } else {
        channels.push_back(image);  // Single-channel grayscale image
    }

    // Process each channel (either 1 for grayscale or 3 for color)
    for (auto& channel : channels) {
        double overallSum = cv::sum(channel)[0];
        double overallAverage = overallSum / (channel.rows * channel.cols);

        std::vector<double> columnAverages(channel.cols, 0.0);
        for (int col = 0; col < channel.cols; ++col) {
            double columnSum = 0.0;
            for (int row = 0; row < channel.rows; ++row) {
                columnSum += channel.at<uchar>(row, col);
            }
            columnAverages[col] = columnSum / channel.rows;
        }

        for (int col = 0; col < channel.cols; ++col) {
            double offset = columnAverages[col] - overallAverage;
            for (int row = 0; row < channel.rows; ++row) {
                int newValue = static_cast<int>(channel.at<uchar>(row, col) - offset);
                channel.at<uchar>(row, col) = cv::saturate_cast<uchar>(newValue);
            }
        }
    }

    cv::Mat result;
    
    // If the image was color, merge the channels back
    if (image.channels() == 3) {
        cv::merge(channels, result);  // Merge the B, G, R channels back together
    } else {
        result = channels[0];  // For grayscale, just return the single channel
    }

    return result;
}

cv::Point2d SSSImageProcessing::phaseCorrelation(const cv::Mat& img1, const cv::Mat& img2) {
  // Ensure the input images are of the same size
    if (img1.size() != img2.size()) {
        throw std::invalid_argument("Images must be of the same size for phase correlation.");
    }

    // Convert color images to grayscale
    cv::Mat img1_gray, img2_gray;
    cv::cvtColor(img1, img1_gray, cv::COLOR_BGR2GRAY);
    cv::cvtColor(img2, img2_gray, cv::COLOR_BGR2GRAY);

    // Convert images to floating point format (required for phase correlation)
    cv::Mat img1_float, img2_float;
    img1_gray.convertTo(img1_float, CV_32F);
    img2_gray.convertTo(img2_float, CV_32F);

    // Optionally apply windowing (Hanning window) to reduce edge effects
    cv::Mat hann;
    cv::createHanningWindow(hann, img1_float.size(), CV_32F);
    img1_float = img1_float.mul(hann);
    img2_float = img2_float.mul(hann);
    
    // Perform phase correlation to find the translation between img1 and img2
    cv::Point2d shift = cv::phaseCorrelate(img1_float, img2_float);

    // Return the estimated translation as cv::Point2d
    return shift;
}

cv::Mat SSSImageProcessing::computeSlantRange(const cv::Mat& sssImage, double sonarFrequency, double soundSpeed, double minSlantRange, double maxSlantRange) {
    if (sssImage.empty()) {
        throw std::runtime_error("Input image is empty.");
    }
    
    int rows = sssImage.rows;
    int cols = sssImage.cols;
    cv::Mat slantRangeImage = cv::Mat::zeros(rows, cols, CV_64F);

    double timeInterval = 1.0 / sonarFrequency;

    for (int y = 0; y < rows; ++y) {
        double range = y * timeInterval * soundSpeed / 2.0;
        for (int x = 0; x < cols; ++x) {
            if (range >= minSlantRange || range <= maxSlantRange) {
                slantRangeImage.at<double>(y, x) = range;
            } else {
                slantRangeImage.at<double>(y, x) = 0.0;
            }
        }
    }
    
    return slantRangeImage;
}
cv::Mat SSSImageProcessing::removeNadir(const cv::Mat& img) {
    // Convert image to grayscale to easily detect the nadir (black) region
    cv::Mat gray;
    cv::cvtColor(img, gray, cv::COLOR_BGR2GRAY);
    
    // Get the image dimensions
    int height = gray.rows;
    int width = gray.cols;
    
    // Center of the image
    int center_x = width / 2;
    
    // Initialize the bounds of the nadir region
    int left_bound = center_x;
    int right_bound = center_x;

    // Threshold to determine the black region (you can adjust the value 10)
    int black_threshold = 90;

    // Traverse left from the center to find the boundary of the black region
    while (left_bound > 0 && cv::mean(gray.col(left_bound))[0] < black_threshold) {
        left_bound--;
    }

    // Traverse right from the center to find the boundary of the black region
    while (right_bound < width && cv::mean(gray.col(right_bound))[0] < black_threshold) {
        right_bound++;
    }

    // Define the left and right parts of the image
    cv::Mat left_part = img(cv::Range(0, height), cv::Range(0, left_bound));
    cv::Mat right_part = img(cv::Range(0, height), cv::Range(right_bound, width));

    // Stitch the left and right parts together horizontally
    cv::Mat result;
    cv::hconcat(left_part, right_part, result);

    return result;
}

// Method to add SSS factors to the graph
void SSSImageProcessing::AddSSSFactor(gtsam::NonlinearFactorGraph& graph, gtsam::Key key1, gtsam::Key key2, const gtsam::Point2& measured_translation) {
                      
      graph.emplace_shared<SSSFactor>(key1, key2, measured_translation, sss_noise_model);
                        
       }
                      
// Method to add SSS values to the graph
void SSSImageProcessing::AddSSSValues(gtsam::Values& newNodes, gtsam::Key posekey2,const gtsam::Pose3& pose){

    //newNodes.insert(posekey1, this->pressure);
    newNodes.insert(posekey2, pose);
}
