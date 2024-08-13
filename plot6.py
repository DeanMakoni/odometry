import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# Load positions from the files
positions = np.loadtxt('positions.txt')
ground_truth = np.loadtxt('ground_truth.txt')

# Extract x, y, z coordinates
x = positions[:, 0]
y = positions[:, 1]
z = positions[:, 2]

x_gt = ground_truth[:, 0]
y_gt = ground_truth[:, 1]
z_gt = ground_truth[:, 2]

# Create the figure and subplots
fig = plt.figure(figsize=(18, 12))

# Combined 3D Trajectory Plot
ax1 = fig.add_subplot(231, projection='3d')
ax1.plot(x, y, z, marker='o', color='b', linestyle='-', markersize=3, label='SLAM Trajectory')
ax1.plot(x_gt, y_gt, z_gt, marker='x', color='r', linestyle='--', markersize=3, label='Ground Truth')
ax1.set_title('3D Trajectory')
ax1.set_xlabel('X')
ax1.set_ylabel('Y')
ax1.set_zlabel('Z')
ax1.legend()

# Separate 3D Trajectory Plot for SLAM Trajectory
ax2 = fig.add_subplot(232, projection='3d')
ax2.plot(x, y, z, marker='o', color='b', linestyle='-', markersize=3, label='SLAM Trajectory')
ax2.set_title('SLAM 3D Trajectory')
ax2.set_xlabel('X')
ax2.set_ylabel('Y')
ax2.set_zlabel('Z')
ax2.legend()

# Separate 3D Trajectory Plot for Ground Truth
ax3 = fig.add_subplot(233, projection='3d')
ax3.plot(x_gt, y_gt, z_gt, marker='x', color='r', linestyle='--', markersize=3, label='Ground Truth')
ax3.set_title('Ground Truth 3D Trajectory')
ax3.set_xlabel('X')
ax3.set_ylabel('Y')
ax3.set_zlabel('Z')
ax3.legend()

# Combined XY Plane Plot
ax4 = fig.add_subplot(234)
ax4.plot(x, y, marker='o', color='b', linestyle='-', markersize=3, label='SLAM Trajectory')
ax4.plot(x_gt, y_gt, marker='x', color='r', linestyle='--', markersize=3, label='Ground Truth')
ax4.set_title('XY Plane')
ax4.set_xlabel('X')
ax4.set_ylabel('Y')
ax4.legend()

plt.tight_layout()
plt.show()

