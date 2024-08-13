; Auto-generated. Do not edit!


(cl:in-package cola2_msgs-msg)


;//! \htmlinclude RecoveryAction.msg.html

(cl:defclass <RecoveryAction> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (error_level
    :reader error_level
    :initarg :error_level
    :type cl:fixnum
    :initform 0)
   (error_string
    :reader error_string
    :initarg :error_string
    :type cl:string
    :initform ""))
)

(cl:defclass RecoveryAction (<RecoveryAction>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RecoveryAction>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RecoveryAction)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cola2_msgs-msg:<RecoveryAction> is deprecated: use cola2_msgs-msg:RecoveryAction instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RecoveryAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:header-val is deprecated.  Use cola2_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'error_level-val :lambda-list '(m))
(cl:defmethod error_level-val ((m <RecoveryAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:error_level-val is deprecated.  Use cola2_msgs-msg:error_level instead.")
  (error_level m))

(cl:ensure-generic-function 'error_string-val :lambda-list '(m))
(cl:defmethod error_string-val ((m <RecoveryAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:error_string-val is deprecated.  Use cola2_msgs-msg:error_string instead.")
  (error_string m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<RecoveryAction>)))
    "Constants for message type '<RecoveryAction>"
  '((:NONE . 0)
    (:INFORMATIVE . 1)
    (:ABORT . 2)
    (:ABORT_AND_SURFACE . 3)
    (:EMERGENCY_SURFACE . 4)
    (:DROP_WEIGHT . 5))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'RecoveryAction)))
    "Constants for message type 'RecoveryAction"
  '((:NONE . 0)
    (:INFORMATIVE . 1)
    (:ABORT . 2)
    (:ABORT_AND_SURFACE . 3)
    (:EMERGENCY_SURFACE . 4)
    (:DROP_WEIGHT . 5))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RecoveryAction>) ostream)
  "Serializes a message object of type '<RecoveryAction>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'error_level)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'error_level)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error_string))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error_string))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RecoveryAction>) istream)
  "Deserializes a message object of type '<RecoveryAction>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'error_level)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'error_level)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error_string) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'error_string) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RecoveryAction>)))
  "Returns string type for a message object of type '<RecoveryAction>"
  "cola2_msgs/RecoveryAction")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RecoveryAction)))
  "Returns string type for a message object of type 'RecoveryAction"
  "cola2_msgs/RecoveryAction")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RecoveryAction>)))
  "Returns md5sum for a message object of type '<RecoveryAction>"
  "51b8f8c4fd7ace03db669a6d31c4068f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RecoveryAction)))
  "Returns md5sum for a message object of type 'RecoveryAction"
  "51b8f8c4fd7ace03db669a6d31c4068f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RecoveryAction>)))
  "Returns full string definition for message of type '<RecoveryAction>"
  (cl:format cl:nil "# Error level~%uint16 NONE = 0~%uint16 INFORMATIVE = 1~%uint16 ABORT = 2~%uint16 ABORT_AND_SURFACE = 3~%uint16 EMERGENCY_SURFACE = 4~%uint16 DROP_WEIGHT = 5~%~%Header header~%uint16 error_level~%string error_string~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RecoveryAction)))
  "Returns full string definition for message of type 'RecoveryAction"
  (cl:format cl:nil "# Error level~%uint16 NONE = 0~%uint16 INFORMATIVE = 1~%uint16 ABORT = 2~%uint16 ABORT_AND_SURFACE = 3~%uint16 EMERGENCY_SURFACE = 4~%uint16 DROP_WEIGHT = 5~%~%Header header~%uint16 error_level~%string error_string~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RecoveryAction>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     4 (cl:length (cl:slot-value msg 'error_string))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RecoveryAction>))
  "Converts a ROS message object to a list"
  (cl:list 'RecoveryAction
    (cl:cons ':header (header msg))
    (cl:cons ':error_level (error_level msg))
    (cl:cons ':error_string (error_string msg))
))
