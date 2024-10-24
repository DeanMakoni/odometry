//Dean
//9 October

#include <opencv2/opencv.hpp>
#include <iostream>
#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/Mapping/coarse_mosaic.h"


  Laplacian::Laplacian(cv::Mat image1, cv::Mat image2) {
        // Load images
       // A = cv::imread(image1_path);
       // B = cv::imread(image2_path);
          A = image1;
          B = image2;
          
        if (A.empty() || B.empty()) {
            std::cerr << "Error: Could not load images. Check file paths." << std::endl;
            exit(-1);
        }
        
        // Resize the second image to match the first image's size
      if (A.size() != B.size()) {
         std::cerr << "Warning: Images are of different sizes. Resizing image B to match image A." << std::endl;
         cv::resize(B, B, A.size()); // Resize image B to match A's size
     }
  }

 void Laplacian::blendImages() {
        buildGaussianPyramids();
        buildLaplacianPyramids();
        blendPyramids();
        reconstructImage();
  }

 void Laplacian::saveBlendedImage(const std::string& output_path) {
        cv::imwrite(output_path, result);
    }


 void Laplacian::buildGaussianPyramids() {
        // Generate Gaussian pyramid for A
        cv::Mat G = A.clone();
        gpA.push_back(G);
        for (int i = 0; i < 6; i++) {
            cv::pyrDown(G, G);
            gpA.push_back(G);
        }

        // Generate Gaussian pyramid for B
        G = B.clone();
        gpB.push_back(G);
        for (int i = 0; i < 6; i++) {
            cv::pyrDown(G, G);
            gpB.push_back(G);
        }
    }

 void Laplacian::buildLaplacianPyramids() {
        // Generate Laplacian Pyramid for A
        lpA.push_back(gpA[5]); // Top level of Laplacian pyramid
        for (int i = 5; i > 0; i--) {
            cv::Mat GE, L;
            cv::pyrUp(gpA[i], GE, gpA[i-1].size());
            cv::subtract(gpA[i-1], GE, L);
            lpA.push_back(L);
        }

        // Generate Laplacian Pyramid for B
        lpB.push_back(gpB[5]);
        for (int i = 5; i > 0; i--) {
            cv::Mat GE, L;
            cv::pyrUp(gpB[i], GE, gpB[i-1].size());
            cv::subtract(gpB[i-1], GE, L);
            lpB.push_back(L);
        }
   }
/**
 void blendPyramids() {
    // Combine both Laplacian pyramids (A and B) by adding them together, blending the bottom quarter of A and the top quarter of B
    int blendLevel = lpA.size() / 4; // Determine the level corresponding to the bottom quarter

    for (size_t i = 0; i < lpA.size(); i++) {
        cv::Mat blended;

        if (i >= blendLevel) {
            // Blend the bottom quarter of A with the top quarter of B
            cv::addWeighted(lpA[i], 1.0, lpB[i], 0.0, 0.0, blended);
        } else {
            // Use the original level from A
            blended = lpA[i].clone();
        }

        blendedPyramid.push_back(blended);
    }
}
**/
void Laplacian::blendPyramids() {
  // Now add left and right halves of images in each level
 
    std::vector<cv::Mat> LS;
    for (size_t i = 0; i < lpA.size(); i++) {
        cv::Mat ls;
        int cols = lpA[i].cols;
        int rows = lpA[i].rows;
        //cv::hconcat(lpA[i](cv::Rect(0, 0, cols / 2, lpA[i].rows)),
        ///            lpB[i](cv::Rect(cols / 2, 0, cols / 2, lpB[i].rows)),
        //            ls);
        cv::vconcat(lpA[i](cv::Rect(0, 0, lpA[i].cols, rows / 2)),
                   lpB[i](cv::Rect(0, rows / 2, lpB[i].cols, rows / 2)),
                   ls);
        blendedPyramid.push_back(ls);
    }
}


void Laplacian::reconstructImage() {
        // Reconstruct the final blended image from the blended pyramid
        result = blendedPyramid[0];
        for (size_t i = 1; i < blendedPyramid.size(); i++) {
            cv::Mat temp;
            cv::resize(result, temp, blendedPyramid[i].size()); // Resize result to match blendedPyramid[i]
            //cv::pyrUp(result, temp, blendedPyramid[i].size());
            cv::add(temp, blendedPyramid[i], result);
        }
    }
    
/**
int main() {
    // Create Laplacian object and blend the images
    Laplacian laplacian("WhatsApp Image 2024-10-09 at 1.17.14 PM.jpeg", "WhatsApp Image 2024-10-09 at 1.17.15 PM.jpeg");

    // Perform the blending operation
    laplacian.blendImages();

    // Save the blended image
    laplacian.saveBlendedImage("Pyramid_blended_image.jpg");

    return 0;
}

