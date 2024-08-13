;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::FlsConfig)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'FlsConfig (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::FLSCONFIG")
  (make-package "COLA2_MSGS::FLSCONFIG"))

(in-package "ROS")
;;//! \htmlinclude FlsConfig.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass cola2_msgs::FlsConfig
  :super ros::object
  :slots (_header _num_beams _num_samples _window_start _window_end _beams_bearings _speed_of_sound _ping_rate _frequency ))

(defmethod cola2_msgs::FlsConfig
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:num_beams __num_beams) 0)
    ((:num_samples __num_samples) 0)
    ((:window_start __window_start) 0.0)
    ((:window_end __window_end) 0.0)
    ((:beams_bearings __beams_bearings) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:speed_of_sound __speed_of_sound) 0.0)
    ((:ping_rate __ping_rate) 0.0)
    ((:frequency __frequency) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _num_beams (round __num_beams))
   (setq _num_samples (round __num_samples))
   (setq _window_start (float __window_start))
   (setq _window_end (float __window_end))
   (setq _beams_bearings __beams_bearings)
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
  (:num_beams
   (&optional __num_beams)
   (if __num_beams (setq _num_beams __num_beams)) _num_beams)
  (:num_samples
   (&optional __num_samples)
   (if __num_samples (setq _num_samples __num_samples)) _num_samples)
  (:window_start
   (&optional __window_start)
   (if __window_start (setq _window_start __window_start)) _window_start)
  (:window_end
   (&optional __window_end)
   (if __window_end (setq _window_end __window_end)) _window_end)
  (:beams_bearings
   (&optional __beams_bearings)
   (if __beams_bearings (setq _beams_bearings __beams_bearings)) _beams_bearings)
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
    ;; uint32 _num_beams
    4
    ;; uint32 _num_samples
    4
    ;; float64 _window_start
    8
    ;; float64 _window_end
    8
    ;; float32[] _beams_bearings
    (* 4    (length _beams_bearings)) 4
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
     ;; uint32 _num_beams
       (write-long _num_beams s)
     ;; uint32 _num_samples
       (write-long _num_samples s)
     ;; float64 _window_start
       (sys::poke _window_start (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _window_end
       (sys::poke _window_end (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32[] _beams_bearings
     (write-long (length _beams_bearings) s)
     (dotimes (i (length _beams_bearings))
       (sys::poke (elt _beams_bearings i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
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
   ;; uint32 _num_beams
     (setq _num_beams (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _num_samples
     (setq _num_samples (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _window_start
     (setq _window_start (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _window_end
     (setq _window_end (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32[] _beams_bearings
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _beams_bearings (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _beams_bearings i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float64 _speed_of_sound
     (setq _speed_of_sound (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ping_rate
     (setq _ping_rate (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _frequency
     (setq _frequency (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get cola2_msgs::FlsConfig :md5sum-) "e2d805f6f59bab24b847a6204ee111a7")
(setf (get cola2_msgs::FlsConfig :datatype-) "cola2_msgs/FlsConfig")
(setf (get cola2_msgs::FlsConfig :definition-)
      "# This message must be tied to a sensor_msgs/Image message that contains the corresponding polar image. The header 
# timestamp of both messages must be exactly the same.
# The polar image's first row must correspond to the farthest return sample, with the last row being the closest return
# sample.
# The polar image's first column must correspond to the leftmost beam from the POV of the FLS sensor (negative angle 
# value), with the last column being the rightmost beam (positive angle value).

Header 	header

uint32 num_beams
uint32 num_samples

float64 window_start #In meters.
float64 window_end #In meters

float32[] beams_bearings #In radians

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



(provide :cola2_msgs/FlsConfig "e2d805f6f59bab24b847a6204ee111a7")


