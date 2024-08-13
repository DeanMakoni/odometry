;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::RecoveryAction)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'RecoveryAction (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::RECOVERYACTION")
  (make-package "COLA2_MSGS::RECOVERYACTION"))

(in-package "ROS")
;;//! \htmlinclude RecoveryAction.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*NONE*" (find-package "COLA2_MSGS::RECOVERYACTION"))
(shadow '*NONE* (find-package "COLA2_MSGS::RECOVERYACTION"))
(defconstant cola2_msgs::RecoveryAction::*NONE* 0)
(intern "*INFORMATIVE*" (find-package "COLA2_MSGS::RECOVERYACTION"))
(shadow '*INFORMATIVE* (find-package "COLA2_MSGS::RECOVERYACTION"))
(defconstant cola2_msgs::RecoveryAction::*INFORMATIVE* 1)
(intern "*ABORT*" (find-package "COLA2_MSGS::RECOVERYACTION"))
(shadow '*ABORT* (find-package "COLA2_MSGS::RECOVERYACTION"))
(defconstant cola2_msgs::RecoveryAction::*ABORT* 2)
(intern "*ABORT_AND_SURFACE*" (find-package "COLA2_MSGS::RECOVERYACTION"))
(shadow '*ABORT_AND_SURFACE* (find-package "COLA2_MSGS::RECOVERYACTION"))
(defconstant cola2_msgs::RecoveryAction::*ABORT_AND_SURFACE* 3)
(intern "*EMERGENCY_SURFACE*" (find-package "COLA2_MSGS::RECOVERYACTION"))
(shadow '*EMERGENCY_SURFACE* (find-package "COLA2_MSGS::RECOVERYACTION"))
(defconstant cola2_msgs::RecoveryAction::*EMERGENCY_SURFACE* 4)
(intern "*DROP_WEIGHT*" (find-package "COLA2_MSGS::RECOVERYACTION"))
(shadow '*DROP_WEIGHT* (find-package "COLA2_MSGS::RECOVERYACTION"))
(defconstant cola2_msgs::RecoveryAction::*DROP_WEIGHT* 5)

(defun cola2_msgs::RecoveryAction-to-symbol (const)
  (cond
        ((= const 0) 'cola2_msgs::RecoveryAction::*NONE*)
        ((= const 1) 'cola2_msgs::RecoveryAction::*INFORMATIVE*)
        ((= const 2) 'cola2_msgs::RecoveryAction::*ABORT*)
        ((= const 3) 'cola2_msgs::RecoveryAction::*ABORT_AND_SURFACE*)
        ((= const 4) 'cola2_msgs::RecoveryAction::*EMERGENCY_SURFACE*)
        ((= const 5) 'cola2_msgs::RecoveryAction::*DROP_WEIGHT*)
        (t nil)))

(defclass cola2_msgs::RecoveryAction
  :super ros::object
  :slots (_header _error_level _error_string ))

(defmethod cola2_msgs::RecoveryAction
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:error_level __error_level) 0)
    ((:error_string __error_string) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _error_level (round __error_level))
   (setq _error_string (string __error_string))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:error_level
   (&optional __error_level)
   (if __error_level (setq _error_level __error_level)) _error_level)
  (:error_string
   (&optional __error_string)
   (if __error_string (setq _error_string __error_string)) _error_string)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint16 _error_level
    2
    ;; string _error_string
    4 (length _error_string)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint16 _error_level
       (write-word _error_level s)
     ;; string _error_string
       (write-long (length _error_string) s) (princ _error_string s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint16 _error_level
     (setq _error_level (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; string _error_string
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _error_string (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get cola2_msgs::RecoveryAction :md5sum-) "51b8f8c4fd7ace03db669a6d31c4068f")
(setf (get cola2_msgs::RecoveryAction :datatype-) "cola2_msgs/RecoveryAction")
(setf (get cola2_msgs::RecoveryAction :definition-)
      "# Error level
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

")



(provide :cola2_msgs/RecoveryAction "51b8f8c4fd7ace03db669a6d31c4068f")


