;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::CaptainStatus)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'CaptainStatus (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::CAPTAINSTATUS")
  (make-package "COLA2_MSGS::CAPTAINSTATUS"))

(in-package "ROS")
;;//! \htmlinclude CaptainStatus.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*IDLE*" (find-package "COLA2_MSGS::CAPTAINSTATUS"))
(shadow '*IDLE* (find-package "COLA2_MSGS::CAPTAINSTATUS"))
(defconstant cola2_msgs::CaptainStatus::*IDLE* 0)
(intern "*GOTO*" (find-package "COLA2_MSGS::CAPTAINSTATUS"))
(shadow '*GOTO* (find-package "COLA2_MSGS::CAPTAINSTATUS"))
(defconstant cola2_msgs::CaptainStatus::*GOTO* 1)
(intern "*MISSION*" (find-package "COLA2_MSGS::CAPTAINSTATUS"))
(shadow '*MISSION* (find-package "COLA2_MSGS::CAPTAINSTATUS"))
(defconstant cola2_msgs::CaptainStatus::*MISSION* 2)
(intern "*KEEPPOSITION*" (find-package "COLA2_MSGS::CAPTAINSTATUS"))
(shadow '*KEEPPOSITION* (find-package "COLA2_MSGS::CAPTAINSTATUS"))
(defconstant cola2_msgs::CaptainStatus::*KEEPPOSITION* 3)
(intern "*SAFETYKEEPPOSITION*" (find-package "COLA2_MSGS::CAPTAINSTATUS"))
(shadow '*SAFETYKEEPPOSITION* (find-package "COLA2_MSGS::CAPTAINSTATUS"))
(defconstant cola2_msgs::CaptainStatus::*SAFETYKEEPPOSITION* 4)
(intern "*EXTERNALMISSION*" (find-package "COLA2_MSGS::CAPTAINSTATUS"))
(shadow '*EXTERNALMISSION* (find-package "COLA2_MSGS::CAPTAINSTATUS"))
(defconstant cola2_msgs::CaptainStatus::*EXTERNALMISSION* 5)
(intern "*SECTION*" (find-package "COLA2_MSGS::CAPTAINSTATUS"))
(shadow '*SECTION* (find-package "COLA2_MSGS::CAPTAINSTATUS"))
(defconstant cola2_msgs::CaptainStatus::*SECTION* 6)

(defun cola2_msgs::CaptainStatus-to-symbol (const)
  (cond
        ((= const 0) 'cola2_msgs::CaptainStatus::*IDLE*)
        ((= const 1) 'cola2_msgs::CaptainStatus::*GOTO*)
        ((= const 2) 'cola2_msgs::CaptainStatus::*MISSION*)
        ((= const 3) 'cola2_msgs::CaptainStatus::*KEEPPOSITION*)
        ((= const 4) 'cola2_msgs::CaptainStatus::*SAFETYKEEPPOSITION*)
        ((= const 5) 'cola2_msgs::CaptainStatus::*EXTERNALMISSION*)
        ((= const 6) 'cola2_msgs::CaptainStatus::*SECTION*)
        (t nil)))

(defclass cola2_msgs::CaptainStatus
  :super ros::object
  :slots (_header _state _message _loaded_missions ))

(defmethod cola2_msgs::CaptainStatus
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:state __state) 0)
    ((:message __message) "")
    ((:loaded_missions __loaded_missions) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _state (round __state))
   (setq _message (string __message))
   (setq _loaded_missions __loaded_missions)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:loaded_missions
   (&rest __loaded_missions)
   (if (keywordp (car __loaded_missions))
       (send* _loaded_missions __loaded_missions)
     (progn
       (if __loaded_missions (setq _loaded_missions (car __loaded_missions)))
       _loaded_missions)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _state
    1
    ;; string _message
    4 (length _message)
    ;; cola2_msgs/MissionState[] _loaded_missions
    (apply #'+ (send-all _loaded_missions :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _state
       (write-byte _state s)
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;; cola2_msgs/MissionState[] _loaded_missions
     (write-long (length _loaded_missions) s)
     (dolist (elem _loaded_missions)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _state
     (setq _state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; cola2_msgs/MissionState[] _loaded_missions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _loaded_missions (let (r) (dotimes (i n) (push (instance cola2_msgs::MissionState :init) r)) r))
     (dolist (elem- _loaded_missions)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get cola2_msgs::CaptainStatus :md5sum-) "815ee2fcdca21935c6a469f91057679d")
(setf (get cola2_msgs::CaptainStatus :datatype-) "cola2_msgs/CaptainStatus")
(setf (get cola2_msgs::CaptainStatus :definition-)
      "Header header

# State
uint8 IDLE = 0
uint8 GOTO = 1
uint8 MISSION = 2
uint8 KEEPPOSITION = 3
uint8 SAFETYKEEPPOSITION = 4
uint8 EXTERNALMISSION = 5
uint8 SECTION = 6
uint8 state

# Info message
string message

# List of missions
cola2_msgs/MissionState[] loaded_missions

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
MSG: cola2_msgs/MissionState
string name
int32 current_step
time last_active

")



(provide :cola2_msgs/CaptainStatus "815ee2fcdca21935c6a469f91057679d")


