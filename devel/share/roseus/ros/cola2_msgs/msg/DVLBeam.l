;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::DVLBeam)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'DVLBeam (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::DVLBEAM")
  (make-package "COLA2_MSGS::DVLBEAM"))

(in-package "ROS")
;;//! \htmlinclude DVLBeam.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass cola2_msgs::DVLBeam
  :super ros::object
  :slots (_range _range_covariance _velocity _velocity_covariance _pose ))

(defmethod cola2_msgs::DVLBeam
  (:init
   (&key
    ((:range __range) 0.0)
    ((:range_covariance __range_covariance) 0.0)
    ((:velocity __velocity) 0.0)
    ((:velocity_covariance __velocity_covariance) 0.0)
    ((:pose __pose) (instance geometry_msgs::PoseStamped :init))
    )
   (send-super :init)
   (setq _range (float __range))
   (setq _range_covariance (float __range_covariance))
   (setq _velocity (float __velocity))
   (setq _velocity_covariance (float __velocity_covariance))
   (setq _pose __pose)
   self)
  (:range
   (&optional __range)
   (if __range (setq _range __range)) _range)
  (:range_covariance
   (&optional __range_covariance)
   (if __range_covariance (setq _range_covariance __range_covariance)) _range_covariance)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:velocity_covariance
   (&optional __velocity_covariance)
   (if __velocity_covariance (setq _velocity_covariance __velocity_covariance)) _velocity_covariance)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; float64 _range
    8
    ;; float64 _range_covariance
    8
    ;; float64 _velocity
    8
    ;; float64 _velocity_covariance
    8
    ;; geometry_msgs/PoseStamped _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _range
       (sys::poke _range (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _range_covariance
       (sys::poke _range_covariance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity_covariance
       (sys::poke _velocity_covariance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; geometry_msgs/PoseStamped _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _range
     (setq _range (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _range_covariance
     (setq _range_covariance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity
     (setq _velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity_covariance
     (setq _velocity_covariance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; geometry_msgs/PoseStamped _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(setf (get cola2_msgs::DVLBeam :md5sum-) "9e6a08aaf7a740b2c17ba2ab21dac602")
(setf (get cola2_msgs::DVLBeam :datatype-) "cola2_msgs/DVLBeam")
(setf (get cola2_msgs::DVLBeam :definition-)
      "# Extracted from UUV Simulator:
#   https://github.com/uuvsimulator/uuv_simulator

# measured range [m] or < 0 if invalid
float64 range
float64 range_covariance

float64 velocity # measured velocity [m/s] of corr. beam
float64 velocity_covariance

# Beam link pose wrt DVL link frame
geometry_msgs/PoseStamped pose

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :cola2_msgs/DVLBeam "9e6a08aaf7a740b2c17ba2ab21dac602")


