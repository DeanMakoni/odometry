;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::WorldWaypointReq)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'WorldWaypointReq (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::WORLDWAYPOINTREQ")
  (make-package "COLA2_MSGS::WORLDWAYPOINTREQ"))

(in-package "ROS")
;;//! \htmlinclude WorldWaypointReq.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass cola2_msgs::WorldWaypointReq
  :super ros::object
  :slots (_header _goal _altitude_mode _position _altitude _orientation _disable_axis _position_tolerance _orientation_tolerance ))

(defmethod cola2_msgs::WorldWaypointReq
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:goal __goal) (instance cola2_msgs::GoalDescriptor :init))
    ((:altitude_mode __altitude_mode) nil)
    ((:position __position) (instance cola2_msgs::NED :init))
    ((:altitude __altitude) 0.0)
    ((:orientation __orientation) (instance cola2_msgs::RPY :init))
    ((:disable_axis __disable_axis) (instance cola2_msgs::Bool6Axis :init))
    ((:position_tolerance __position_tolerance) (instance geometry_msgs::Vector3 :init))
    ((:orientation_tolerance __orientation_tolerance) (instance cola2_msgs::RPY :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _goal __goal)
   (setq _altitude_mode __altitude_mode)
   (setq _position __position)
   (setq _altitude (float __altitude))
   (setq _orientation __orientation)
   (setq _disable_axis __disable_axis)
   (setq _position_tolerance __position_tolerance)
   (setq _orientation_tolerance __orientation_tolerance)
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
  (:altitude_mode
   (&optional (__altitude_mode :null))
   (if (not (eq __altitude_mode :null)) (setq _altitude_mode __altitude_mode)) _altitude_mode)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:altitude
   (&optional __altitude)
   (if __altitude (setq _altitude __altitude)) _altitude)
  (:orientation
   (&rest __orientation)
   (if (keywordp (car __orientation))
       (send* _orientation __orientation)
     (progn
       (if __orientation (setq _orientation (car __orientation)))
       _orientation)))
  (:disable_axis
   (&rest __disable_axis)
   (if (keywordp (car __disable_axis))
       (send* _disable_axis __disable_axis)
     (progn
       (if __disable_axis (setq _disable_axis (car __disable_axis)))
       _disable_axis)))
  (:position_tolerance
   (&rest __position_tolerance)
   (if (keywordp (car __position_tolerance))
       (send* _position_tolerance __position_tolerance)
     (progn
       (if __position_tolerance (setq _position_tolerance (car __position_tolerance)))
       _position_tolerance)))
  (:orientation_tolerance
   (&rest __orientation_tolerance)
   (if (keywordp (car __orientation_tolerance))
       (send* _orientation_tolerance __orientation_tolerance)
     (progn
       (if __orientation_tolerance (setq _orientation_tolerance (car __orientation_tolerance)))
       _orientation_tolerance)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; cola2_msgs/GoalDescriptor _goal
    (send _goal :serialization-length)
    ;; bool _altitude_mode
    1
    ;; cola2_msgs/NED _position
    (send _position :serialization-length)
    ;; float32 _altitude
    4
    ;; cola2_msgs/RPY _orientation
    (send _orientation :serialization-length)
    ;; cola2_msgs/Bool6Axis _disable_axis
    (send _disable_axis :serialization-length)
    ;; geometry_msgs/Vector3 _position_tolerance
    (send _position_tolerance :serialization-length)
    ;; cola2_msgs/RPY _orientation_tolerance
    (send _orientation_tolerance :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; cola2_msgs/GoalDescriptor _goal
       (send _goal :serialize s)
     ;; bool _altitude_mode
       (if _altitude_mode (write-byte -1 s) (write-byte 0 s))
     ;; cola2_msgs/NED _position
       (send _position :serialize s)
     ;; float32 _altitude
       (sys::poke _altitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; cola2_msgs/RPY _orientation
       (send _orientation :serialize s)
     ;; cola2_msgs/Bool6Axis _disable_axis
       (send _disable_axis :serialize s)
     ;; geometry_msgs/Vector3 _position_tolerance
       (send _position_tolerance :serialize s)
     ;; cola2_msgs/RPY _orientation_tolerance
       (send _orientation_tolerance :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; cola2_msgs/GoalDescriptor _goal
     (send _goal :deserialize buf ptr-) (incf ptr- (send _goal :serialization-length))
   ;; bool _altitude_mode
     (setq _altitude_mode (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; cola2_msgs/NED _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; float32 _altitude
     (setq _altitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; cola2_msgs/RPY _orientation
     (send _orientation :deserialize buf ptr-) (incf ptr- (send _orientation :serialization-length))
   ;; cola2_msgs/Bool6Axis _disable_axis
     (send _disable_axis :deserialize buf ptr-) (incf ptr- (send _disable_axis :serialization-length))
   ;; geometry_msgs/Vector3 _position_tolerance
     (send _position_tolerance :deserialize buf ptr-) (incf ptr- (send _position_tolerance :serialization-length))
   ;; cola2_msgs/RPY _orientation_tolerance
     (send _orientation_tolerance :deserialize buf ptr-) (incf ptr- (send _orientation_tolerance :serialization-length))
   ;;
   self)
  )

(setf (get cola2_msgs::WorldWaypointReq :md5sum-) "768d0aca8857ca6850f95e4b0acf093d")
(setf (get cola2_msgs::WorldWaypointReq :datatype-) "cola2_msgs/WorldWaypointReq")
(setf (get cola2_msgs::WorldWaypointReq :definition-)
      "# World frame (absolute) waypoint request to pilot.
# A new waypoint request should contain a different goal.id
# (incremented) from previous requests. This same message should then
# be re-sent at 5-10 Hz.

Header header

# Common waypoint details
GoalDescriptor goal

# If true, maintain Z position relative to altitude, otherwise depth.
bool altitude_mode

cola2_msgs/NED position
float32 altitude
RPY orientation

# Axes of control to disable, in body frame.
Bool6Axis disable_axis

# Tolerances are in body frame, zero indicates pilot default should be used.
geometry_msgs/Vector3 position_tolerance
RPY orientation_tolerance


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
MSG: cola2_msgs/NED
# Position or velocity in the right-handed NED coordinate frame.

# metres north, positive towards true north.
float64 north

# metres east, positive towards true east.
float64 east

# metres down, positive towards the centre of the earth.
float64 depth

================================================================================
MSG: cola2_msgs/RPY
# Orientation or orientation velocity in a frame consistent with the right-handed NED coordinate frame.

# Fixed-axis roll, in radians. Positive clockwise rotation about the X axis, looking forward.
float32 roll

# Fixed-axis pitch, in radians. Positive upwards rotation of the vehicle nose about the Y axis.
float32 pitch

# Fixed-axis yaw, in radians. Positive clockwise rotation about the Z axis, looking down.
float32 yaw


================================================================================
MSG: cola2_msgs/Bool6Axis
bool x
bool y
bool z
bool roll
bool pitch
bool yaw


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
")



(provide :cola2_msgs/WorldWaypointReq "768d0aca8857ca6850f95e4b0acf093d")


