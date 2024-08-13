; Auto-generated. Do not edit!


(cl:in-package cola2_msgs-msg)


;//! \htmlinclude BodyVelocityReq.msg.html

(cl:defclass <BodyVelocityReq> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (goal
    :reader goal
    :initarg :goal
    :type cola2_msgs-msg:GoalDescriptor
    :initform (cl:make-instance 'cola2_msgs-msg:GoalDescriptor))
   (twist
    :reader twist
    :initarg :twist
    :type geometry_msgs-msg:Twist
    :initform (cl:make-instance 'geometry_msgs-msg:Twist))
   (disable_axis
    :reader disable_axis
    :initarg :disable_axis
    :type cola2_msgs-msg:Bool6Axis
    :initform (cl:make-instance 'cola2_msgs-msg:Bool6Axis)))
)

(cl:defclass BodyVelocityReq (<BodyVelocityReq>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BodyVelocityReq>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BodyVelocityReq)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cola2_msgs-msg:<BodyVelocityReq> is deprecated: use cola2_msgs-msg:BodyVelocityReq instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BodyVelocityReq>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:header-val is deprecated.  Use cola2_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <BodyVelocityReq>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:goal-val is deprecated.  Use cola2_msgs-msg:goal instead.")
  (goal m))

(cl:ensure-generic-function 'twist-val :lambda-list '(m))
(cl:defmethod twist-val ((m <BodyVelocityReq>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:twist-val is deprecated.  Use cola2_msgs-msg:twist instead.")
  (twist m))

(cl:ensure-generic-function 'disable_axis-val :lambda-list '(m))
(cl:defmethod disable_axis-val ((m <BodyVelocityReq>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:disable_axis-val is deprecated.  Use cola2_msgs-msg:disable_axis instead.")
  (disable_axis m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BodyVelocityReq>) ostream)
  "Serializes a message object of type '<BodyVelocityReq>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'twist) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'disable_axis) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BodyVelocityReq>) istream)
  "Deserializes a message object of type '<BodyVelocityReq>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'twist) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'disable_axis) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BodyVelocityReq>)))
  "Returns string type for a message object of type '<BodyVelocityReq>"
  "cola2_msgs/BodyVelocityReq")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BodyVelocityReq)))
  "Returns string type for a message object of type 'BodyVelocityReq"
  "cola2_msgs/BodyVelocityReq")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BodyVelocityReq>)))
  "Returns md5sum for a message object of type '<BodyVelocityReq>"
  "f11942093cf1f61d6ba11201f06ff750")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BodyVelocityReq)))
  "Returns md5sum for a message object of type 'BodyVelocityReq"
  "f11942093cf1f61d6ba11201f06ff750")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BodyVelocityReq>)))
  "Returns full string definition for message of type '<BodyVelocityReq>"
  (cl:format cl:nil "# Body frame vehicle velocity request.~%# Coordinate units are metres/sec and radians/sec.~%# NB: Coordinate frame used is ROS standard [forward, left, up],~%# to simplify integration with arm control systems.~%~%# header.frame_id should be set to the base_link frame of the vehicle.~%Header header~%~%GoalDescriptor goal~%~%geometry_msgs/Twist twist~%~%# Axes of control to disable, in body frame.~%Bool6Axis disable_axis~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: cola2_msgs/GoalDescriptor~%# Contains values common to all waypoint request and status messages.~%# Waypoint goals with higher priority trump lower priority goals. For~%# goals of the same priority, the pilot should follow the latest~%# received.~%~%# Name of the requesting node, used with id to identify the request.~%string requester~%~%uint32 priority~%~%# PRIORITY DEFINITIONS~%uint32 PRIORITY_TELEOPERATION_LOW = 0~%uint32 PRIORITY_SAFETY_LOW = 5~%uint32 PRIORITY_NORMAL = 10~%uint32 PRIORITY_SAFETY = 30~%uint32 PRIORITY_TELEOPERATION = 40~%uint32 PRIORITY_SAFETY_HIGH  = 50~%uint32 PRIORITY_TELEOPERATION_HIGH = 60~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: cola2_msgs/Bool6Axis~%bool x~%bool y~%bool z~%bool roll~%bool pitch~%bool yaw~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BodyVelocityReq)))
  "Returns full string definition for message of type 'BodyVelocityReq"
  (cl:format cl:nil "# Body frame vehicle velocity request.~%# Coordinate units are metres/sec and radians/sec.~%# NB: Coordinate frame used is ROS standard [forward, left, up],~%# to simplify integration with arm control systems.~%~%# header.frame_id should be set to the base_link frame of the vehicle.~%Header header~%~%GoalDescriptor goal~%~%geometry_msgs/Twist twist~%~%# Axes of control to disable, in body frame.~%Bool6Axis disable_axis~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: cola2_msgs/GoalDescriptor~%# Contains values common to all waypoint request and status messages.~%# Waypoint goals with higher priority trump lower priority goals. For~%# goals of the same priority, the pilot should follow the latest~%# received.~%~%# Name of the requesting node, used with id to identify the request.~%string requester~%~%uint32 priority~%~%# PRIORITY DEFINITIONS~%uint32 PRIORITY_TELEOPERATION_LOW = 0~%uint32 PRIORITY_SAFETY_LOW = 5~%uint32 PRIORITY_NORMAL = 10~%uint32 PRIORITY_SAFETY = 30~%uint32 PRIORITY_TELEOPERATION = 40~%uint32 PRIORITY_SAFETY_HIGH  = 50~%uint32 PRIORITY_TELEOPERATION_HIGH = 60~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: cola2_msgs/Bool6Axis~%bool x~%bool y~%bool z~%bool roll~%bool pitch~%bool yaw~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BodyVelocityReq>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'twist))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'disable_axis))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BodyVelocityReq>))
  "Converts a ROS message object to a list"
  (cl:list 'BodyVelocityReq
    (cl:cons ':header (header msg))
    (cl:cons ':goal (goal msg))
    (cl:cons ':twist (twist msg))
    (cl:cons ':disable_axis (disable_axis msg))
))
