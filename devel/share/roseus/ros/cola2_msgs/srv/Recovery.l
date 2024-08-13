;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::Recovery)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'Recovery (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::RECOVERY")
  (make-package "COLA2_MSGS::RECOVERY"))
(unless (find-package "COLA2_MSGS::RECOVERYREQUEST")
  (make-package "COLA2_MSGS::RECOVERYREQUEST"))
(unless (find-package "COLA2_MSGS::RECOVERYRESPONSE")
  (make-package "COLA2_MSGS::RECOVERYRESPONSE"))

(in-package "ROS")





(defclass cola2_msgs::RecoveryRequest
  :super ros::object
  :slots (_requested_action ))

(defmethod cola2_msgs::RecoveryRequest
  (:init
   (&key
    ((:requested_action __requested_action) (instance cola2_msgs::RecoveryAction :init))
    )
   (send-super :init)
   (setq _requested_action __requested_action)
   self)
  (:requested_action
   (&rest __requested_action)
   (if (keywordp (car __requested_action))
       (send* _requested_action __requested_action)
     (progn
       (if __requested_action (setq _requested_action (car __requested_action)))
       _requested_action)))
  (:serialization-length
   ()
   (+
    ;; cola2_msgs/RecoveryAction _requested_action
    (send _requested_action :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; cola2_msgs/RecoveryAction _requested_action
       (send _requested_action :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; cola2_msgs/RecoveryAction _requested_action
     (send _requested_action :deserialize buf ptr-) (incf ptr- (send _requested_action :serialization-length))
   ;;
   self)
  )

(defclass cola2_msgs::RecoveryResponse
  :super ros::object
  :slots (_attempted ))

(defmethod cola2_msgs::RecoveryResponse
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

(defclass cola2_msgs::Recovery
  :super ros::object
  :slots ())

(setf (get cola2_msgs::Recovery :md5sum-) "44dc867ef177deea4414ea94077e9b72")
(setf (get cola2_msgs::Recovery :datatype-) "cola2_msgs/Recovery")
(setf (get cola2_msgs::Recovery :request) cola2_msgs::RecoveryRequest)
(setf (get cola2_msgs::Recovery :response) cola2_msgs::RecoveryResponse)

(defmethod cola2_msgs::RecoveryRequest
  (:response () (instance cola2_msgs::RecoveryResponse :init)))

(setf (get cola2_msgs::RecoveryRequest :md5sum-) "44dc867ef177deea4414ea94077e9b72")
(setf (get cola2_msgs::RecoveryRequest :datatype-) "cola2_msgs/RecoveryRequest")
(setf (get cola2_msgs::RecoveryRequest :definition-)
      "cola2_msgs/RecoveryAction requested_action

================================================================================
MSG: cola2_msgs/RecoveryAction
# Error level
uint16 NONE = 0
uint16 INFORMATIVE = 1
uint16 ABORT = 2
uint16 ABORT_AND_SURFACE = 3
uint16 EMERGENCY_SURFACE = 4
uint16 DROP_WEIGHT = 5

Header header
uint16 error_level
string error_string

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
---
bool attempted

")

(setf (get cola2_msgs::RecoveryResponse :md5sum-) "44dc867ef177deea4414ea94077e9b72")
(setf (get cola2_msgs::RecoveryResponse :datatype-) "cola2_msgs/RecoveryResponse")
(setf (get cola2_msgs::RecoveryResponse :definition-)
      "cola2_msgs/RecoveryAction requested_action

================================================================================
MSG: cola2_msgs/RecoveryAction
# Error level
uint16 NONE = 0
uint16 INFORMATIVE = 1
uint16 ABORT = 2
uint16 ABORT_AND_SURFACE = 3
uint16 EMERGENCY_SURFACE = 4
uint16 DROP_WEIGHT = 5

Header header
uint16 error_level
string error_string

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
---
bool attempted

")



(provide :cola2_msgs/Recovery "44dc867ef177deea4414ea94077e9b72")


