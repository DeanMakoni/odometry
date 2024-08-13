;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::MaxJoyVelocity)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'MaxJoyVelocity (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::MAXJOYVELOCITY")
  (make-package "COLA2_MSGS::MAXJOYVELOCITY"))
(unless (find-package "COLA2_MSGS::MAXJOYVELOCITYREQUEST")
  (make-package "COLA2_MSGS::MAXJOYVELOCITYREQUEST"))
(unless (find-package "COLA2_MSGS::MAXJOYVELOCITYRESPONSE")
  (make-package "COLA2_MSGS::MAXJOYVELOCITYRESPONSE"))

(in-package "ROS")





(defclass cola2_msgs::MaxJoyVelocityRequest
  :super ros::object
  :slots (_max_joy_velocity ))

(defmethod cola2_msgs::MaxJoyVelocityRequest
  (:init
   (&key
    ((:max_joy_velocity __max_joy_velocity) (make-array 6 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _max_joy_velocity __max_joy_velocity)
   self)
  (:max_joy_velocity
   (&optional __max_joy_velocity)
   (if __max_joy_velocity (setq _max_joy_velocity __max_joy_velocity)) _max_joy_velocity)
  (:serialization-length
   ()
   (+
    ;; float64[6] _max_joy_velocity
    (* 8    6)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[6] _max_joy_velocity
     (dotimes (i 6)
       (sys::poke (elt _max_joy_velocity i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[6] _max_joy_velocity
   (dotimes (i (length _max_joy_velocity))
     (setf (elt _max_joy_velocity i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(defclass cola2_msgs::MaxJoyVelocityResponse
  :super ros::object
  :slots (_attempted ))

(defmethod cola2_msgs::MaxJoyVelocityResponse
  (:init
   (&key
    ((:attempted __attempted) nil)
    )
   (send-super :init)
   (setq _attempted __attempted)
   self)
  (:attempted
   (&optional (__attempted :null))
   (if (not (eq __attempted :null)) (setq _attempted __attempted)) _attempted)
  (:serialization-length
   ()
   (+
    ;; bool _attempted
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _attempted
       (if _attempted (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _attempted
     (setq _attempted (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass cola2_msgs::MaxJoyVelocity
  :super ros::object
  :slots ())

(setf (get cola2_msgs::MaxJoyVelocity :md5sum-) "65b63e684f31e94916e054c6a4a1b57f")
(setf (get cola2_msgs::MaxJoyVelocity :datatype-) "cola2_msgs/MaxJoyVelocity")
(setf (get cola2_msgs::MaxJoyVelocity :request) cola2_msgs::MaxJoyVelocityRequest)
(setf (get cola2_msgs::MaxJoyVelocity :response) cola2_msgs::MaxJoyVelocityResponse)

(defmethod cola2_msgs::MaxJoyVelocityRequest
  (:response () (instance cola2_msgs::MaxJoyVelocityResponse :init)))

(setf (get cola2_msgs::MaxJoyVelocityRequest :md5sum-) "65b63e684f31e94916e054c6a4a1b57f")
(setf (get cola2_msgs::MaxJoyVelocityRequest :datatype-) "cola2_msgs/MaxJoyVelocityRequest")
(setf (get cola2_msgs::MaxJoyVelocityRequest :definition-)
      "float64[6] max_joy_velocity
---
bool attempted


")

(setf (get cola2_msgs::MaxJoyVelocityResponse :md5sum-) "65b63e684f31e94916e054c6a4a1b57f")
(setf (get cola2_msgs::MaxJoyVelocityResponse :datatype-) "cola2_msgs/MaxJoyVelocityResponse")
(setf (get cola2_msgs::MaxJoyVelocityResponse :definition-)
      "float64[6] max_joy_velocity
---
bool attempted


")



(provide :cola2_msgs/MaxJoyVelocity "65b63e684f31e94916e054c6a4a1b57f")


