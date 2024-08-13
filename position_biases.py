import numpy as np
import matplotlib.pyplot as plt

# Load data from files
navstate = np.loadtxt('position_bias.txt')
biases = np.loadtxt('biases.txt')

# Extract position and bias data
x = navstate[:, 0]
y = navstate[:, 1]
z = navstate[:, 2]
gyro_bias = biases[:, :3]
accel_bias = biases[:, 3:]

# Plotting the biases against positions
fig, axs = plt.subplots(3, 1, figsize=(10, 15))

# Gyroscope bias vs Position
axs[0].plot(x, gyro_bias[:, 0], label='Gyro Bias X')
axs[0].plot(y, gyro_bias[:, 1], label='Gyro Bias Y')
axs[0].plot(z, gyro_bias[:, 2], label='Gyro Bias Z')
axs[0].set_title('Gyroscope Bias vs Position')
axs[0].set_xlabel('Position')
axs[0].set_ylabel('Gyroscope Bias')
axs[0].legend()

# Accelerometer bias vs Position
axs[1].plot(x, accel_bias[:, 0], label='Accel Bias X')
axs[1].plot(y, accel_bias[:, 1], label='Accel Bias Y')
axs[1].plot(z, accel_bias[:, 2], label='Accel Bias Z')
axs[1].set_title('Accelerometer Bias vs Position')
axs[1].set_xlabel('Position')
axs[1].set_ylabel('Accelerometer Bias')
axs[1].legend()

# Combined Bias vs Position
axs[2].plot(x, np.linalg.norm(gyro_bias, axis=1), label='Gyro Bias Magnitude')
axs[2].plot(x, np.linalg.norm(accel_bias, axis=1), label='Accel Bias Magnitude')
axs[2].set_title('Bias Magnitude vs Position')
axs[2].set_xlabel('Position')
axs[2].set_ylabel('Bias Magnitude')
axs[2].legend()

plt.tight_layout()
plt.show()

