import matplotlib.pyplot as plt
import numpy as np

# Load biases from the files
accel_biases = np.loadtxt('accelerometer_biases.txt')
gyro_biases = np.loadtxt('gyroscope_biases.txt')

# Plot accelerometer biases
plt.figure(figsize=(10, 5))
plt.plot(accel_biases[:, 0], label='X-axis')
plt.plot(accel_biases[:, 1], label='Y-axis')
plt.plot(accel_biases[:, 2], label='Z-axis')
plt.title('Accelerometer Biases Over Time')
plt.xlabel('Time step')
plt.ylabel('Bias')
plt.legend()
plt.grid(True)
plt.show()

# Plot gyroscope biases
plt.figure(figsize=(10, 5))
plt.plot(gyro_biases[:, 0], label='X-axis')
plt.plot(gyro_biases[:, 1], label='Y-axis')
plt.plot(gyro_biases[:, 2], label='Z-axis')
plt.title('Gyroscope Biases Over Time')
plt.xlabel('Time step')
plt.ylabel('Bias')
plt.legend()
plt.grid(True)
plt.show()
