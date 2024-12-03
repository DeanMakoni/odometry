// Dean Makoni

#ifndef KMEANS_SEGMENTER_H
#define KMEANS_SEGMENTER_H

#include <opencv2/opencv.hpp>
#include <vector>

class KMeansSegmenter {
public:
    // Constructor
    KMeansSegmenter(int maxIterations = 100, double epsilon = 1.0);

    // Function to perform K-means segmentation on an ROI
    cv::Mat kMeansSegmentation(const cv::Mat& inputImage, int k, cv::Mat& labels);

    // Function to calculate the within-group sum of squares (WGSS)
    double calculateWGSS(const cv::Mat& inputImage, int k);

    // Function to determine the optimal K using the elbow method
    int determineOptimalK(const cv::Mat& inputImage, int maxK = 10);

    // Function to draw bounding boxes on distinct segmented clusters
    void drawBoundingBoxesOnClusters(cv::Mat& segmentedImage, const cv::Mat& labels, int k);

private:
    int maxIterations;
    double epsilon;
};

#endif // KMEANS_SEGMENTER_H

