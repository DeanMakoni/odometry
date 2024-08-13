; Auto-generated. Do not edit!


(cl:in-package cola2_msgs-srv)


;//! \htmlinclude Recovery-request.msg.html

(cl:defclass <Recovery-request> (roslisp-msg-protocol:ros-message)
  ((requested_action
    :reader requested_action
    :initarg :requested_action
    :type cola2_msgs-msg:RecoveryAction
    :initform (cl:make-instance 'cola2_msgs-msg:RecoveryAction)))
)

(cl:defclass Recovery-request (<Recovery-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Recovery-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Recovery-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cola2_msgs-srv:<Recovery-request> is deprecated: use cola2_msgs-srv:Recovery-request instead.")))

(cl:ensure-generic-function 'requested_action-val :lambda-list '(m))
(cl:defmethod requested_action-val ((m <Recovery-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:requested_action-val is deprecated.  Use cola2_msgs-srv:requested_action instead.")
  (requested_action m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Recovery-request>) ostream)
  "Serializes a message object of type '<Recovery-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'requested_action) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Recovery-request>) istream)
  "Deserializes a message object of type '<Recovery-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'requested_action) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Recovery-request>)))
  "Returns string type for a service object of type '<Recovery-request>"
  "cola2_msgs/RecoveryRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Recovery-request)))
  "Returns string type for a service object of type 'Recovery-request"
  "cola2_msgs/RecoveryRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Recovery-request>)))
  "Returns md5sum for a message object of type '<Recovery-request>"
  "44dc867ef177deea4414ea94077e9b72")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Recovery-request)))
  "Returns md5sum for a message object of type 'Recovery-request"
  "44dc867ef177deea4414ea94077e9b72")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Recovery-request>)))
  "Returns full string definition for message of type '<Recovery-request>"
  (cl:format cl:nil "cola2_msgs/RecoveryAction requested_action~%~%================================================================================~%MSG: cola2_msgs/RecoveryAction~%# Error level~%uint16 NONE = 0~%uint16 INFORMATIVE = 1~%uint16 ABORT = 2~%uint16 ABORT_AND_SURFACE = 3~%uint16 EMERGENCY_SURFACE = 4~%uint16 DROP_WEIGHT = 5~%~%Header header~%uint16 error_level~%string error_string~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Recovery-request)))
  "Returns full string definition for message of type 'Recovery-request"
  (cl:format cl:nil "cola2_msgs/RecoveryAction requested_action~%~%================================================================================~%MSG: cola2_msgs/RecoveryAction~%# Error level~%uint16 NONE = 0~%uint16 INFORMATIVE = 1~%uint16 ABORT = 2~%uint16 ABORT_AND_SURFACE = 3~%uint16 EMERGENCY_SURFACE = 4~%uint16 DROP_WEIGHT = 5~%~%Header header~%uint16 error_level~%string error_string~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Recovery-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'requested_action))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Recovery-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Recovery-request
    (cl:cons ':requested_action (requested_action msg))
))
;//! \htmlinclude Recovery-response.msg.html

(cl:defclass <Recovery-response> (roslisp-msg-protocol:ros-message)
  ((attempted
    :reader attempted
    :initarg :attempted
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Recovery-response (<Recovery-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Recovery-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Recovery-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cola2_msgs-srv:<Recovery-response> is deprecated: use cola2_msgs-srv:Recovery-response instead.")))

(cl:ensure-generic-function 'attempted-val :lambda-list '(m))
(cl:defmethod attempted-val ((m <Recovery-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:attempted-val is deprecated.  Use cola2_msgs-srv:attempted instead.")
  (attempted m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Recovery-response>) ostream)
  "Serializes a message object of type '<Recovery-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'attempted) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Recovery-response>) istream)
  "Deserializes a message object of type '<Recovery-response>"
    (cl:setf (cl:slot-value msg 'attempted) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Recovery-response>)))
  "Returns string type for a service object of type '<Recovery-response>"
  "cola2_msgs/RecoveryResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Recovery-response)))
  "Returns string type for a service object of type 'Recovery-response"
  "cola2_msgs/RecoveryResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Recovery-response>)))
  "Returns md5sum for a message object of type '<Recovery-response>"
  "44dc867ef177deea4414ea94077e9b72")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Recovery-response)))
  "Returns md5sum for a message object of type 'Recovery-response"
  "44dc867ef177deea4414ea94077e9b72")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Recovery-response>)))
  "Returns full string definition for message of type '<Recovery-response>"
  (cl:format cl:nil "bool attempted~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Recovery-response)))
  "Returns full string definition for message of type 'Recovery-response"
  (cl:format cl:nil "bool attempted~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Recovery-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Recovery-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Recovery-response
    (cl:cons ':attempted (attempted msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Recovery)))
  'Recovery-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Recovery)))
  'Recovery-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Recovery)))
  "Returns string type for a service object of type '<Recovery>"
  "cola2_msgs/Recovery")