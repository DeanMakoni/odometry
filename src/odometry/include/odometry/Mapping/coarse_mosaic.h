// Laplacian.hpp
// Dean Makoni
// 9 October

#ifndef LAPLACIAN_HPP
#define LAPLACIAN_HPP

#include <opencv2/opencv.hpp>
#include <vector>
#include <string>

class Laplacian {
public:
    // Constructor
    Laplacian(cv::Mat image1, cv::Mat image2);

    // Method to blend images
    void blendImages();

    // Method to save the blended image to a file
    void saveBlendedImage(const std::string& output_path);

private:
    cv::Mat A, B; // Input images
    std::vector<cv::Mat> gpA, gpB; // Gaussian pyramids
    std::vector<cv::Mat> lpA, lpB; // Laplacian pyramids
    std::vector<cv::Mat> blendedPyramid; // Blended Laplacian pyramid
    cv::Mat result; // Final blended image

    // Helper methods
    void buildGaussianPyramids();
    void buildLaplacianPyramids();
    void blendPyramids();
    void reconstructImage();
};

#endif // LAPLACIAN_HPP
