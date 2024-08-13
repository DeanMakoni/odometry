;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::CaptainStateFeedback)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'CaptainStateFeedback (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::CAPTAINSTATEFEEDBACK")
  (make-package "COLA2_MSGS::CAPTAINSTATEFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude CaptainStateFeedback.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*ACTIVE*" (find-package "COLA2_MSGS::CAPTAINSTATEFEEDBACK"))
(shadow '*ACTIVE* (find-package "COLA2_MSGS::CAPTAINSTATEFEEDBACK"))
(defconstant cola2_msgs::CaptainStateFeedback::*ACTIVE* 0)
(intern "*SUCCESS*" (find-package "COLA2_MSGS::CAPTAINSTATEFEEDBACK"))
(shadow '*SUCCESS* (find-package "COLA2_MSGS::CAPTAINSTATEFEEDBACK"))
(defconstant cola2_msgs::CaptainStateFeedback::*SUCCESS* 1)
(intern "*FAILURE*" (find-package "COLA2_MSGS::CAPTAINSTATEFEEDBACK"))
(shadow '*FAILURE* (find-package "COLA2_MSGS::CAPTAINSTATEFEEDBACK"))
(defconstant cola2_msgs::CaptainStateFeedback::*FAILURE* 2)
(intern "*STOPPED*" (find-package "COLA2_MSGS::CAPTAINSTATEFEEDBACK"))
(shadow '*STOPPED* (find-package "COLA2_MSGS::CAPTAINSTATEFEEDBACK"))
(defconstant cola2_msgs::CaptainStateFeedback::*STOPPED* 3)

(defun cola2_msgs::CaptainStateFeedback-to-symbol (const)
  (cond
        ((= const 0) 'cola2_msgs::CaptainStateFeedback::*ACTIVE*)
        ((= const 1) 'cola2_msgs::CaptainStateFeedback::*SUCCESS*)
        ((= const 2) 'cola2_msgs::CaptainStateFeedback::*FAILURE*)
        ((= const 3) 'cola2_msgs::CaptainStateFeedback::*STOPPED*)
        (t nil)))

(defclass cola2_msgs::CaptainStateFeedback
  :super ros::object
  :slots (_header _state _time_to_finish _name _id _keyvalues ))

(defmethod cola2_msgs::CaptainStateFeedback
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:state __state) 0)
    ((:time_to_finish __time_to_finish) 0.0)
    ((:name __name) "")
    ((:id __id) 0)
    ((:keyvalues __keyvalues) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _state (round __state))
   (setq _time_to_finish (float __time_to_finish))
   (setq _name (string __name))
   (setq _id (round __id))
   (setq _keyvalues __keyvalues)
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
  (:time_to_finish
   (&optional __time_to_finish)
   (if __time_to_finish (setq _time_to_finish __time_to_finish)) _time_to_finish)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:keyvalues
   (&rest __keyvalues)
   (if (keywordp (car __keyvalues))
       (send* _keyvalues __keyvalues)
     (progn
       (if __keyvalues (setq _keyvalues (car __keyvalues)))
       _keyvalues)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _state
    1
    ;; float64 _time_to_finish
    8
    ;; string _name
    4 (length _name)
    ;; uint16 _id
    2
    ;; cola2_msgs/KeyValue[] _keyvalues
    (apply #'+ (send-all _keyvalues :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _state
       (write-byte _state s)
     ;; float64 _time_to_finish
       (sys::poke _time_to_finish (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; uint16 _id
       (write-word _id s)
     ;; cola2_msgs/KeyValue[] _keyvalues
     (write-long (length _keyvalues) s)
     (dolist (elem _keyvalues)
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
   ;; float64 _time_to_finish
     (setq _time_to_finish (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint16 _id
     (setq _id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; cola2_msgs/KeyValue[] _keyvalues
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _keyvalues (let (r) (dotimes (i n) (push (instance cola2_msgs::KeyValue :init) r)) r))
     (dolist (elem- _keyvalues)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get cola2_msgs::CaptainStateFeedback :md5sum-) "afefd4ce4fb740bbeb3fade79326e0f7")
(setf (get cola2_msgs::CaptainStateFeedback :datatype-) "cola2_msgs/CaptainStateFeedback")
(setf (get cola2_msgs::CaptainStateFeedback :definition-)
      "Header header

# State
uint8 ACTIVE = 0
uint8 SUCCESS = 1
uint8 FAILURE = 2
uint8 STOPPED = 3
uint8 state

# An estimate of the remaining time
float64 time_to_finish

# Name of the mode
string name

# Always increasing id assigned by the captain
uint16 id

# Extra information as a key-value list
cola2_msgs/KeyValue[] keyvalues

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



(provide :cola2_msgs/CaptainStateFeedback "afefd4ce4fb740bbeb3fade79326e0f7")


