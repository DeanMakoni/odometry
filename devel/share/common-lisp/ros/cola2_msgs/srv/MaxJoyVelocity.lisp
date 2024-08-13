; Auto-generated. Do not edit!


(cl:in-package cola2_msgs-srv)


;//! \htmlinclude MaxJoyVelocity-request.msg.html

(cl:defclass <MaxJoyVelocity-request> (roslisp-msg-protocol:ros-message)
  ((max_joy_velocity
    :reader max_joy_velocity
    :initarg :max_joy_velocity
    :type (cl:vector cl:float)
   :initform (cl:make-array 6 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass MaxJoyVelocity-request (<MaxJoyVelocity-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MaxJoyVelocity-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MaxJoyVelocity-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cola2_msgs-srv:<MaxJoyVelocity-request> is deprecated: use cola2_msgs-srv:MaxJoyVelocity-request instead.")))

(cl:ensure-generic-function 'max_joy_velocity-val :lambda-list '(m))
(cl:defmethod max_joy_velocity-val ((m <MaxJoyVelocity-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:max_joy_velocity-val is deprecated.  Use cola2_msgs-srv:max_joy_velocity instead.")
  (max_joy_velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MaxJoyVelocity-request>) ostream)
  "Serializes a message object of type '<MaxJoyVelocity-request>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'max_joy_velocity))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MaxJoyVelocity-request>) istream)
  "Deserializes a message object of type '<MaxJoyVelocity-request>"
  (cl:setf (cl:slot-value msg 'max_joy_velocity) (cl:make-array 6))
  (cl:let ((vals (cl:slot-value msg 'max_joy_velocity)))
    (cl:dotimes (i 6)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MaxJoyVelocity-request>)))
  "Returns string type for a service object of type '<MaxJoyVelocity-request>"
  "cola2_msgs/MaxJoyVelocityRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MaxJoyVelocity-request)))
  "Returns string type for a service object of type 'MaxJoyVelocity-request"
  "cola2_msgs/MaxJoyVelocityRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MaxJoyVelocity-request>)))
  "Returns md5sum for a message object of type '<MaxJoyVelocity-request>"
  "65b63e684f31e94916e054c6a4a1b57f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MaxJoyVelocity-request)))
  "Returns md5sum for a message object of type 'MaxJoyVelocity-request"
  "65b63e684f31e94916e054c6a4a1b57f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MaxJoyVelocity-request>)))
  "Returns full string definition for message of type '<MaxJoyVelocity-request>"
  (cl:format cl:nil "float64[6] max_joy_velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MaxJoyVelocity-request)))
  "Returns full string definition for message of type 'MaxJoyVelocity-request"
  (cl:format cl:nil "float64[6] max_joy_velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MaxJoyVelocity-request>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'max_joy_velocity) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MaxJoyVelocity-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MaxJoyVelocity-request
    (cl:cons ':max_joy_velocity (max_joy_velocity msg))
))
;//! \htmlinclude MaxJoyVelocity-response.msg.html

(cl:defclass <MaxJoyVelocity-response> (roslisp-msg-protocol:ros-message)
  ((attempted
    :reader attempted
    :initarg :attempted
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MaxJoyVelocity-response (<MaxJoyVelocity-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MaxJoyVelocity-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MaxJoyVelocity-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cola2_msgs-srv:<MaxJoyVelocity-response> is deprecated: use cola2_msgs-srv:MaxJoyVelocity-response instead.")))

(cl:ensure-generic-function 'attempted-val :lambda-list '(m))
(cl:defmethod attempted-val ((m <MaxJoyVelocity-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:attempted-val is deprecated.  Use cola2_msgs-srv:attempted instead.")
  (attempted m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MaxJoyVelocity-response>) ostream)
  "Serializes a message object of type '<MaxJoyVelocity-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'attempted) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MaxJoyVelocity-response>) istream)
  "Deserializes a message object of type '<MaxJoyVelocity-response>"
    (cl:setf (cl:slot-value msg 'attempted) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MaxJoyVelocity-response>)))
  "Returns string type for a service object of type '<MaxJoyVelocity-response>"
  "cola2_msgs/MaxJoyVelocityResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MaxJoyVelocity-response)))
  "Returns string type for a service object of type 'MaxJoyVelocity-response"
  "cola2_msgs/MaxJoyVelocityResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MaxJoyVelocity-response>)))
  "Returns md5sum for a message object of type '<MaxJoyVelocity-response>"
  "65b63e684f31e94916e054c6a4a1b57f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MaxJoyVelocity-response)))
  "Returns md5sum for a message object of type 'MaxJoyVelocity-response"
  "65b63e684f31e94916e054c6a4a1b57f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MaxJoyVelocity-response>)))
  "Returns full string definition for message of type '<MaxJoyVelocity-response>"
  (cl:format cl:nil "bool attempted~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MaxJoyVelocity-response)))
  "Returns full string definition for message of type 'MaxJoyVelocity-response"
  (cl:format cl:nil "bool attempted~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MaxJoyVelocity-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MaxJoyVelocity-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MaxJoyVelocity-response
    (cl:cons ':attempted (attempted msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MaxJoyVelocity)))
  'MaxJoyVelocity-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MaxJoyVelocity)))
  'MaxJoyVelocity-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MaxJoyVelocity)))
  "Returns string type for a service object of type '<MaxJoyVelocity>"
  "cola2_msgs/MaxJoyVelocity")