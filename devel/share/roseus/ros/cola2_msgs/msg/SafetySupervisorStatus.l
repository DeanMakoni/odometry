;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::SafetySupervisorStatus)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'SafetySupervisorStatus (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::SAFETYSUPERVISORSTATUS")
  (make-package "COLA2_MSGS::SAFETYSUPERVISORSTATUS"))

(in-package "ROS")
;;//! \htmlinclude SafetySupervisorStatus.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass cola2_msgs::SafetySupervisorStatus
  :super ros::object
  :slots (_header _status_code _recovery_action ))

(defmethod cola2_msgs::SafetySupervisorStatus
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:status_code __status_code) 0)
    ((:recovery_action __recovery_action) (instance cola2_msgs::RecoveryAction :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _status_code (round __status_code))
   (setq _recovery_action __recovery_action)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:status_code
   (&optional __status_code)
   (if __status_code (setq _status_code __status_code)) _status_code)
  (:recovery_action
   (&rest __recovery_action)
   (if (keywordp (car __recovery_action))
       (send* _recovery_action __recovery_action)
     (progn
       (if __recovery_action (setq _recovery_action (car __recovery_action)))
       _recovery_action)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _status_code
    4
    ;; cola2_msgs/RecoveryAction _recovery_action
    (send _recovery_action :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _status_code
       (write-long _status_code s)
     ;; cola2_msgs/RecoveryAction _recovery_action
       (send _recovery_action :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _status_code
     (setq _status_code (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; cola2_msgs/RecoveryAction _recovery_action
     (send _recovery_action :deserialize buf ptr-) (incf ptr- (send _recovery_action :serialization-length))
   ;;
   self)
  )

(setf (get cola2_msgs::SafetySupervisorStatus :md5sum-) "30e23638810e8d36f193cd10c740af04")
(setf (get cola2_msgs::SafetySupervisorStatus :datatype-) "cola2_msgs/SafetySupervisorStatus")
(setf (get cola2_msgs::SafetySupervisorStatus :definition-)
      "Header header
uint32 status_code
cola2_msgs/RecoveryAction recovery_action

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

")



(provide :cola2_msgs/SafetySupervisorStatus "30e23638810e8d36f193cd10c740af04")


