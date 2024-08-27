// Dean

#include"/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/front_end/sssimageprocessing.h"

// Constructor implementation
SSSImageProcessing::SSSImageProcessing() {
    // You can initialize any member variables here if needed.
    // For now, nothing specific is needed, so it's empty.
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

void SSSImageProcessing::equalizeColumnBrightness(cv::Mat& image) {
    double overallSum = cv::sum(image)[0];
    double overallAverage = overallSum / (image.rows * image.cols);

    std::vector<double> columnAverages(image.cols, 0.0);
    for (int col = 0; col < image.cols; ++col) {
        double columnSum = 0.0;
        for (int row = 0; row < image.rows; ++row) {
            columnSum += image.at<uchar>(row, col);
        }
        columnAverages[col] = columnSum / image.rows;
    }

    for (int col = 0; col < image.cols; ++col) {
        double offset = columnAverages[col] - overallAverage;
        for (int row = 0; row < image.rows; ++row) {
            int newValue = static_cast<int>(image.at<uchar>(row, col) - offset);
            image.at<uchar>(row, col) = cv::saturate_cast<uchar>(newValue);
        }
    }
}

cv::Point2d SSSImageProcessing::phaseCorrelation(const cv::Mat& img1, const cv::Mat& img2) {
    cv::Mat img1_float, img2_float;
    img1.convertTo(img1_float, CV_32F);
    img2.convertTo(img2_float, CV_32F);

    cv::Mat fft1, fft2;
    cv::dft(img1_float, fft1, cv::DFT_COMPLEX_OUTPUT);
    cv::dft(img2_float, fft2, cv::DFT_COMPLEX_OUTPUT);

    cv::Mat fft1_conj;
    cv::mulSpectrums(fft1, fft2, fft1_conj, 0, true);
    cv::normalize(fft1_conj, fft1_conj, 0, 1, cv::NORM_MINMAX);

    cv::Mat ifft;
    cv::idft(fft1_conj, ifft, cv::DFT_SCALE | cv::DFT_REAL_OUTPUT);
    
    cv::Point peakLoc;
    cv::minMaxLoc(ifft, nullptr, nullptr, nullptr, &peakLoc);
    
    cv::Point2d translation(peakLoc.x - img1.cols / 2, peakLoc.y - img1.rows / 2);
    return translation;
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
    if (img.empty()) {
        throw std::runtime_error("Input image is empty.");
    }

    cv::Mat gray, blurred, binary;

    try {
        cv::cvtColor(img, gray, cv::COLOR_BGR2GRAY);
        cv::GaussianBlur(gray, blurred, cv::Size(5, 5), 0);
        cv::adaptiveThreshold(blurred, binary, 255, cv::ADAPTIVE_THRESH_MEAN_C, cv::THRESH_BINARY_INV, 15, 5);
    } catch (const cv::Exception& e) {
        throw std::runtime_error("Exception during preprocessing: " + std::string(e.what()));
    }

    cv::Mat morph;
    cv::Mat kernel = cv::getStructuringElement(cv::MORPH_RECT, cv::Size(5, 5));

    try {
        cv::morphologyEx(binary, morph, cv::MORPH_CLOSE, kernel);
    } catch (const cv::Exception& e) {
        throw std::runtime_error("Exception during morphologyEx: " + std::string(e.what()));
    }

    std::vector<std::vector<cv::Point>> contours;
    std::vector<cv::Vec4i> hierarchy;

    try {
        cv::findContours(morph, contours, hierarchy, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);
    } catch (const cv::Exception& e) {
        throw std::runtime_error("Exception during findContours: " + std::string(e.what()));
    }

    double minContourArea = 50.0;
    std::vector<std::vector<cv::Point>> filteredContours;
    for (size_t i = 0; i < contours.size(); i++) {
        if (cv::contourArea(contours[i]) > minContourArea) {
            filteredContours.push_back(contours[i]);
        }
    }

    cv::Mat mask = cv::Mat::zeros(img.size(), CV_8UC1);
    cv::drawContours(mask, filteredContours, -1, cv::Scalar(255), cv::FILLED);

    cv::Mat result;
    img.copyTo(result, mask);

    cv::morphologyEx(result, result, cv::MORPH_OPEN, kernel);

    return result;
}
