;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::SSSConfig)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'SSSConfig (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::SSSCONFIG")
  (make-package "COLA2_MSGS::SSSCONFIG"))

(in-package "ROS")
;;//! \htmlinclude SSSConfig.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass cola2_msgs::SSSConfig
  :super ros::object
  :slots (_header _samples_per_channel _range_delay _range _horizontal_beam_angle _vertical_beam_angle _speed_of_sound _ping_rate _frequency ))

(defmethod cola2_msgs::SSSConfig
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:samples_per_channel __samples_per_channel) 0)
    ((:range_delay __range_delay) 0.0)
    ((:range __range) 0.0)
    ((:horizontal_beam_angle __horizontal_beam_angle) 0.0)
    ((:vertical_beam_angle __vertical_beam_angle) 0.0)
    ((:speed_of_sound __speed_of_sound) 0.0)
    ((:ping_rate __ping_rate) 0.0)
    ((:frequency __frequency) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _samples_per_channel (round __samples_per_channel))
   (setq _range_delay (float __range_delay))
   (setq _range (float __range))
   (setq _horizontal_beam_angle (float __horizontal_beam_angle))
   (setq _vertical_beam_angle (float __vertical_beam_angle))
   (setq _speed_of_sound (float __speed_of_sound))
   (setq _ping_rate (float __ping_rate))
   (setq _frequency (float __frequency))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:samples_per_channel
   (&optional __samples_per_channel)
   (if __samples_per_channel (setq _samples_per_channel __samples_per_channel)) _samples_per_channel)
  (:range_delay
   (&optional __range_delay)
   (if __range_delay (setq _range_delay __range_delay)) _range_delay)
  (:range
   (&optional __range)
   (if __range (setq _range __range)) _range)
  (:horizontal_beam_angle
   (&optional __horizontal_beam_angle)
   (if __horizontal_beam_angle (setq _horizontal_beam_angle __horizontal_beam_angle)) _horizontal_beam_angle)
  (:vertical_beam_angle
   (&optional __vertical_beam_angle)
   (if __vertical_beam_angle (setq _vertical_beam_angle __vertical_beam_angle)) _vertical_beam_angle)
  (:speed_of_sound
   (&optional __speed_of_sound)
   (if __speed_of_sound (setq _speed_of_sound __speed_of_sound)) _speed_of_sound)
  (:ping_rate
   (&optional __ping_rate)
   (if __ping_rate (setq _ping_rate __ping_rate)) _ping_rate)
  (:frequency
   (&optional __frequency)
   (if __frequency (setq _frequency __frequency)) _frequency)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _samples_per_channel
    4
    ;; float64 _range_delay
    8
    ;; float64 _range
    8
    ;; float64 _horizontal_beam_angle
    8
    ;; float64 _vertical_beam_angle
    8
    ;; float64 _speed_of_sound
    8
    ;; float64 _ping_rate
    8
    ;; float64 _frequency
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _samples_per_channel
       (write-long _samples_per_channel s)
     ;; float64 _range_delay
       (sys::poke _range_delay (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _range
       (sys::poke _range (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _horizontal_beam_angle
       (sys::poke _horizontal_beam_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vertical_beam_angle
       (sys::poke _vertical_beam_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed_of_sound
       (sys::poke _speed_of_sound (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ping_rate
       (sys::poke _ping_rate (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _frequency
       (sys::poke _frequency (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _samples_per_channel
     (setq _samples_per_channel (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _range_delay
     (setq _range_delay (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _range
     (setq _range (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _horizontal_beam_angle
     (setq _horizontal_beam_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vertical_beam_angle
     (setq _vertical_beam_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed_of_sound
     (setq _speed_of_sound (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ping_rate
     (setq _ping_rate (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _frequency
     (setq _frequency (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get cola2_msgs::SSSConfig :md5sum-) "64f9d5e370a88668538a0266b9541ab7")
(setf (get cola2_msgs::SSSConfig :datatype-) "cola2_msgs/SSSConfig")
(setf (get cola2_msgs::SSSConfig :definition-)
      "Header header

uint32 samples_per_channel

float64 range_delay #In meters
float64 range #In meters

float64 horizontal_beam_angle #Radians Set to 0 if unknown.
float64 vertical_beam_angle #Radians Set to 0 if unknown.

float64 speed_of_sound  #In m/s
float64 ping_rate #In Hz
float64 frequency #In Hz

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

")



(provide :cola2_msgs/SSSConfig "64f9d5e370a88668538a0266b9541ab7")


