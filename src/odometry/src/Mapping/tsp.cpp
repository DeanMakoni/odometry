/*
 *  Thin Plate Spline demo/example in C++
 *
 *  - a simple TPS editor, using the Boost uBlas library for large
 *    matrix operations and OpenGL + GLUT for 2D function visualization
 *    (curved plane) and user interface
 *
 *  Copyright (C) 2003,2005 by Jarno Elonen
 *
 *  TPSDemo is Free Software / Open Source with a very permissive
 *  license:
 *
 *  Permission to use, copy, modify, distribute and sell this software
 *  and its documentation for any purpose is hereby granted without fee,
 *  provided that the above copyright notice appear in all copies and
 *  that both that copyright notice and this permission notice appear
 *  in supporting documentation.  The authors make no representations
 *  about the suitability of this software for any purpose.
 *  It is provided "as is" without express or implied warranty.
 *
 *  TODO:
 *    - implement TPS approximation 3 as suggested in paper
 *      Gianluca Donato and Serge Belongie, 2002: "Approximation
 *      Methods for Thin Plate Spline Mappings and Principal Warps"
 */



#include <vector>
#include <cmath>
#include <cstdio>
#include <cstring>
#include "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/odometry/include/odometry/Mapping/tsp.h"

using namespace boost::numeric::ublas;

// ========= BEGIN INTERESTING STUFF  =========

double TPS::tps_base_func(double r)
{
	if ( r == 0.0 )
	    return 0.0;
	 else
	    return r*r * log(r);
}


/*
 *  Calculate Thin Plate Spline (TPS) weights from
 *  control points and build a new height grid by
 *  interpolating with them.
 */
void TPS::calc_tps_x(std::vector<float>& x_reference, std::vector<float>& y_reference,
		                std::vector<float>& x_matched,  std::vector<float>& y_matched)
	{
	  // You We need at least 3 points to define a plane
	  if ( control_points.size() < 3 )
	    return;

	  unsigned p = control_points.size();
	  
	  
	  // Allocate the matrix and vector
	  matrix<double> mtx_l(p+3, p+3);
	  matrix<double> mtx_v(p+3, 1);
	  matrix<double> mtx_orig_k(p, p);

	  // Fill K (p x p, upper left of L) and calculate
	  // mean edge length from control points
	  //
	  // K is symmetrical so we really have to
	  // calculate only about half of the coefficients.
	  double a = 0.0;
	  for ( unsigned i=0; i<p; ++i )
	  {
	    for ( unsigned j=i+1; j<p; ++j )
	    {
	      Vec pt_i = control_points[i];
	      Vec pt_j = control_points[j];
	      pt_i.z = pt_j.z = 0;
	      double elen = (pt_i - pt_j).len();
	      mtx_l(i,j) = mtx_l(j,i) =
		mtx_orig_k(i,j) = mtx_orig_k(j,i) =
		  tps_base_func(elen);
	      a += elen * 2; // same for upper & lower tri
	    }
	  }
	  a /= (double)(p*p);

	  // Fill the rest of L
	  for ( unsigned i=0; i<p; ++i )
	  {
	    // diagonal: reqularization parameters (lambda * a^2)
	    mtx_l(i,i) = mtx_orig_k(i,i) =
	      regularization * (a*a);

	    // P (p x 3, upper right)
	    mtx_l(i, p+0) = 1.0;
	    mtx_l(i, p+1) = sen_points[i].x;
	    mtx_l(i, p+2) = sen_points[i].y;

	    // P transposed (3 x p, bottom left)
	    mtx_l(p+0, i) = 1.0;
	    mtx_l(p+1, i) = sen_points[i].x;
	    mtx_l(p+2, i) = sen_points[i].y;
	  }
	  // O (3 x 3, lower right)
	  for ( unsigned i=p; i<p+3; ++i )
	    for ( unsigned j=p; j<p+3; ++j )
	      mtx_l(i,j) = 0.0;


	  // Fill the right hand vector V
	  for ( unsigned i=0; i<p; ++i )
	    mtx_v(i,0) = control_points[i].x - sen_points[i].x; 
	  mtx_v(p+0, 0) = mtx_v(p+1, 0) = mtx_v(p+2, 0) = 0.0;

	  // Solve the linear system "inplace"
	  if (0 != LU_Solve(mtx_l, mtx_v))
	  {
	    puts( "Singular matrix! Aborting." );
	    exit(1);
	  }

	  // Calculate new values of x and store in a vector
	  //for ( int x=-GRID_W/2; x<GRID_W/2; ++x )
	  //{
	  //  for ( int z=-GRID_H/2; z<GRID_H/2; ++z )
	  //  {
	     
	      Vec pt_i, pt_cur;
	      for ( unsigned i=0; i<p; ++i )
	      {
	        //double h = mtx_v(p+0, 0) + mtx_v(p+1, 0)*x + mtx_v(p+2, 0)*y;
	        double h = mtx_v(p+0, 0) + mtx_v(p+1, 0)*i + mtx_v(p+2, 0)*i;
		pt_i = control_points[i];
		pt_i.z = 0;
		pt_cur = sen_points[i];
		pt_cur.z = 0;
		h += mtx_v(i,0) * tps_base_func( ( pt_i - pt_cur ).len());
		x_output[i] = h;
	      }
	      //grid[x+GRID_W/2][z+GRID_H/2] = h;
	   // }
	  //}

	  // Calc bending energy
	  matrix<double> w( p, 1 );
	  for ( int i=0; i<p; ++i )
	    w(i,0) = mtx_v(i,0);
	  matrix<double> be = prod( prod<matrix<double> >( trans(w), mtx_orig_k ), w );
	  bending_energy = be(0,0);
	}

void TPS::calc_tps_y(std::vector<float>& x_reference, std::vector<float>& y_reference,
		                std::vector<float>& x_matched,  std::vector<float>& y_matched)
	{
	  // You We need at least 3 points to define a plane
	  if ( control_points.size() < 3 )
	    return;

	  unsigned p = control_points.size();
	  
	  
	  // Allocate the matrix and vector
	  matrix<double> mtx_l(p+3, p+3);
	  matrix<double> mtx_v(p+3, 1);
	  matrix<double> mtx_orig_k(p, p);

	  // Fill K (p x p, upper left of L) and calculate
	  // mean edge length from control points
	  //
	  // K is symmetrical so we really have to
	  // calculate only about half of the coefficients.
	  double a = 0.0;
	  for ( unsigned i=0; i<p; ++i )
	  {
	    for ( unsigned j=i+1; j<p; ++j )
	    {
	      Vec pt_i = control_points[i];
	      Vec pt_j = control_points[j];
	      pt_i.z = pt_j.z = 0;
	      double elen = (pt_i - pt_j).len();
	      mtx_l(i,j) = mtx_l(j,i) =
		mtx_orig_k(i,j) = mtx_orig_k(j,i) =
		  tps_base_func(elen);
	      a += elen * 2; // same for upper & lower tri
	    }
	  }
	  a /= (double)(p*p);

	  // Fill the rest of L
	  for ( unsigned i=0; i<p; ++i )
	  {
	    // diagonal: reqularization parameters (lambda * a^2)
	    mtx_l(i,i) = mtx_orig_k(i,i) =
	      regularization * (a*a);

	    // P (p x 3, upper right)
	    mtx_l(i, p+0) = 1.0;
	    mtx_l(i, p+1) = sen_points[i].x;
	    mtx_l(i, p+2) = sen_points[i].y;

	    // P transposed (3 x p, bottom left)
	    mtx_l(p+0, i) = 1.0;
	    mtx_l(p+1, i) = sen_points[i].x;
	    mtx_l(p+2, i) = sen_points[i].y;
	  }
	  // O (3 x 3, lower right)
	  for ( unsigned i=p; i<p+3; ++i )
	    for ( unsigned j=p; j<p+3; ++j )
	      mtx_l(i,j) = 0.0;


	  // Fill the right hand vector V
	  for ( unsigned i=0; i<p; ++i )
	    mtx_v(i,0) = control_points[i].y - sen_points[i].y; 
	  mtx_v(p+0, 0) = mtx_v(p+1, 0) = mtx_v(p+2, 0) = 0.0;

	  // Solve the linear system "inplace"
	  if (0 != LU_Solve(mtx_l, mtx_v))
	  {
	    puts( "Singular matrix! Aborting." );
	    exit(1);
	  }

	  // Calculate new values of x and store in a vector
	  //for ( int x=-GRID_W/2; x<GRID_W/2; ++x )
	  //{
	  //  for ( int z=-GRID_H/2; z<GRID_H/2; ++z )
	  //  {
	     
	      Vec pt_i, pt_cur;
	      for ( unsigned i=0; i<p; ++i )
	      {
	        double h = mtx_v(p+0, 0) + mtx_v(p+1, 0)*i + mtx_v(p+2, 0)*i;
		pt_i = control_points[i];
		pt_i.z = 0;
		pt_cur = sen_points[i];
		pt_cur.z = 0;
		h += mtx_v(i,0) * tps_base_func( ( pt_i - pt_cur ).len());
		y_output[i] = h;
	      }
	      //grid[x+GRID_W/2][z+GRID_H/2] = h;
	   // }
	  //}

	  // Calc bending energy
	  matrix<double> w( p, 1 );
	  for ( int i=0; i<p; ++i )
	    w(i,0) = mtx_v(i,0);
	  matrix<double> be = prod( prod<matrix<double> >( trans(w), mtx_orig_k ), w );
	  bending_energy = be(0,0);
	}
	
//method used  to make fill Vec with cople of feature points coordinates and track line cooordnates
//cfp - couple feature points
//tlp - traack lines points
std::vector< Vec > TPS::fillVec(std::vector<float> x_cfp,std::vector<float> y_cfp, 
	                   std::vector<float> x_tlp,std::vector<float>  y_tlp){      
	// Fill control_points with x_reference and y_reference
	 if (x_cfp.size() == y_cfp.size()) {
	    control_points.reserve(x_cfp.size() + x_cfp.size());  // Reserve space for all points

	    for (size_t i = 0; i < x_cfp.size(); ++i) {
		control_points.emplace_back(x_cfp[i], y_cfp[i], 0.0f);  // z is 0
	    }
	 } else {
	    throw std::runtime_error("Size mismatch between x_reference and y_reference");
	 }

	 // Now fill control_points with x_matched and y_matched, appending to the end
	 if (x_tlp.size() == y_tlp.size()) {
	    for (size_t i = 0; i < x_matched.size(); ++i) {
		control_points.emplace_back(x_tlp[i], y_tlp[i], 0.0f);  // z is 0
	    }
	 } else {
	    throw std::runtime_error("Size mismatch between x_matched and y_matched");
	 }

}
	
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
