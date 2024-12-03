import numpy as np
import matplotlib.pyplot as plt

# Load x, y, z, and timestamp columns from each file
positions = np.loadtxt('positions.txt', usecols=(0, 1, 2, 3))
ground_truth = np.loadtxt('ground_truth.txt', usecols=(0, 1, 2, 6))

# Extract x, y, z coordinates and timestamps
x = positions[:, 0]
y = positions[:, 1]
z = positions[:, 2]
time_pos = positions[:, 3]  # Timestamps for positions

x_gt = ground_truth[:, 0]
y_gt = ground_truth[:, 1]
z_gt = ground_truth[:, 2]
time_gt = ground_truth[:, 3]  # Timestamps for ground truth

# Plot each coordinate (x, y, z) vs time for SLAM and ground truth data
fig, axs = plt.subplots(3, 1, figsize=(12, 12))

# Plot X component
axs[0].plot(time_pos, x, marker='o', color='b', linestyle='-', markersize=3, label='SLAM X')
axs[0].plot(time_gt, x_gt, marker='x', color='r', linestyle='--', markersize=3, label='Ground Truth X')
axs[0].set_title('X Coordinate vs Time')
axs[0].set_xlabel('Time (ms)')
axs[0].set_ylabel('X')
axs[0].legend()

# Plot Y component
axs[1].plot(time_pos, y, marker='o', color='b', linestyle='-', markersize=3, label='SLAM Y')
axs[1].plot(time_gt, y_gt, marker='x', color='r', linestyle='--', markersize=3, label='Ground Truth Y')
axs[1].set_title('Y Coordinate vs Time')
axs[1].set_xlabel('Time (ms)')
axs[1].set_ylabel('Y')
axs[1].legend()

# Plot Z component
axs[2].plot(time_pos, z, marker='o', color='b', linestyle='-', markersize=3, label='SLAM Z')
axs[2].plot(time_gt, z_gt, marker='x', color='r', linestyle='--', markersize=3, label='Ground Truth Z')
axs[2].set_title('Z Coordinate vs Time')
axs[2].set_xlabel('Time (ms)')
axs[2].set_ylabel('Z')
axs[2].legend()

plt.tight_layout()
plt.show()

