;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::ImageAcquisitionSettings)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'ImageAcquisitionSettings (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::IMAGEACQUISITIONSETTINGS")
  (make-package "COLA2_MSGS::IMAGEACQUISITIONSETTINGS"))

(in-package "ROS")
;;//! \htmlinclude ImageAcquisitionSettings.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass cola2_msgs::ImageAcquisitionSettings
  :super ros::object
  :slots (_header _exposure_time _gain _blue_ratio _red_ratio _focus _aperture _focal_length _extra ))

(defmethod cola2_msgs::ImageAcquisitionSettings
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:exposure_time __exposure_time) 0)
    ((:gain __gain) 0.0)
    ((:blue_ratio __blue_ratio) 0.0)
    ((:red_ratio __red_ratio) 0.0)
    ((:focus __focus) 0.0)
    ((:aperture __aperture) 0.0)
    ((:focal_length __focal_length) 0.0)
    ((:extra __extra) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _exposure_time (round __exposure_time))
   (setq _gain (float __gain))
   (setq _blue_ratio (float __blue_ratio))
   (setq _red_ratio (float __red_ratio))
   (setq _focus (float __focus))
   (setq _aperture (float __aperture))
   (setq _focal_length (float __focal_length))
   (setq _extra __extra)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:exposure_time
   (&optional __exposure_time)
   (if __exposure_time (setq _exposure_time __exposure_time)) _exposure_time)
  (:gain
   (&optional __gain)
   (if __gain (setq _gain __gain)) _gain)
  (:blue_ratio
   (&optional __blue_ratio)
   (if __blue_ratio (setq _blue_ratio __blue_ratio)) _blue_ratio)
  (:red_ratio
   (&optional __red_ratio)
   (if __red_ratio (setq _red_ratio __red_ratio)) _red_ratio)
  (:focus
   (&optional __focus)
   (if __focus (setq _focus __focus)) _focus)
  (:aperture
   (&optional __aperture)
   (if __aperture (setq _aperture __aperture)) _aperture)
  (:focal_length
   (&optional __focal_length)
   (if __focal_length (setq _focal_length __focal_length)) _focal_length)
  (:extra
   (&rest __extra)
   (if (keywordp (car __extra))
       (send* _extra __extra)
     (progn
       (if __extra (setq _extra (car __extra)))
       _extra)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _exposure_time
    4
    ;; float64 _gain
    8
    ;; float64 _blue_ratio
    8
    ;; float64 _red_ratio
    8
    ;; float64 _focus
    8
    ;; float64 _aperture
    8
    ;; float64 _focal_length
    8
    ;; cola2_msgs/KeyValue[] _extra
    (apply #'+ (send-all _extra :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _exposure_time
       (write-long _exposure_time s)
     ;; float64 _gain
       (sys::poke _gain (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _blue_ratio
       (sys::poke _blue_ratio (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _red_ratio
       (sys::poke _red_ratio (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _focus
       (sys::poke _focus (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _aperture
       (sys::poke _aperture (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _focal_length
       (sys::poke _focal_length (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; cola2_msgs/KeyValue[] _extra
     (write-long (length _extra) s)
     (dolist (elem _extra)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _exposure_time
     (setq _exposure_time (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _gain
     (setq _gain (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _blue_ratio
     (setq _blue_ratio (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _red_ratio
     (setq _red_ratio (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _focus
     (setq _focus (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _aperture
     (setq _aperture (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _focal_length
     (setq _focal_length (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; cola2_msgs/KeyValue[] _extra
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _extra (let (r) (dotimes (i n) (push (instance cola2_msgs::KeyValue :init) r)) r))
     (dolist (elem- _extra)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get cola2_msgs::ImageAcquisitionSettings :md5sum-) "96d48fe2b8fa7d286d513edba3e44323")
(setf (get cola2_msgs::ImageAcquisitionSettings :datatype-) "cola2_msgs/ImageAcquisitionSettings")
(setf (get cola2_msgs::ImageAcquisitionSettings :definition-)
      "Header header
# Exposure time in us (microseonds)
uint32 exposure_time
# Gain in dB
float64 gain
# White balance blue ratio
float64 blue_ratio
# White balance red ratio
float64 red_ratio
# Focus distance (m)
float64 focus
# Aperture (f/#)
float64 aperture
#Focal length according to lens manufacturer (mm)
float64 focal_length
# Extra information
cola2_msgs/KeyValue[] extra

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
MSG: cola2_msgs/KeyValue
string key
string value

")



(provide :cola2_msgs/ImageAcquisitionSettings "96d48fe2b8fa7d286d513edba3e44323")


