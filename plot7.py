import numpy as np
import matplotlib.pyplot as plt

# Load the ground truth file and extract x, y, z velocity components and timestamps
ground_truth = np.loadtxt('ground_truth.txt', usecols=(3, 4, 5, 6))  # Velocity (x, y, z) and timestamp
x_gt_vel = ground_truth[:, 0]
y_gt_vel = ground_truth[:, 1]
z_gt_vel = ground_truth[:, 2]
time_gt = ground_truth[:, 3]

# Load the optimized velocity file and extract x, y, z velocity components and timestamps
velocity = np.loadtxt('velocity.txt', usecols=(0, 1, 2, 3))  # Optimized velocity (x, y, z) and timestamp
x_vel = velocity[:, 0]
y_vel = velocity[:, 1]
z_vel = velocity[:, 2]
time_vel = velocity[:, 3]

# Create subplots for each velocity component (x, y, z) vs. time
fig, axs = plt.subplots(3, 1, figsize=(12, 12))

# Plot X velocity component
axs[0].plot(time_gt, x_gt_vel, marker='x', color='r', linestyle='--', markersize=3, label='Ground Truth X Velocity')
axs[0].plot(time_vel, x_vel, marker='o', color='b', linestyle='-', markersize=3, label='Optimized X Velocity')
axs[0].set_title('X Velocity vs Time')
axs[0].set_xlabel('Time (ms)')
axs[0].set_ylabel('Velocity (X)')
axs[0].legend()

# Plot Y velocity component
axs[1].plot(time_gt, y_gt_vel, marker='x', color='r', linestyle='--', markersize=3, label='Ground Truth Y Velocity')
axs[1].plot(time_vel, y_vel, marker='o', color='b', linestyle='-', markersize=3, label='Optimized Y Velocity')
axs[1].set_title('Y Velocity vs Time')
axs[1].set_xlabel('Time (ms)')
axs[1].set_ylabel('Velocity (Y)')
axs[1].legend()

# Plot Z velocity component
axs[2].plot(time_gt, z_gt_vel, marker='x', color='r', linestyle='--', markersize=3, label='Ground Truth Z Velocity')
axs[2].plot(time_vel, z_vel, marker='o', color='b', linestyle='-', markersize=3, label='Optimized Z Velocity')
axs[2].set_title('Z Velocity vs Time')
axs[2].set_xlabel('Time (ms)')
axs[2].set_ylabel('Velocity (Z)')
axs[2].legend()

plt.tight_layout()
plt.show()

