; Auto-generated. Do not edit!


(cl:in-package cola2_msgs-srv)


;//! \htmlinclude Mission-request.msg.html

(cl:defclass <Mission-request> (roslisp-msg-protocol:ros-message)
  ((mission
    :reader mission
    :initarg :mission
    :type cl:string
    :initform ""))
)

(cl:defclass Mission-request (<Mission-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Mission-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Mission-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cola2_msgs-srv:<Mission-request> is deprecated: use cola2_msgs-srv:Mission-request instead.")))

(cl:ensure-generic-function 'mission-val :lambda-list '(m))
(cl:defmethod mission-val ((m <Mission-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:mission-val is deprecated.  Use cola2_msgs-srv:mission instead.")
  (mission m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Mission-request>) ostream)
  "Serializes a message object of type '<Mission-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'mission))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'mission))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Mission-request>) istream)
  "Deserializes a message object of type '<Mission-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mission) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'mission) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Mission-request>)))
  "Returns string type for a service object of type '<Mission-request>"
  "cola2_msgs/MissionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Mission-request)))
  "Returns string type for a service object of type 'Mission-request"
  "cola2_msgs/MissionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Mission-request>)))
  "Returns md5sum for a message object of type '<Mission-request>"
  "4c0bb5660c3e04aa8fcef310293495f7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Mission-request)))
  "Returns md5sum for a message object of type 'Mission-request"
  "4c0bb5660c3e04aa8fcef310293495f7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Mission-request>)))
  "Returns full string definition for message of type '<Mission-request>"
  (cl:format cl:nil "string mission~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Mission-request)))
  "Returns full string definition for message of type 'Mission-request"
  (cl:format cl:nil "string mission~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Mission-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'mission))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Mission-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Mission-request
    (cl:cons ':mission (mission msg))
))
;//! \htmlinclude Mission-response.msg.html

(cl:defclass <Mission-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass Mission-response (<Mission-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Mission-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Mission-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cola2_msgs-srv:<Mission-response> is deprecated: use cola2_msgs-srv:Mission-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Mission-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:success-val is deprecated.  Use cola2_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <Mission-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:message-val is deprecated.  Use cola2_msgs-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Mission-response>) ostream)
  "Serializes a message object of type '<Mission-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Mission-response>) istream)
  "Deserializes a message object of type '<Mission-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Mission-response>)))
  "Returns string type for a service object of type '<Mission-response>"
  "cola2_msgs/MissionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Mission-response)))
  "Returns string type for a service object of type 'Mission-response"
  "cola2_msgs/MissionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Mission-response>)))
  "Returns md5sum for a message object of type '<Mission-response>"
  "4c0bb5660c3e04aa8fcef310293495f7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Mission-response)))
  "Returns md5sum for a message object of type 'Mission-response"
  "4c0bb5660c3e04aa8fcef310293495f7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Mission-response>)))
  "Returns full string definition for message of type '<Mission-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Mission-response)))
  "Returns full string definition for message of type 'Mission-response"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Mission-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Mission-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Mission-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Mission)))
  'Mission-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Mission)))
  'Mission-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Mission)))
  "Returns string type for a service object of type '<Mission>"
  "cola2_msgs/Mission")