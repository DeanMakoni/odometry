;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::NavSts)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'NavSts (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::NAVSTS")
  (make-package "COLA2_MSGS::NAVSTS"))

(in-package "ROS")
;;//! \htmlinclude NavSts.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass cola2_msgs::NavSts
  :super ros::object
  :slots (_header _global_position _origin _position _altitude _body_velocity _orientation _orientation_rate _position_variance _orientation_variance ))

(defmethod cola2_msgs::NavSts
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:global_position __global_position) (instance cola2_msgs::DecimalLatLon :init))
    ((:origin __origin) (instance cola2_msgs::DecimalLatLon :init))
    ((:position __position) (instance cola2_msgs::NED :init))
    ((:altitude __altitude) 0.0)
    ((:body_velocity __body_velocity) (instance geometry_msgs::Point :init))
    ((:orientation __orientation) (instance cola2_msgs::RPY :init))
    ((:orientation_rate __orientation_rate) (instance cola2_msgs::RPY :init))
    ((:position_variance __position_variance) (instance cola2_msgs::NED :init))
    ((:orientation_variance __orientation_variance) (instance cola2_msgs::RPY :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _global_position __global_position)
   (setq _origin __origin)
   (setq _position __position)
   (setq _altitude (float __altitude))
   (setq _body_velocity __body_velocity)
   (setq _orientation __orientation)
   (setq _orientation_rate __orientation_rate)
   (setq _position_variance __position_variance)
   (setq _orientation_variance __orientation_variance)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:global_position
   (&rest __global_position)
   (if (keywordp (car __global_position))
       (send* _global_position __global_position)
     (progn
       (if __global_position (setq _global_position (car __global_position)))
       _global_position)))
  (:origin
   (&rest __origin)
   (if (keywordp (car __origin))
       (send* _origin __origin)
     (progn
       (if __origin (setq _origin (car __origin)))
       _origin)))
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
  (:body_velocity
   (&rest __body_velocity)
   (if (keywordp (car __body_velocity))
       (send* _body_velocity __body_velocity)
     (progn
       (if __body_velocity (setq _body_velocity (car __body_velocity)))
       _body_velocity)))
  (:orientation
   (&rest __orientation)
   (if (keywordp (car __orientation))
       (send* _orientation __orientation)
     (progn
       (if __orientation (setq _orientation (car __orientation)))
       _orientation)))
  (:orientation_rate
   (&rest __orientation_rate)
   (if (keywordp (car __orientation_rate))
       (send* _orientation_rate __orientation_rate)
     (progn
       (if __orientation_rate (setq _orientation_rate (car __orientation_rate)))
       _orientation_rate)))
  (:position_variance
   (&rest __position_variance)
   (if (keywordp (car __position_variance))
       (send* _position_variance __position_variance)
     (progn
       (if __position_variance (setq _position_variance (car __position_variance)))
       _position_variance)))
  (:orientation_variance
   (&rest __orientation_variance)
   (if (keywordp (car __orientation_variance))
       (send* _orientation_variance __orientation_variance)
     (progn
       (if __orientation_variance (setq _orientation_variance (car __orientation_variance)))
       _orientation_variance)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; cola2_msgs/DecimalLatLon _global_position
    (send _global_position :serialization-length)
    ;; cola2_msgs/DecimalLatLon _origin
    (send _origin :serialization-length)
    ;; cola2_msgs/NED _position
    (send _position :serialization-length)
    ;; float32 _altitude
    4
    ;; geometry_msgs/Point _body_velocity
    (send _body_velocity :serialization-length)
    ;; cola2_msgs/RPY _orientation
    (send _orientation :serialization-length)
    ;; cola2_msgs/RPY _orientation_rate
    (send _orientation_rate :serialization-length)
    ;; cola2_msgs/NED _position_variance
    (send _position_variance :serialization-length)
    ;; cola2_msgs/RPY _orientation_variance
    (send _orientation_variance :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; cola2_msgs/DecimalLatLon _global_position
       (send _global_position :serialize s)
     ;; cola2_msgs/DecimalLatLon _origin
       (send _origin :serialize s)
     ;; cola2_msgs/NED _position
       (send _position :serialize s)
     ;; float32 _altitude
       (sys::poke _altitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/Point _body_velocity
       (send _body_velocity :serialize s)
     ;; cola2_msgs/RPY _orientation
       (send _orientation :serialize s)
     ;; cola2_msgs/RPY _orientation_rate
       (send _orientation_rate :serialize s)
     ;; cola2_msgs/NED _position_variance
       (send _position_variance :serialize s)
     ;; cola2_msgs/RPY _orientation_variance
       (send _orientation_variance :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; cola2_msgs/DecimalLatLon _global_position
     (send _global_position :deserialize buf ptr-) (incf ptr- (send _global_position :serialization-length))
   ;; cola2_msgs/DecimalLatLon _origin
     (send _origin :deserialize buf ptr-) (incf ptr- (send _origin :serialization-length))
   ;; cola2_msgs/NED _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; float32 _altitude
     (setq _altitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/Point _body_velocity
     (send _body_velocity :deserialize buf ptr-) (incf ptr- (send _body_velocity :serialization-length))
   ;; cola2_msgs/RPY _orientation
     (send _orientation :deserialize buf ptr-) (incf ptr- (send _orientation :serialization-length))
   ;; cola2_msgs/RPY _orientation_rate
     (send _orientation_rate :deserialize buf ptr-) (incf ptr- (send _orientation_rate :serialization-length))
   ;; cola2_msgs/NED _position_variance
     (send _position_variance :deserialize buf ptr-) (incf ptr- (send _position_variance :serialization-length))
   ;; cola2_msgs/RPY _orientation_variance
     (send _orientation_variance :deserialize buf ptr-) (incf ptr- (send _orientation_variance :serialization-length))
   ;;
   self)
  )

(setf (get cola2_msgs::NavSts :md5sum-) "0ba23d6197aed7a9fab08613fe8fc381")
(setf (get cola2_msgs::NavSts :datatype-) "cola2_msgs/NavSts")
(setf (get cola2_msgs::NavSts :definition-)
      "# Sent by the navigator

Header 	header

DecimalLatLon global_position
DecimalLatLon origin

# NED position and altitude in metres. 
NED position
float32 altitude

# Body velocities in metres/sec.
geometry_msgs/Point body_velocity

# Orientation and orientation rate are in radians and radians/sec
RPY orientation
RPY orientation_rate

# Variances for position and orientation
NED position_variance
RPY orientation_variance


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
MSG: cola2_msgs/DecimalLatLon
# Latitude and longitude, in decimal form.

float64 latitude
float64 longitude


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
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: cola2_msgs/RPY
# Orientation or orientation velocity in a frame consistent with the right-handed NED coordinate frame.

# Fixed-axis roll, in radians. Positive clockwise rotation about the X axis, looking forward.
float32 roll

# Fixed-axis pitch, in radians. Positive upwards rotation of the vehicle nose about the Y axis.
float32 pitch

# Fixed-axis yaw, in radians. Positive clockwise rotation about the Z axis, looking down.
float32 yaw


")



(provide :cola2_msgs/NavSts "0ba23d6197aed7a9fab08613fe8fc381")


