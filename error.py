import numpy as np
import matplotlib.pyplot as plt

# Load ground truth data
ground_truth = np.loadtxt('withpressure.txt')

# Load optimized position data
optimized_positions = np.loadtxt('withoutpressure.txt')

# Calculate absolute error
abs_error_x = np.abs(ground_truth[:, 0] - optimized_positions[:, 0])
abs_error_y = np.abs(ground_truth[:, 1] - optimized_positions[:, 1])
abs_error_z = np.abs(ground_truth[:, 2] - optimized_positions[:, 2])

# Plot absolute error in x direction
plt.figure(figsize=(10, 6))
plt.plot(abs_error_x, label='Absolute Error in X')
plt.xlabel('Pose Index')
plt.ylabel('Absolute Error')
plt.title('Absolute Error in X Direction')
plt.legend()
plt.grid(True)
plt.show()

# Plot absolute error in y direction
plt.figure(figsize=(10, 6))
plt.plot(abs_error_y, label='Absolute Error in Y', color='orange')
plt.xlabel('Pose Index')
plt.ylabel('Absolute Error')
plt.title('Absolute Error in Y Direction')
plt.legend()
plt.grid(True)
plt.show()

# Plot absolute error in z direction
plt.figure(figsize=(10, 6))
plt.plot(abs_error_z, label='Absolute Error in Z', color='green')
plt.xlabel('Pose Index')
plt.ylabel('Absolute Error')
plt.title('Absolute Error in Z Direction')
plt.legend()
plt.grid(True)
plt.show()
