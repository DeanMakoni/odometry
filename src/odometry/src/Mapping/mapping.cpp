// Dean Makoni
// 24 October 2024
#include <opencv2/opencv.hpp>
#include <iostream>
#include <vector>
#include <gtsam/geometry/Point3.h> // For gtsam::Point3
#include <gtsam/nonlinear/Values.h> // For gtsam::Values
#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/Mapping/overlapdetect.h"
#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/Mapping/coarse_mosaic.h"
#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/Mapping/orb_matcher.h"
#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/Mapping/kmeans_segmentation.h"


class Mosaic {

public:
	// D is swath width
	Mossaic(double D, 
	        cv::Mat referenceImage,
	        cv::Mat sensedImage,
	        const gtsam::Values result1,
	        const gtsam::Values  result2 ) : D(D), 
	        referenceImage(referenceImage),
	        sensedImage(sensedImage),
	        result(result), result2(result2) {}
	
	cv::Mat coarseMosaic(){
	
		std::unique_ptr<Laplacian> coarse_mosaic = std::make_unique<Laplacian>(this.referenceImage, this.sensedImage );
		coarse_mosaic->blendImages();
		
		return coarse_mosaic->result;
	}
	cv::Mat finemosaic(){

	        // Detect overlapping areas
		std::unique_ptr<OverlapDetect> overlapTrack1 = std::make_unique<OverlapDetect>();
		std::unique_ptr<OverlapDetect> overlapTrack2 = std::make_unique<OverlapDetect>();
		overlapTrack1->extractXY(result1);
		overlapTrack2->extractXY(result2);
		overlapTrack1->calculateLeastSquares();
		overlapTrack2->calculateLeastSquares();
		// determine edge of overlap area
		std::vector<float> track1 = overlapTrack1->edgeoverlap(this.D);
		std::vector<float> track2 = overlapTrack2->edgeoverlap(-this.D);
		//check side scan sonar images that have geocordnates that is in between the overlap area edges
		// select feature points in overlapping areas 
		// check if the feauters are geographically constrained using geographical coordinates
		std::unique_ptr<OrbFeatureMatcher> FPs = std::make_unique<OrbFeatureMatcher>();
		FPs->matchAndFilter(this.referenceImage, this.sensedImage);
		// check if macthing features are in overlapping areas
		// take coordinates of the macthing features in overlapping areas
		// do elasticty macthing
		// correct coarsely mosaicked image
		
		//segment overlapping areas using track1 and 2
		std::unique_ptr<KMeansSegmenter> segmenter = std::make_unique<KMeansSegmenter>();
		// Determine the optimal K using the elbow method
               int optimalK = segmenter->determineOptimalK(continuousROI, 10);
               // Perform K-means segmentation on the ROI
               cv::Mat labels;
               cv::Mat segmentedROI = segmenter->kMeansSegmentation(continuousROI, optimalK, labels);
		
		// check if there is enough FP points
		
		// add method to do so
		//establish coordinate transform model
		// get coordinates of the macth and append trackline positions
		std::unique_ptr<TPS> tsp_x = std::make_unique<TPS>();
               //fiil reference image first
               std::vector tsp->fillControlVec(x_cfp, y_cfp, x_tlp, y_tlp);
               std::vector tsp->fillSenVec(x_cfp, y_cfp, x_tlp, y_tlp);
               // get the ne
               
	}
private:
        // swath width
        double D;
        // reference image to mosaic with
        cv::Mat referenceImage;
        // sensed image to mosaic with 
        cv::Mat sensedImage;
        //optimised results for track 1// vector of values
	const gtsam::Values result1;
	//optimised results for track 2// vector of values
	const gtsam::Values result2;
	std::Vector<float> tkln1_positions;
	std::Vector<float> tkln2_positions;

};

