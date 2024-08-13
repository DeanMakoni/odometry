; Auto-generated. Do not edit!


(cl:in-package cola2_msgs-msg)


;//! \htmlinclude GoalDescriptor.msg.html

(cl:defclass <GoalDescriptor> (roslisp-msg-protocol:ros-message)
  ((requester
    :reader requester
    :initarg :requester
    :type cl:string
    :initform "")
   (priority
    :reader priority
    :initarg :priority
    :type cl:integer
    :initform 0))
)

(cl:defclass GoalDescriptor (<GoalDescriptor>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoalDescriptor>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoalDescriptor)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cola2_msgs-msg:<GoalDescriptor> is deprecated: use cola2_msgs-msg:GoalDescriptor instead.")))

(cl:ensure-generic-function 'requester-val :lambda-list '(m))
(cl:defmethod requester-val ((m <GoalDescriptor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:requester-val is deprecated.  Use cola2_msgs-msg:requester instead.")
  (requester m))

(cl:ensure-generic-function 'priority-val :lambda-list '(m))
(cl:defmethod priority-val ((m <GoalDescriptor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:priority-val is deprecated.  Use cola2_msgs-msg:priority instead.")
  (priority m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<GoalDescriptor>)))
    "Constants for message type '<GoalDescriptor>"
  '((:PRIORITY_TELEOPERATION_LOW . 0)
    (:PRIORITY_SAFETY_LOW . 5)
    (:PRIORITY_NORMAL . 10)
    (:PRIORITY_SAFETY . 30)
    (:PRIORITY_TELEOPERATION . 40)
    (:PRIORITY_SAFETY_HIGH . 50)
    (:PRIORITY_TELEOPERATION_HIGH . 60))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'GoalDescriptor)))
    "Constants for message type 'GoalDescriptor"
  '((:PRIORITY_TELEOPERATION_LOW . 0)
    (:PRIORITY_SAFETY_LOW . 5)
    (:PRIORITY_NORMAL . 10)
    (:PRIORITY_SAFETY . 30)
    (:PRIORITY_TELEOPERATION . 40)
    (:PRIORITY_SAFETY_HIGH . 50)
    (:PRIORITY_TELEOPERATION_HIGH . 60))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoalDescriptor>) ostream)
  "Serializes a message object of type '<GoalDescriptor>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'requester))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'requester))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'priority)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'priority)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'priority)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'priority)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoalDescriptor>) istream)
  "Deserializes a message object of type '<GoalDescriptor>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'requester) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'requester) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'priority)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'priority)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'priority)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'priority)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoalDescriptor>)))
  "Returns string type for a message object of type '<GoalDescriptor>"
  "cola2_msgs/GoalDescriptor")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoalDescriptor)))
  "Returns string type for a message object of type 'GoalDescriptor"
  "cola2_msgs/GoalDescriptor")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoalDescriptor>)))
  "Returns md5sum for a message object of type '<GoalDescriptor>"
  "258dba3ec3a05ff24abe0733c68cf73a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoalDescriptor)))
  "Returns md5sum for a message object of type 'GoalDescriptor"
  "258dba3ec3a05ff24abe0733c68cf73a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoalDescriptor>)))
  "Returns full string definition for message of type '<GoalDescriptor>"
  (cl:format cl:nil "# Contains values common to all waypoint request and status messages.~%# Waypoint goals with higher priority trump lower priority goals. For~%# goals of the same priority, the pilot should follow the latest~%# received.~%~%# Name of the requesting node, used with id to identify the request.~%string requester~%~%uint32 priority~%~%# PRIORITY DEFINITIONS~%uint32 PRIORITY_TELEOPERATION_LOW = 0~%uint32 PRIORITY_SAFETY_LOW = 5~%uint32 PRIORITY_NORMAL = 10~%uint32 PRIORITY_SAFETY = 30~%uint32 PRIORITY_TELEOPERATION = 40~%uint32 PRIORITY_SAFETY_HIGH  = 50~%uint32 PRIORITY_TELEOPERATION_HIGH = 60~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoalDescriptor)))
  "Returns full string definition for message of type 'GoalDescriptor"
  (cl:format cl:nil "# Contains values common to all waypoint request and status messages.~%# Waypoint goals with higher priority trump lower priority goals. For~%# goals of the same priority, the pilot should follow the latest~%# received.~%~%# Name of the requesting node, used with id to identify the request.~%string requester~%~%uint32 priority~%~%# PRIORITY DEFINITIONS~%uint32 PRIORITY_TELEOPERATION_LOW = 0~%uint32 PRIORITY_SAFETY_LOW = 5~%uint32 PRIORITY_NORMAL = 10~%uint32 PRIORITY_SAFETY = 30~%uint32 PRIORITY_TELEOPERATION = 40~%uint32 PRIORITY_SAFETY_HIGH  = 50~%uint32 PRIORITY_TELEOPERATION_HIGH = 60~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoalDescriptor>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'requester))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoalDescriptor>))
  "Converts a ROS message object to a list"
  (cl:list 'GoalDescriptor
    (cl:cons ':requester (requester msg))
    (cl:cons ':priority (priority msg))
))
