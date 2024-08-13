import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# Load data from files
positions = np.loadtxt('positions.txt')
ground_truth = np.loadtxt('ground_truth.txt')
navstates = np.loadtxt('navstates.txt')

# Extract x, y, z coordinates for each dataset
x_pos, y_pos, z_pos = positions[:, 0], positions[:, 1], positions[:, 2]
x_gt, y_gt, z_gt = ground_truth[:, 0], ground_truth[:, 1], ground_truth[:, 2]
x_nav, y_nav, z_nav = navstates[:, 0], navstates[:, 1], navstates[:, 2]

# Create the figure and subplots
fig = plt.figure(figsize=(18, 12))

# 3D Trajectory Plot comparing SLAM Trajectory, Ground Truth, and Navstates
ax1 = fig.add_subplot(231, projection='3d')
ax1.plot(x_pos, y_pos, z_pos, marker='o', color='b', linestyle='-', markersize=3, label='SLAM Trajectory')
ax1.plot(x_gt, y_gt, z_gt, marker='x', color='r', linestyle='--', markersize=3, label='Ground Truth')
ax1.plot(x_nav, y_nav, z_nav, marker='s', color='g', linestyle='-', markersize=3, label='Navstates')
ax1.set_title('3D Trajectory Comparison')
ax1.set_xlabel('X')
ax1.set_ylabel('Y')
ax1.set_zlabel('Z')
ax1.legend()

# XY Plane Plot for SLAM Trajectory and Ground Truth
ax2 = fig.add_subplot(232)
ax2.plot(x_pos, y_pos, marker='o', color='b', linestyle='-', markersize=3, label='SLAM Trajectory')
ax2.plot(x_gt, y_gt, marker='x', color='r', linestyle='--', markersize=3, label='Ground Truth')
ax2.plot(x_nav, y_nav, marker='s', color='g', linestyle='-', markersize=3, label='Navstates')
ax2.set_title('XY Plane Comparison')
ax2.set_xlabel('X')
ax2.set_ylabel('Y')
ax2.legend()

# XZ Plane Plot for SLAM Trajectory and Ground Truth
ax3 = fig.add_subplot(233)
ax3.plot(x_pos, z_pos, marker='o', color='b', linestyle='-', markersize=3, label='SLAM Trajectory')
ax3.plot(x_gt, z_gt, marker='x', color='r', linestyle='--', markersize=3, label='Ground Truth')
ax3.plot(x_nav, z_nav, marker='s', color='g', linestyle='-', markersize=3, label='Navstates')
ax3.set_title('XZ Plane Comparison')
ax3.set_xlabel('X')
ax3.set_ylabel('Z')
ax3.legend()

# YZ Plane Plot for SLAM Trajectory and Ground Truth
ax4 = fig.add_subplot(234)
ax4.plot(y_pos, z_pos, marker='o', color='b', linestyle='-', markersize=3, label='SLAM Trajectory')
ax4.plot(y_gt, z_gt, marker='x', color='r', linestyle='--', markersize=3, label='Ground Truth')
ax4.plot(y_nav, z_nav, marker='s', color='g', linestyle='-', markersize=3, label='Navstates')
ax4.set_title('YZ Plane Comparison')
ax4.set_xlabel('Y')
ax4.set_ylabel('Z')
ax4.legend()

# Show the plot
plt.tight_layout()
plt.show()


