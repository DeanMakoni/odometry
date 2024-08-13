; Auto-generated. Do not edit!


(cl:in-package cola2_msgs-msg)


;//! \htmlinclude SafetySupervisorStatus.msg.html

(cl:defclass <SafetySupervisorStatus> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0)
   (recovery_action
    :reader recovery_action
    :initarg :recovery_action
    :type cola2_msgs-msg:RecoveryAction
    :initform (cl:make-instance 'cola2_msgs-msg:RecoveryAction)))
)

(cl:defclass SafetySupervisorStatus (<SafetySupervisorStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SafetySupervisorStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SafetySupervisorStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cola2_msgs-msg:<SafetySupervisorStatus> is deprecated: use cola2_msgs-msg:SafetySupervisorStatus instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SafetySupervisorStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:header-val is deprecated.  Use cola2_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <SafetySupervisorStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:status_code-val is deprecated.  Use cola2_msgs-msg:status_code instead.")
  (status_code m))

(cl:ensure-generic-function 'recovery_action-val :lambda-list '(m))
(cl:defmethod recovery_action-val ((m <SafetySupervisorStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:recovery_action-val is deprecated.  Use cola2_msgs-msg:recovery_action instead.")
  (recovery_action m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SafetySupervisorStatus>) ostream)
  "Serializes a message object of type '<SafetySupervisorStatus>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_code)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'status_code)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'status_code)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'status_code)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'recovery_action) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SafetySupervisorStatus>) istream)
  "Deserializes a message object of type '<SafetySupervisorStatus>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_code)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'status_code)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'status_code)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'status_code)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'recovery_action) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SafetySupervisorStatus>)))
  "Returns string type for a message object of type '<SafetySupervisorStatus>"
  "cola2_msgs/SafetySupervisorStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SafetySupervisorStatus)))
  "Returns string type for a message object of type 'SafetySupervisorStatus"
  "cola2_msgs/SafetySupervisorStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SafetySupervisorStatus>)))
  "Returns md5sum for a message object of type '<SafetySupervisorStatus>"
  "30e23638810e8d36f193cd10c740af04")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SafetySupervisorStatus)))
  "Returns md5sum for a message object of type 'SafetySupervisorStatus"
  "30e23638810e8d36f193cd10c740af04")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SafetySupervisorStatus>)))
  "Returns full string definition for message of type '<SafetySupervisorStatus>"
  (cl:format cl:nil "Header header~%uint32 status_code~%cola2_msgs/RecoveryAction recovery_action~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: cola2_msgs/RecoveryAction~%# Error level~%uint16 NONE = 0~%uint16 INFORMATIVE = 1~%uint16 ABORT = 2~%uint16 ABORT_AND_SURFACE = 3~%uint16 EMERGENCY_SURFACE = 4~%uint16 DROP_WEIGHT = 5~%~%Header header~%uint16 error_level~%string error_string~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SafetySupervisorStatus)))
  "Returns full string definition for message of type 'SafetySupervisorStatus"
  (cl:format cl:nil "Header header~%uint32 status_code~%cola2_msgs/RecoveryAction recovery_action~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: cola2_msgs/RecoveryAction~%# Error level~%uint16 NONE = 0~%uint16 INFORMATIVE = 1~%uint16 ABORT = 2~%uint16 ABORT_AND_SURFACE = 3~%uint16 EMERGENCY_SURFACE = 4~%uint16 DROP_WEIGHT = 5~%~%Header header~%uint16 error_level~%string error_string~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SafetySupervisorStatus>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'recovery_action))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SafetySupervisorStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'SafetySupervisorStatus
    (cl:cons ':header (header msg))
    (cl:cons ':status_code (status_code msg))
    (cl:cons ':recovery_action (recovery_action msg))
))
