#include <opencv2/opencv.hpp>
#include <iostream>
#include <vector>

using namespace cv;
using namespace std;

class KMeansSegmenter {
public:
    // Constructor
    KMeansSegmenter(int maxIterations = 100, double epsilon = 1.0)
        : maxIterations(maxIterations), epsilon(epsilon) {}

    // Function to perform K-means segmentation on an ROI
    Mat kMeansSegmentation(const Mat& inputImage, int k, Mat& labels) {
        // Ensure the matrix is continuous
        Mat continuousImage = inputImage.isContinuous() ? inputImage : inputImage.clone();

        // Reshape the image to a 2D array of pixels
        Mat reshapedImage = continuousImage.reshape(1, continuousImage.rows * continuousImage.cols);
        reshapedImage.convertTo(reshapedImage, CV_32F); // Convert to float

        // Define criteria for K-means (max iterations and epsilon)
        TermCriteria criteria(TermCriteria::EPS + TermCriteria::COUNT, maxIterations, epsilon);

        // Output variables for K-means
        Mat centers;

        // Perform K-means clustering
        kmeans(reshapedImage, k, labels, criteria, 10, KMEANS_PP_CENTERS, centers);

        // Convert the centers back to 8-bit values
        centers.convertTo(centers, CV_8U);

        // Create the segmented image by mapping each pixel to the center color
        Mat segmentedImage(inputImage.size(), inputImage.type());
        for (int i = 0; i < inputImage.rows * inputImage.cols; i++) {
            int clusterIndex = labels.at<int>(i);
            segmentedImage.at<Vec3b>(i / inputImage.cols, i % inputImage.cols) = Vec3b(
                centers.at<uchar>(clusterIndex, 0),
                centers.at<uchar>(clusterIndex, 1),
                centers.at<uchar>(clusterIndex, 2)
            );
        }

        return segmentedImage;
    }

    // Function to calculate the within-group sum of squares (WGSS)
    double calculateWGSS(const Mat& inputImage, int k) {
        // Ensure the matrix is continuous
        Mat continuousImage = inputImage.isContinuous() ? inputImage : inputImage.clone();

        // Reshape the image to a 2D array of pixels
        Mat reshapedImage = continuousImage.reshape(1, continuousImage.rows * continuousImage.cols);
        reshapedImage.convertTo(reshapedImage, CV_32F); // Convert to float

        // Define criteria for K-means (max iterations and epsilon)
        TermCriteria criteria(TermCriteria::EPS + TermCriteria::COUNT, maxIterations, epsilon);

        // Output variables for K-means
        Mat labels, centers;

        // Perform K-means clustering
        kmeans(reshapedImage, k, labels, criteria, 10, KMEANS_PP_CENTERS, centers);

        // Calculate WGSS: sum of squared distances between points and their cluster center
        double wgss = 0.0;
        for (int i = 0; i < reshapedImage.rows; i++) {
            int clusterIndex = labels.at<int>(i);
            Vec3f point = reshapedImage.at<Vec3f>(i);
            Vec3f center = centers.at<Vec3f>(clusterIndex);
            double distanceSquared = norm(point - center);
            wgss += distanceSquared * distanceSquared;
        }

        return wgss;
    }

    // Function to determine the optimal K using the elbow method
    int determineOptimalK(const Mat& inputImage, int maxK = 10) {
        vector<double> wgssValues;

        for (int k = 1; k <= maxK; k++) {
            double wgss = calculateWGSS(inputImage, k);
            wgssValues.push_back(wgss);
            cout << "K: " << k << " - WGSS: " << wgss << endl;
        }

        // Implement simple elbow method: Find where the decrease in WGSS is smallest
        int optimalK = 1;
        double minDiff = INFINITY;
        for (int k = 2; k < maxK; k++) {
            double diff = abs(wgssValues[k - 2] - wgssValues[k - 1]);
            if (diff < minDiff) {
                minDiff = diff;
                optimalK = k;
            }
        }

        return optimalK;
    }

    // Function to draw bounding boxes on distinct segmented clusters
    void drawBoundingBoxesOnClusters(Mat& segmentedImage, const Mat& labels, int k) {
        for (int clusterIndex = 0; clusterIndex < k; clusterIndex++) {
            // Create a binary mask for each cluster
            Mat clusterMask = Mat::zeros(segmentedImage.size(), CV_8U);
            for (int i = 0; i < labels.rows; i++) {
                if (labels.at<int>(i) == clusterIndex) {
                    int row = i / segmentedImage.cols;
                    int col = i % segmentedImage.cols;
                    clusterMask.at<uchar>(row, col) = 255;
                }
            }

            // Find contours of the segmented regions in the cluster
            vector<vector<Point>> contours;
            findContours(clusterMask, contours, RETR_EXTERNAL, CHAIN_APPROX_SIMPLE);

            // Draw bounding boxes around each distinct region in the cluster
            for (size_t i = 0; i < contours.size(); i++) {
                Rect boundingBox = boundingRect(contours[i]);
                rectangle(segmentedImage, boundingBox, Scalar(0, 255, 0), 2); // Green boxes
            }
        }
    }

private:
    int maxIterations;
    double epsilon;
};

// Main function to run the example
int main() {
    // Load a sample image
    Mat image = imread("WhatsApp Image 2024-10-09 at 1.17.14 PM.jpeg");

    if (image.empty()) {
        cout << "Could not open or find the image!" << endl;
        return -1;
    }

    // Define the region of interest (ROI) coordinates for the bottom-right corner
    int roiWidth = image.cols / 2;
    int roiHeight = image.rows / 2;
    Rect roi(image.cols - roiWidth, image.rows - roiHeight, roiWidth, roiHeight);

    // Extract the ROI (bottom-right corner) from the image
    Mat roiImage = image(roi);

    // Ensure the ROI is continuous
    Mat continuousROI = roiImage.isContinuous() ? roiImage : roiImage.clone();

    // Create an instance of KMeansSegmenter
    KMeansSegmenter segmenter;

    // Determine the optimal K using the elbow method
    int optimalK = segmenter.determineOptimalK(continuousROI, 10);
    cout << "Optimal K: " << optimalK << endl;

    // Perform K-means segmentation on the ROI
    Mat labels;
    Mat segmentedROI = segmenter.kMeansSegmentation(continuousROI, optimalK, labels);

    // Draw bounding boxes around each segmented region (cluster) in the ROI
    segmenter.drawBoundingBoxesOnClusters(segmentedROI, labels, optimalK);

    // Place the segmented ROI back into the original image (optional)
    segmentedROI.copyTo(image(roi));

    // Display the original image with the segmented ROI
    imshow("Original Image with Segmented ROI", image);

    // Display the segmented ROI
    imshow("Segmented ROI with Bounding Boxes", segmentedROI);

    // Save the result if needed
    imwrite("segmented_roi_with_boxes.jpg", segmentedROI);

    waitKey(0);
    return 0;
}

