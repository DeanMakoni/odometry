# Install script for directory: /home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cola2_msgs/msg" TYPE FILE FILES
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/BodyForceReq.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/BodyVelocityReq.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/Bool6Axis.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/CaptainStateFeedback.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/CaptainStatus.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/DVL.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/DVLBeam.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/DecimalLatLon.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/Float32Stamped.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/FlsConfig.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/GoalDescriptor.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/ImageAcquisitionSettings.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/KeyValue.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/KeyValueArray.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/MissionState.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/NED.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/NavSts.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/RPY.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/RecoveryAction.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/SSSConfig.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/SafetySupervisorStatus.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/Setpoints.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/msg/WorldWaypointReq.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cola2_msgs/srv" TYPE FILE FILES
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/srv/Action.srv"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/srv/DigitalOutput.srv"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/srv/Goto.srv"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/srv/MaxJoyVelocity.srv"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/srv/Mission.srv"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/srv/Recovery.srv"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/srv/Section.srv"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/srv/String.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cola2_msgs/action" TYPE FILE FILES "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/action/Pilot.action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cola2_msgs/msg" TYPE FILE FILES
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/devel/share/cola2_msgs/msg/PilotAction.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/devel/share/cola2_msgs/msg/PilotActionGoal.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/devel/share/cola2_msgs/msg/PilotActionResult.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/devel/share/cola2_msgs/msg/PilotActionFeedback.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/devel/share/cola2_msgs/msg/PilotGoal.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/devel/share/cola2_msgs/msg/PilotResult.msg"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/devel/share/cola2_msgs/msg/PilotFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cola2_msgs/cmake" TYPE FILE FILES "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/build/cola2_msgs/catkin_generated/installspace/cola2_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/devel/include/cola2_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/devel/share/roseus/ros/cola2_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/devel/share/common-lisp/ros/cola2_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/devel/share/gennodejs/ros/cola2_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/devel/lib/python3/dist-packages/cola2_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/devel/lib/python3/dist-packages/cola2_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/build/cola2_msgs/catkin_generated/installspace/cola2_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cola2_msgs/cmake" TYPE FILE FILES "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/build/cola2_msgs/catkin_generated/installspace/cola2_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cola2_msgs/cmake" TYPE FILE FILES
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/build/cola2_msgs/catkin_generated/installspace/cola2_msgsConfig.cmake"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/build/cola2_msgs/catkin_generated/installspace/cola2_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cola2_msgs" TYPE FILE FILES "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cola2_msgs" TYPE FILE FILES
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/LICENSE.txt"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/README.md"
    "/home/jetson/Downloads/sonar_imu_dvl_pressure_odometry/src/cola2_msgs/CHANGELOG.md"
    )
endif()

