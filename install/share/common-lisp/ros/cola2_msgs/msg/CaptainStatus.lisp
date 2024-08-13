; Auto-generated. Do not edit!


(cl:in-package cola2_msgs-msg)


;//! \htmlinclude CaptainStatus.msg.html

(cl:defclass <CaptainStatus> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (state
    :reader state
    :initarg :state
    :type cl:fixnum
    :initform 0)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform "")
   (loaded_missions
    :reader loaded_missions
    :initarg :loaded_missions
    :type (cl:vector cola2_msgs-msg:MissionState)
   :initform (cl:make-array 0 :element-type 'cola2_msgs-msg:MissionState :initial-element (cl:make-instance 'cola2_msgs-msg:MissionState))))
)

(cl:defclass CaptainStatus (<CaptainStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CaptainStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CaptainStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cola2_msgs-msg:<CaptainStatus> is deprecated: use cola2_msgs-msg:CaptainStatus instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <CaptainStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:header-val is deprecated.  Use cola2_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <CaptainStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:state-val is deprecated.  Use cola2_msgs-msg:state instead.")
  (state m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <CaptainStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:message-val is deprecated.  Use cola2_msgs-msg:message instead.")
  (message m))

(cl:ensure-generic-function 'loaded_missions-val :lambda-list '(m))
(cl:defmethod loaded_missions-val ((m <CaptainStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:loaded_missions-val is deprecated.  Use cola2_msgs-msg:loaded_missions instead.")
  (loaded_missions m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<CaptainStatus>)))
    "Constants for message type '<CaptainStatus>"
  '((:IDLE . 0)
    (:GOTO . 1)
    (:MISSION . 2)
    (:KEEPPOSITION . 3)
    (:SAFETYKEEPPOSITION . 4)
    (:EXTERNALMISSION . 5)
    (:SECTION . 6))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'CaptainStatus)))
    "Constants for message type 'CaptainStatus"
  '((:IDLE . 0)
    (:GOTO . 1)
    (:MISSION . 2)
    (:KEEPPOSITION . 3)
    (:SAFETYKEEPPOSITION . 4)
    (:EXTERNALMISSION . 5)
    (:SECTION . 6))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CaptainStatus>) ostream)
  "Serializes a message object of type '<CaptainStatus>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'state)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'loaded_missions))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'loaded_missions))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CaptainStatus>) istream)
  "Deserializes a message object of type '<CaptainStatus>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'state)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'loaded_missions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'loaded_missions)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'cola2_msgs-msg:MissionState))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CaptainStatus>)))
  "Returns string type for a message object of type '<CaptainStatus>"
  "cola2_msgs/CaptainStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CaptainStatus)))
  "Returns string type for a message object of type 'CaptainStatus"
  "cola2_msgs/CaptainStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CaptainStatus>)))
  "Returns md5sum for a message object of type '<CaptainStatus>"
  "815ee2fcdca21935c6a469f91057679d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CaptainStatus)))
  "Returns md5sum for a message object of type 'CaptainStatus"
  "815ee2fcdca21935c6a469f91057679d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CaptainStatus>)))
  "Returns full string definition for message of type '<CaptainStatus>"
  (cl:format cl:nil "Header header~%~%# State~%uint8 IDLE = 0~%uint8 GOTO = 1~%uint8 MISSION = 2~%uint8 KEEPPOSITION = 3~%uint8 SAFETYKEEPPOSITION = 4~%uint8 EXTERNALMISSION = 5~%uint8 SECTION = 6~%uint8 state~%~%# Info message~%string message~%~%# List of missions~%cola2_msgs/MissionState[] loaded_missions~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: cola2_msgs/MissionState~%string name~%int32 current_step~%time last_active~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CaptainStatus)))
  "Returns full string definition for message of type 'CaptainStatus"
  (cl:format cl:nil "Header header~%~%# State~%uint8 IDLE = 0~%uint8 GOTO = 1~%uint8 MISSION = 2~%uint8 KEEPPOSITION = 3~%uint8 SAFETYKEEPPOSITION = 4~%uint8 EXTERNALMISSION = 5~%uint8 SECTION = 6~%uint8 state~%~%# Info message~%string message~%~%# List of missions~%cola2_msgs/MissionState[] loaded_missions~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: cola2_msgs/MissionState~%string name~%int32 current_step~%time last_active~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CaptainStatus>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4 (cl:length (cl:slot-value msg 'message))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'loaded_missions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CaptainStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'CaptainStatus
    (cl:cons ':header (header msg))
    (cl:cons ':state (state msg))
    (cl:cons ':message (message msg))
    (cl:cons ':loaded_missions (loaded_missions msg))
))
