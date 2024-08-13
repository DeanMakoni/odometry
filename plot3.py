import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# Load positions from the file
initial_positions = np.loadtxt('initial_positions.txt')

# Extract x, y, z coordinates for the trajectory
x_init, y_init, z_init = initial_positions[:, 0], initial_positions[:, 1], initial_positions[:, 2]

# Create the figure and subplots
fig = plt.figure(figsize=(12, 6))

# 3D Trajectory Plot
ax1 = fig.add_subplot(121, projection='3d')
ax1.plot(x_init, y_init, z_init, marker='o', color='g', linestyle='-', markersize=3, label='Initial Trajectory')
ax1.set_title('3D Trajectories')
ax1.set_xlabel('X')
ax1.set_ylabel('Y')
ax1.set_zlabel('Z')
ax1.legend()

# XY Plane Plot
ax2 = fig.add_subplot(122)
ax2.plot(x_init, y_init, marker='o', color='g', linestyle='-', markersize=3, label='Initial Trajectory')
ax2.set_title('XY Plane')
ax2.set_xlabel('X')
ax2.set_ylabel('Y')
ax2.legend()

plt.tight_layout()
plt.show()
