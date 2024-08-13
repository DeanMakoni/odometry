;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::BodyVelocityReq)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'BodyVelocityReq (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::BODYVELOCITYREQ")
  (make-package "COLA2_MSGS::BODYVELOCITYREQ"))

(in-package "ROS")
;;//! \htmlinclude BodyVelocityReq.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass cola2_msgs::BodyVelocityReq
  :super ros::object
  :slots (_header _goal _twist _disable_axis ))

(defmethod cola2_msgs::BodyVelocityReq
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:goal __goal) (instance cola2_msgs::GoalDescriptor :init))
    ((:twist __twist) (instance geometry_msgs::Twist :init))
    ((:disable_axis __disable_axis) (instance cola2_msgs::Bool6Axis :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _goal __goal)
   (setq _twist __twist)
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
  (:twist
   (&rest __twist)
   (if (keywordp (car __twist))
       (send* _twist __twist)
     (progn
       (if __twist (setq _twist (car __twist)))
       _twist)))
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
    ;; geometry_msgs/Twist _twist
    (send _twist :serialization-length)
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
     ;; geometry_msgs/Twist _twist
       (send _twist :serialize s)
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
   ;; geometry_msgs/Twist _twist
     (send _twist :deserialize buf ptr-) (incf ptr- (send _twist :serialization-length))
   ;; cola2_msgs/Bool6Axis _disable_axis
     (send _disable_axis :deserialize buf ptr-) (incf ptr- (send _disable_axis :serialization-length))
   ;;
   self)
  )

(setf (get cola2_msgs::BodyVelocityReq :md5sum-) "f11942093cf1f61d6ba11201f06ff750")
(setf (get cola2_msgs::BodyVelocityReq :datatype-) "cola2_msgs/BodyVelocityReq")
(setf (get cola2_msgs::BodyVelocityReq :definition-)
      "# Body frame vehicle velocity request.
# Coordinate units are metres/sec and radians/sec.
# NB: Coordinate frame used is ROS standard [forward, left, up],
# to simplify integration with arm control systems.

# header.frame_id should be set to the base_link frame of the vehicle.
Header header

GoalDescriptor goal

geometry_msgs/Twist twist

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
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

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



(provide :cola2_msgs/BodyVelocityReq "f11942093cf1f61d6ba11201f06ff750")


