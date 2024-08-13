; Auto-generated. Do not edit!


(cl:in-package cola2_msgs-msg)


;//! \htmlinclude PilotFeedback.msg.html

(cl:defclass <PilotFeedback> (roslisp-msg-protocol:ros-message)
  ((distance_to_end
    :reader distance_to_end
    :initarg :distance_to_end
    :type cl:float
    :initform 0.0)
   (cross_track_error
    :reader cross_track_error
    :initarg :cross_track_error
    :type cl:float
    :initform 0.0))
)

(cl:defclass PilotFeedback (<PilotFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PilotFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PilotFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cola2_msgs-msg:<PilotFeedback> is deprecated: use cola2_msgs-msg:PilotFeedback instead.")))

(cl:ensure-generic-function 'distance_to_end-val :lambda-list '(m))
(cl:defmethod distance_to_end-val ((m <PilotFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:distance_to_end-val is deprecated.  Use cola2_msgs-msg:distance_to_end instead.")
  (distance_to_end m))

(cl:ensure-generic-function 'cross_track_error-val :lambda-list '(m))
(cl:defmethod cross_track_error-val ((m <PilotFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:cross_track_error-val is deprecated.  Use cola2_msgs-msg:cross_track_error instead.")
  (cross_track_error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PilotFeedback>) ostream)
  "Serializes a message object of type '<PilotFeedback>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'distance_to_end))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'cross_track_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PilotFeedback>) istream)
  "Deserializes a message object of type '<PilotFeedback>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance_to_end) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cross_track_error) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PilotFeedback>)))
  "Returns string type for a message object of type '<PilotFeedback>"
  "cola2_msgs/PilotFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PilotFeedback)))
  "Returns string type for a message object of type 'PilotFeedback"
  "cola2_msgs/PilotFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PilotFeedback>)))
  "Returns md5sum for a message object of type '<PilotFeedback>"
  "d59c9d2fe125e9dbd3a7afe6b7739fc4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PilotFeedback)))
  "Returns md5sum for a message object of type 'PilotFeedback"
  "d59c9d2fe125e9dbd3a7afe6b7739fc4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PilotFeedback>)))
  "Returns full string definition for message of type '<PilotFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define a FEEDBACK~%~%# Errors~%float64 distance_to_end~%float64 cross_track_error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PilotFeedback)))
  "Returns full string definition for message of type 'PilotFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define a FEEDBACK~%~%# Errors~%float64 distance_to_end~%float64 cross_track_error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PilotFeedback>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PilotFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'PilotFeedback
    (cl:cons ':distance_to_end (distance_to_end msg))
    (cl:cons ':cross_track_error (cross_track_error msg))
))
