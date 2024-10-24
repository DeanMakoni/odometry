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
	
	        // coarse mosaic
	        
	        // Detect overlapping areas
		std::unique_ptr<OverlapDetect> overlapTrack1 = std::make_unique<OverlapDetect>();
		std::unique_ptr<OverlapDetect> overlapTrack2 = std::make_unique<OverlapDetect>();
		overlapTrack1->extractXY(result1);
		overlapTrack2->extractXY(result2);
		overlapTrack1->calculateLeastSquares();
		overlapTrack2->calculateLeastSquares();
		// determine edge of overlap area
		overlapTrack1->edgeoverlap(this.D);
		overlapTrack2->edgeoverlap(-this.D);
		//check side scan sonar images that have geocordnates that is in between the overlap area edges
		// select feature points in overlapping areas 
		std::unique_ptr<OrbFeatureMatcher> FPs = std::make_unique<OrbFeatureMatcher>();
		FPs->matchAndFilter(this.referenceImage, this.sensedImage);
		
		
	}
private:
        // swath width
        double D;
        // reference image to mosaic with
        cv::Mat referenceImage;
        // sensed image to mosaic with 
        cv::Mat sensedImage;
        //optimised results for track 1
	const gtsam::Values result1;
	//optimised results for track 2
	const gtsam::Values result2;
	std::Vector<float> tkln1_positions;
	std::Vector<float> tkln2_positions;

};

