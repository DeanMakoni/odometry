;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::GoalDescriptor)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'GoalDescriptor (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::GOALDESCRIPTOR")
  (make-package "COLA2_MSGS::GOALDESCRIPTOR"))

(in-package "ROS")
;;//! \htmlinclude GoalDescriptor.msg.html


(intern "*PRIORITY_TELEOPERATION_LOW*" (find-package "COLA2_MSGS::GOALDESCRIPTOR"))
(shadow '*PRIORITY_TELEOPERATION_LOW* (find-package "COLA2_MSGS::GOALDESCRIPTOR"))
(defconstant cola2_msgs::GoalDescriptor::*PRIORITY_TELEOPERATION_LOW* 0)
(intern "*PRIORITY_SAFETY_LOW*" (find-package "COLA2_MSGS::GOALDESCRIPTOR"))
(shadow '*PRIORITY_SAFETY_LOW* (find-package "COLA2_MSGS::GOALDESCRIPTOR"))
(defconstant cola2_msgs::GoalDescriptor::*PRIORITY_SAFETY_LOW* 5)
(intern "*PRIORITY_NORMAL*" (find-package "COLA2_MSGS::GOALDESCRIPTOR"))
(shadow '*PRIORITY_NORMAL* (find-package "COLA2_MSGS::GOALDESCRIPTOR"))
(defconstant cola2_msgs::GoalDescriptor::*PRIORITY_NORMAL* 10)
(intern "*PRIORITY_SAFETY*" (find-package "COLA2_MSGS::GOALDESCRIPTOR"))
(shadow '*PRIORITY_SAFETY* (find-package "COLA2_MSGS::GOALDESCRIPTOR"))
(defconstant cola2_msgs::GoalDescriptor::*PRIORITY_SAFETY* 30)
(intern "*PRIORITY_TELEOPERATION*" (find-package "COLA2_MSGS::GOALDESCRIPTOR"))
(shadow '*PRIORITY_TELEOPERATION* (find-package "COLA2_MSGS::GOALDESCRIPTOR"))
(defconstant cola2_msgs::GoalDescriptor::*PRIORITY_TELEOPERATION* 40)
(intern "*PRIORITY_SAFETY_HIGH*" (find-package "COLA2_MSGS::GOALDESCRIPTOR"))
(shadow '*PRIORITY_SAFETY_HIGH* (find-package "COLA2_MSGS::GOALDESCRIPTOR"))
(defconstant cola2_msgs::GoalDescriptor::*PRIORITY_SAFETY_HIGH* 50)
(intern "*PRIORITY_TELEOPERATION_HIGH*" (find-package "COLA2_MSGS::GOALDESCRIPTOR"))
(shadow '*PRIORITY_TELEOPERATION_HIGH* (find-package "COLA2_MSGS::GOALDESCRIPTOR"))
(defconstant cola2_msgs::GoalDescriptor::*PRIORITY_TELEOPERATION_HIGH* 60)

(defun cola2_msgs::GoalDescriptor-to-symbol (const)
  (cond
        ((= const 0) 'cola2_msgs::GoalDescriptor::*PRIORITY_TELEOPERATION_LOW*)
        ((= const 5) 'cola2_msgs::GoalDescriptor::*PRIORITY_SAFETY_LOW*)
        ((= const 10) 'cola2_msgs::GoalDescriptor::*PRIORITY_NORMAL*)
        ((= const 30) 'cola2_msgs::GoalDescriptor::*PRIORITY_SAFETY*)
        ((= const 40) 'cola2_msgs::GoalDescriptor::*PRIORITY_TELEOPERATION*)
        ((= const 50) 'cola2_msgs::GoalDescriptor::*PRIORITY_SAFETY_HIGH*)
        ((= const 60) 'cola2_msgs::GoalDescriptor::*PRIORITY_TELEOPERATION_HIGH*)
        (t nil)))

(defclass cola2_msgs::GoalDescriptor
  :super ros::object
  :slots (_requester _priority ))

(defmethod cola2_msgs::GoalDescriptor
  (:init
   (&key
    ((:requester __requester) "")
    ((:priority __priority) 0)
    )
   (send-super :init)
   (setq _requester (string __requester))
   (setq _priority (round __priority))
   self)
  (:requester
   (&optional __requester)
   (if __requester (setq _requester __requester)) _requester)
  (:priority
   (&optional __priority)
   (if __priority (setq _priority __priority)) _priority)
  (:serialization-length
   ()
   (+
    ;; string _requester
    4 (length _requester)
    ;; uint32 _priority
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _requester
       (write-long (length _requester) s) (princ _requester s)
     ;; uint32 _priority
       (write-long _priority s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _requester
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _requester (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint32 _priority
     (setq _priority (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get cola2_msgs::GoalDescriptor :md5sum-) "258dba3ec3a05ff24abe0733c68cf73a")
(setf (get cola2_msgs::GoalDescriptor :datatype-) "cola2_msgs/GoalDescriptor")
(setf (get cola2_msgs::GoalDescriptor :definition-)
      "# Contains values common to all waypoint request and status messages.
# Waypoint goals with higher priority trump lower priority goals. For
# goals of the same priority, the pilot should follow the latest
# received.

# Name of the requesting node, used with id to identify the request.
string requester

uint32 priority

# PRIORITY DEFINITIONS
uint32 PRIORITY_TELEOPERATION_LOW = 0
uint32 PRIORITY_SAFETY_LOW = 5
uint32 PRIORITY_NORMAL = 10
uint32 PRIORITY_SAFETY = 30
uint32 PRIORITY_TELEOPERATION = 40
uint32 PRIORITY_SAFETY_HIGH  = 50
uint32 PRIORITY_TELEOPERATION_HIGH = 60

")



(provide :cola2_msgs/GoalDescriptor "258dba3ec3a05ff24abe0733c68cf73a")


