;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::NED)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'NED (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::NED")
  (make-package "COLA2_MSGS::NED"))

(in-package "ROS")
;;//! \htmlinclude NED.msg.html


(defclass cola2_msgs::NED
  :super ros::object
  :slots (_north _east _depth ))

(defmethod cola2_msgs::NED
  (:init
   (&key
    ((:north __north) 0.0)
    ((:east __east) 0.0)
    ((:depth __depth) 0.0)
    )
   (send-super :init)
   (setq _north (float __north))
   (setq _east (float __east))
   (setq _depth (float __depth))
   self)
  (:north
   (&optional __north)
   (if __north (setq _north __north)) _north)
  (:east
   (&optional __east)
   (if __east (setq _east __east)) _east)
  (:depth
   (&optional __depth)
   (if __depth (setq _depth __depth)) _depth)
  (:serialization-length
   ()
   (+
    ;; float64 _north
    8
    ;; float64 _east
    8
    ;; float64 _depth
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _north
       (sys::poke _north (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _east
       (sys::poke _east (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _depth
       (sys::poke _depth (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _north
     (setq _north (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _east
     (setq _east (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _depth
     (setq _depth (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get cola2_msgs::NED :md5sum-) "4a16ce817ea5a7912b32dfb04540797b")
(setf (get cola2_msgs::NED :datatype-) "cola2_msgs/NED")
(setf (get cola2_msgs::NED :definition-)
      "# Position or velocity in the right-handed NED coordinate frame.

# metres north, positive towards true north.
float64 north

# metres east, positive towards true east.
float64 east

# metres down, positive towards the centre of the earth.
float64 depth

")



(provide :cola2_msgs/NED "4a16ce817ea5a7912b32dfb04540797b")


