;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::Bool6Axis)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'Bool6Axis (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::BOOL6AXIS")
  (make-package "COLA2_MSGS::BOOL6AXIS"))

(in-package "ROS")
;;//! \htmlinclude Bool6Axis.msg.html


(defclass cola2_msgs::Bool6Axis
  :super ros::object
  :slots (_x _y _z _roll _pitch _yaw ))

(defmethod cola2_msgs::Bool6Axis
  (:init
   (&key
    ((:x __x) nil)
    ((:y __y) nil)
    ((:z __z) nil)
    ((:roll __roll) nil)
    ((:pitch __pitch) nil)
    ((:yaw __yaw) nil)
    )
   (send-super :init)
   (setq _x __x)
   (setq _y __y)
   (setq _z __z)
   (setq _roll __roll)
   (setq _pitch __pitch)
   (setq _yaw __yaw)
   self)
  (:x
   (&optional (__x :null))
   (if (not (eq __x :null)) (setq _x __x)) _x)
  (:y
   (&optional (__y :null))
   (if (not (eq __y :null)) (setq _y __y)) _y)
  (:z
   (&optional (__z :null))
   (if (not (eq __z :null)) (setq _z __z)) _z)
  (:roll
   (&optional (__roll :null))
   (if (not (eq __roll :null)) (setq _roll __roll)) _roll)
  (:pitch
   (&optional (__pitch :null))
   (if (not (eq __pitch :null)) (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional (__yaw :null))
   (if (not (eq __yaw :null)) (setq _yaw __yaw)) _yaw)
  (:serialization-length
   ()
   (+
    ;; bool _x
    1
    ;; bool _y
    1
    ;; bool _z
    1
    ;; bool _roll
    1
    ;; bool _pitch
    1
    ;; bool _yaw
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _x
       (if _x (write-byte -1 s) (write-byte 0 s))
     ;; bool _y
       (if _y (write-byte -1 s) (write-byte 0 s))
     ;; bool _z
       (if _z (write-byte -1 s) (write-byte 0 s))
     ;; bool _roll
       (if _roll (write-byte -1 s) (write-byte 0 s))
     ;; bool _pitch
       (if _pitch (write-byte -1 s) (write-byte 0 s))
     ;; bool _yaw
       (if _yaw (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _x
     (setq _x (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _y
     (setq _y (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _z
     (setq _z (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _roll
     (setq _roll (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _pitch
     (setq _pitch (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _yaw
     (setq _yaw (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get cola2_msgs::Bool6Axis :md5sum-) "38f836659cedbc069e466741ffb25422")
(setf (get cola2_msgs::Bool6Axis :datatype-) "cola2_msgs/Bool6Axis")
(setf (get cola2_msgs::Bool6Axis :definition-)
      "bool x
bool y
bool z
bool roll
bool pitch
bool yaw


")



(provide :cola2_msgs/Bool6Axis "38f836659cedbc069e466741ffb25422")


