; Auto-generated. Do not edit!


(cl:in-package cola2_msgs-srv)


;//! \htmlinclude DigitalOutput-request.msg.html

(cl:defclass <DigitalOutput-request> (roslisp-msg-protocol:ros-message)
  ((digital_output
    :reader digital_output
    :initarg :digital_output
    :type cl:integer
    :initform 0)
   (value
    :reader value
    :initarg :value
    :type cl:integer
    :initform 0))
)

(cl:defclass DigitalOutput-request (<DigitalOutput-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DigitalOutput-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DigitalOutput-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cola2_msgs-srv:<DigitalOutput-request> is deprecated: use cola2_msgs-srv:DigitalOutput-request instead.")))

(cl:ensure-generic-function 'digital_output-val :lambda-list '(m))
(cl:defmethod digital_output-val ((m <DigitalOutput-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:digital_output-val is deprecated.  Use cola2_msgs-srv:digital_output instead.")
  (digital_output m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <DigitalOutput-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:value-val is deprecated.  Use cola2_msgs-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DigitalOutput-request>) ostream)
  "Serializes a message object of type '<DigitalOutput-request>"
  (cl:let* ((signed (cl:slot-value msg 'digital_output)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'value)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DigitalOutput-request>) istream)
  "Deserializes a message object of type '<DigitalOutput-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'digital_output) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DigitalOutput-request>)))
  "Returns string type for a service object of type '<DigitalOutput-request>"
  "cola2_msgs/DigitalOutputRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DigitalOutput-request)))
  "Returns string type for a service object of type 'DigitalOutput-request"
  "cola2_msgs/DigitalOutputRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DigitalOutput-request>)))
  "Returns md5sum for a message object of type '<DigitalOutput-request>"
  "183c2e45b1ebafc9b5e338f77154c8b4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DigitalOutput-request)))
  "Returns md5sum for a message object of type 'DigitalOutput-request"
  "183c2e45b1ebafc9b5e338f77154c8b4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DigitalOutput-request>)))
  "Returns full string definition for message of type '<DigitalOutput-request>"
  (cl:format cl:nil "int32 digital_output~%int32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DigitalOutput-request)))
  "Returns full string definition for message of type 'DigitalOutput-request"
  (cl:format cl:nil "int32 digital_output~%int32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DigitalOutput-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DigitalOutput-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DigitalOutput-request
    (cl:cons ':digital_output (digital_output msg))
    (cl:cons ':value (value msg))
))
;//! \htmlinclude DigitalOutput-response.msg.html

(cl:defclass <DigitalOutput-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass DigitalOutput-response (<DigitalOutput-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DigitalOutput-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DigitalOutput-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cola2_msgs-srv:<DigitalOutput-response> is deprecated: use cola2_msgs-srv:DigitalOutput-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <DigitalOutput-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:success-val is deprecated.  Use cola2_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <DigitalOutput-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:message-val is deprecated.  Use cola2_msgs-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DigitalOutput-response>) ostream)
  "Serializes a message object of type '<DigitalOutput-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DigitalOutput-response>) istream)
  "Deserializes a message object of type '<DigitalOutput-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DigitalOutput-response>)))
  "Returns string type for a service object of type '<DigitalOutput-response>"
  "cola2_msgs/DigitalOutputResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DigitalOutput-response)))
  "Returns string type for a service object of type 'DigitalOutput-response"
  "cola2_msgs/DigitalOutputResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DigitalOutput-response>)))
  "Returns md5sum for a message object of type '<DigitalOutput-response>"
  "183c2e45b1ebafc9b5e338f77154c8b4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DigitalOutput-response)))
  "Returns md5sum for a message object of type 'DigitalOutput-response"
  "183c2e45b1ebafc9b5e338f77154c8b4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DigitalOutput-response>)))
  "Returns full string definition for message of type '<DigitalOutput-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DigitalOutput-response)))
  "Returns full string definition for message of type 'DigitalOutput-response"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DigitalOutput-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DigitalOutput-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DigitalOutput-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DigitalOutput)))
  'DigitalOutput-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DigitalOutput)))
  'DigitalOutput-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DigitalOutput)))
  "Returns string type for a service object of type '<DigitalOutput>"
  "cola2_msgs/DigitalOutput")