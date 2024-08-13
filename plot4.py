import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D  # Import for 3D plotting  


# Load the navstates
navstates = np.loadtxt('navstates.txt')

# Extract x, y, z coordinates
x = navstates[:, 0]
y = navstates[:, 1]
z = navstates[:, 2]

# Plotting the 3D trajectory
fig = plt.figure(figsize=(12, 8))

ax1 = fig.add_subplot(221, projection='3d')
ax1.plot(x, y, z, marker='o')
ax1.set_title('3D Trajectory')
ax1.set_xlabel('X')
ax1.set_ylabel('Y')
ax1.set_zlabel('Z')

# Rest of the code for plotting on other subplots...

plt.tight_layout()
plt.show()

