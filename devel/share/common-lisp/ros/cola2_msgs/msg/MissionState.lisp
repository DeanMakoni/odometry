; Auto-generated. Do not edit!


(cl:in-package cola2_msgs-msg)


;//! \htmlinclude MissionState.msg.html

(cl:defclass <MissionState> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (current_step
    :reader current_step
    :initarg :current_step
    :type cl:integer
    :initform 0)
   (last_active
    :reader last_active
    :initarg :last_active
    :type cl:real
    :initform 0))
)

(cl:defclass MissionState (<MissionState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MissionState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MissionState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cola2_msgs-msg:<MissionState> is deprecated: use cola2_msgs-msg:MissionState instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <MissionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:name-val is deprecated.  Use cola2_msgs-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'current_step-val :lambda-list '(m))
(cl:defmethod current_step-val ((m <MissionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:current_step-val is deprecated.  Use cola2_msgs-msg:current_step instead.")
  (current_step m))

(cl:ensure-generic-function 'last_active-val :lambda-list '(m))
(cl:defmethod last_active-val ((m <MissionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:last_active-val is deprecated.  Use cola2_msgs-msg:last_active instead.")
  (last_active m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MissionState>) ostream)
  "Serializes a message object of type '<MissionState>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let* ((signed (cl:slot-value msg 'current_step)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'last_active)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'last_active) (cl:floor (cl:slot-value msg 'last_active)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MissionState>) istream)
  "Deserializes a message object of type '<MissionState>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'current_step) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'last_active) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MissionState>)))
  "Returns string type for a message object of type '<MissionState>"
  "cola2_msgs/MissionState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MissionState)))
  "Returns string type for a message object of type 'MissionState"
  "cola2_msgs/MissionState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MissionState>)))
  "Returns md5sum for a message object of type '<MissionState>"
  "b22991b6c5683eeec05d46250572c6e6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MissionState)))
  "Returns md5sum for a message object of type 'MissionState"
  "b22991b6c5683eeec05d46250572c6e6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MissionState>)))
  "Returns full string definition for message of type '<MissionState>"
  (cl:format cl:nil "string name~%int32 current_step~%time last_active~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MissionState)))
  "Returns full string definition for message of type 'MissionState"
  (cl:format cl:nil "string name~%int32 current_step~%time last_active~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MissionState>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MissionState>))
  "Converts a ROS message object to a list"
  (cl:list 'MissionState
    (cl:cons ':name (name msg))
    (cl:cons ':current_step (current_step msg))
    (cl:cons ':last_active (last_active msg))
))
