import numpy as np
import matplotlib.pyplot as plt

# Load residuals
residuals_data = np.loadtxt('residuals.txt')
pose_numbers = residuals_data[:, 0]
residuals = residuals_data[:, 1]

# Load pose covariance
pose_covariance_data = np.loadtxt('pose_covariance_per_pose.txt')

# Load velocity covariance
velocity_covariance_data = np.loadtxt('velocity_covariance_per_pose.txt')

# Extract diagonal elements (variances) from each pose
pose_covariances = np.mean(pose_covariance_data, axis=1)  # Mean of diagonal elements
velocity_covariances = np.mean(velocity_covariance_data, axis=1)  # Mean of diagonal elements

# Number of poses
num_poses = len(pose_covariances)

# Plot residuals, pose covariance, and velocity covariance
plt.figure(figsize=(18, 6))

# Plot residuals
plt.subplot(131)
plt.plot(pose_numbers, residuals, marker='o', linestyle='-', color='b')
plt.title('Residuals vs. Pose Number')
plt.xlabel('Pose Number')
plt.ylabel('Residual')
plt.grid(True)

# Plot pose covariance
plt.subplot(132)
plt.plot(np.arange(num_poses), pose_covariances, marker='o', linestyle='-', color='g')
plt.title('Pose Covariance vs. Pose Number')
plt.xlabel('Pose Number')
plt.ylabel('Covariance Value')
plt.grid(True)

# Plot velocity covariance
plt.subplot(133)
plt.plot(np.arange(num_poses), velocity_covariances, marker='o', linestyle='-', color='r')
plt.title('Velocity Covariance vs. Pose Number')
plt.xlabel('Pose Number')
plt.ylabel('Covariance Value')
plt.grid(True)

plt.tight_layout()
plt.show()
