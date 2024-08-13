;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::BodyForceReq)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'BodyForceReq (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::BODYFORCEREQ")
  (make-package "COLA2_MSGS::BODYFORCEREQ"))

(in-package "ROS")
;;//! \htmlinclude BodyForceReq.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass cola2_msgs::BodyForceReq
  :super ros::object
  :slots (_header _goal _wrench _disable_axis ))

(defmethod cola2_msgs::BodyForceReq
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:goal __goal) (instance cola2_msgs::GoalDescriptor :init))
    ((:wrench __wrench) (instance geometry_msgs::Wrench :init))
    ((:disable_axis __disable_axis) (instance cola2_msgs::Bool6Axis :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _goal __goal)
   (setq _wrench __wrench)
   (setq _disable_axis __disable_axis)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:goal
   (&rest __goal)
   (if (keywordp (car __goal))
       (send* _goal __goal)
     (progn
       (if __goal (setq _goal (car __goal)))
       _goal)))
  (:wrench
   (&rest __wrench)
   (if (keywordp (car __wrench))
       (send* _wrench __wrench)
     (progn
       (if __wrench (setq _wrench (car __wrench)))
       _wrench)))
  (:disable_axis
   (&rest __disable_axis)
   (if (keywordp (car __disable_axis))
       (send* _disable_axis __disable_axis)
     (progn
       (if __disable_axis (setq _disable_axis (car __disable_axis)))
       _disable_axis)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; cola2_msgs/GoalDescriptor _goal
    (send _goal :serialization-length)
    ;; geometry_msgs/Wrench _wrench
    (send _wrench :serialization-length)
    ;; cola2_msgs/Bool6Axis _disable_axis
    (send _disable_axis :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; cola2_msgs/GoalDescriptor _goal
       (send _goal :serialize s)
     ;; geometry_msgs/Wrench _wrench
       (send _wrench :serialize s)
     ;; cola2_msgs/Bool6Axis _disable_axis
       (send _disable_axis :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; cola2_msgs/GoalDescriptor _goal
     (send _goal :deserialize buf ptr-) (incf ptr- (send _goal :serialization-length))
   ;; geometry_msgs/Wrench _wrench
     (send _wrench :deserialize buf ptr-) (incf ptr- (send _wrench :serialization-length))
   ;; cola2_msgs/Bool6Axis _disable_axis
     (send _disable_axis :deserialize buf ptr-) (incf ptr- (send _disable_axis :serialization-length))
   ;;
   self)
  )

(setf (get cola2_msgs::BodyForceReq :md5sum-) "52927ed08d592b6a522c3a968c2c48b0")
(setf (get cola2_msgs::BodyForceReq :datatype-) "cola2_msgs/BodyForceReq")
(setf (get cola2_msgs::BodyForceReq :definition-)
      "# Body frame vehicle velocity request.
# No coordinate units, values range +/- 1.
# NB: Coordinate frame used is ROS standard [forward, left, up],
# to simplify integration with arm control systems.

# header.frame_id should be set to the base_link frame of the vehicle.
Header header

GoalDescriptor goal

geometry_msgs/Wrench wrench

# Axes of control to disable, in body frame.
Bool6Axis disable_axis
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
MSG: cola2_msgs/GoalDescriptor
# Contains values common to all waypoint request and status messages.
# Waypoint goals with higher priority trump lower priority goals. For
# goals of the same priority, the pilot should follow the latest
# received.

# Name of the requesting node, used with id to identify the request.
string requester

uint32 priority

# PRIORITY DEFINITIONS
uint32 PRIORITY_TELEOPERATION_LOW = 0
uint32 PRIORITY_SAFETY_LOW = 5
uint32 PRIORITY_NORMAL = 10
uint32 PRIORITY_SAFETY = 30
uint32 PRIORITY_TELEOPERATION = 40
uint32 PRIORITY_SAFETY_HIGH  = 50
uint32 PRIORITY_TELEOPERATION_HIGH = 60

================================================================================
MSG: geometry_msgs/Wrench
# This represents force in free space, separated into
# its linear and angular parts.
Vector3  force
Vector3  torque

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: cola2_msgs/Bool6Axis
bool x
bool y
bool z
bool roll
bool pitch
bool yaw


")



(provide :cola2_msgs/BodyForceReq "52927ed08d592b6a522c3a968c2c48b0")


