import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# Load position data (x, y, z, timestamp)
positions = np.loadtxt('positions.txt', usecols=(0, 1, 2, 3))
ground_truth = np.loadtxt('ground_truth.txt', usecols=(0, 1, 2, 3))

# Extract coordinates and timestamps
x, y, z, time_pos = positions[:, 0], positions[:, 1], positions[:, 2], positions[:, 3]
x_gt, y_gt, z_gt, time_gt = ground_truth[:, 0], ground_truth[:, 1], ground_truth[:, 2], ground_truth[:, 3]

# Calculate Absolute Trajectory Error (ATE)
errors = np.sqrt((x - x_gt)**2 + (y - y_gt)**2 + (z - z_gt)**2)

# Plot ATE over time
plt.figure(figsize=(10, 5))
plt.plot(time_pos, errors, color='purple', label='ATE (Absolute Trajectory Error)')
plt.xlabel('Time (ms)')
plt.ylabel('Error (meters)')
plt.title('Absolute Trajectory Error (ATE) Over Time')
plt.legend()
plt.grid()
plt.show()

# Plot X, Y, Z errors over time
fig, axs = plt.subplots(3, 1, figsize=(12, 12))

# X component error
axs[0].plot(time_pos, x - x_gt, color='blue', linestyle='-', markersize=3, label='X Error')
axs[0].set_title('X Coordinate Error vs Time')
axs[0].set_xlabel('Time (ms)')
axs[0].set_ylabel('X Error (meters)')
axs[0].legend()

# Y component error
axs[1].plot(time_pos, y - y_gt, color='green', linestyle='-', markersize=3, label='Y Error')
axs[1].set_title('Y Coordinate Error vs Time')
axs[1].set_xlabel('Time (ms)')
axs[1].set_ylabel('Y Error (meters)')
axs[1].legend()

# Z component error
axs[2].plot(time_pos, z - z_gt, color='red', linestyle='-', markersize=3, label='Z Error')
axs[2].set_title('Z Coordinate Error vs Time')
axs[2].set_xlabel('Time (ms)')
axs[2].set_ylabel('Z Error (meters)')
axs[2].legend()

plt.tight_layout()
plt.show()

# 3D Trajectory Comparison Plot
fig = plt.figure(figsize=(10, 8))
ax = fig.add_subplot(111, projection='3d')
ax.plot(x, y, z, marker='o', color='blue', linestyle='-', markersize=3, label='SLAM/Optimized Trajectory')
ax.plot(x_gt, y_gt, z_gt, marker='x', color='red', linestyle='--', markersize=3, label='Ground Truth Trajectory')
ax.set_xlabel('X (meters)')
ax.set_ylabel('Y (meters)')
ax.set_zlabel('Z (meters)')
ax.set_title('3D Trajectory Comparison')
ax.legend()
plt.show()

# Additional: Histogram of ATE distribution
plt.figure(figsize=(10, 5))
plt.hist(errors, bins=30, color='teal', edgecolor='black')
plt.xlabel('Absolute Trajectory Error (meters)')
plt.ylabel('Frequency')
plt.title('Distribution of Absolute Trajectory Error (ATE)')
plt.grid()
plt.show()
