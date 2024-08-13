; Auto-generated. Do not edit!


(cl:in-package cola2_msgs-msg)


;//! \htmlinclude CaptainStateFeedback.msg.html

(cl:defclass <CaptainStateFeedback> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (state
    :reader state
    :initarg :state
    :type cl:fixnum
    :initform 0)
   (time_to_finish
    :reader time_to_finish
    :initarg :time_to_finish
    :type cl:float
    :initform 0.0)
   (name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (keyvalues
    :reader keyvalues
    :initarg :keyvalues
    :type (cl:vector cola2_msgs-msg:KeyValue)
   :initform (cl:make-array 0 :element-type 'cola2_msgs-msg:KeyValue :initial-element (cl:make-instance 'cola2_msgs-msg:KeyValue))))
)

(cl:defclass CaptainStateFeedback (<CaptainStateFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CaptainStateFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CaptainStateFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cola2_msgs-msg:<CaptainStateFeedback> is deprecated: use cola2_msgs-msg:CaptainStateFeedback instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <CaptainStateFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:header-val is deprecated.  Use cola2_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <CaptainStateFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:state-val is deprecated.  Use cola2_msgs-msg:state instead.")
  (state m))

(cl:ensure-generic-function 'time_to_finish-val :lambda-list '(m))
(cl:defmethod time_to_finish-val ((m <CaptainStateFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:time_to_finish-val is deprecated.  Use cola2_msgs-msg:time_to_finish instead.")
  (time_to_finish m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <CaptainStateFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:name-val is deprecated.  Use cola2_msgs-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <CaptainStateFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:id-val is deprecated.  Use cola2_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'keyvalues-val :lambda-list '(m))
(cl:defmethod keyvalues-val ((m <CaptainStateFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:keyvalues-val is deprecated.  Use cola2_msgs-msg:keyvalues instead.")
  (keyvalues m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<CaptainStateFeedback>)))
    "Constants for message type '<CaptainStateFeedback>"
  '((:ACTIVE . 0)
    (:SUCCESS . 1)
    (:FAILURE . 2)
    (:STOPPED . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'CaptainStateFeedback)))
    "Constants for message type 'CaptainStateFeedback"
  '((:ACTIVE . 0)
    (:SUCCESS . 1)
    (:FAILURE . 2)
    (:STOPPED . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CaptainStateFeedback>) ostream)
  "Serializes a message object of type '<CaptainStateFeedback>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'state)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'time_to_finish))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'keyvalues))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'keyvalues))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CaptainStateFeedback>) istream)
  "Deserializes a message object of type '<CaptainStateFeedback>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'state)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time_to_finish) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'keyvalues) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'keyvalues)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'cola2_msgs-msg:KeyValue))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CaptainStateFeedback>)))
  "Returns string type for a message object of type '<CaptainStateFeedback>"
  "cola2_msgs/CaptainStateFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CaptainStateFeedback)))
  "Returns string type for a message object of type 'CaptainStateFeedback"
  "cola2_msgs/CaptainStateFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CaptainStateFeedback>)))
  "Returns md5sum for a message object of type '<CaptainStateFeedback>"
  "afefd4ce4fb740bbeb3fade79326e0f7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CaptainStateFeedback)))
  "Returns md5sum for a message object of type 'CaptainStateFeedback"
  "afefd4ce4fb740bbeb3fade79326e0f7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CaptainStateFeedback>)))
  "Returns full string definition for message of type '<CaptainStateFeedback>"
  (cl:format cl:nil "Header header~%~%# State~%uint8 ACTIVE = 0~%uint8 SUCCESS = 1~%uint8 FAILURE = 2~%uint8 STOPPED = 3~%uint8 state~%~%# An estimate of the remaining time~%float64 time_to_finish~%~%# Name of the mode~%string name~%~%# Always increasing id assigned by the captain~%uint16 id~%~%# Extra information as a key-value list~%cola2_msgs/KeyValue[] keyvalues~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: cola2_msgs/KeyValue~%string key~%string value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CaptainStateFeedback)))
  "Returns full string definition for message of type 'CaptainStateFeedback"
  (cl:format cl:nil "Header header~%~%# State~%uint8 ACTIVE = 0~%uint8 SUCCESS = 1~%uint8 FAILURE = 2~%uint8 STOPPED = 3~%uint8 state~%~%# An estimate of the remaining time~%float64 time_to_finish~%~%# Name of the mode~%string name~%~%# Always increasing id assigned by the captain~%uint16 id~%~%# Extra information as a key-value list~%cola2_msgs/KeyValue[] keyvalues~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: cola2_msgs/KeyValue~%string key~%string value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CaptainStateFeedback>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     8
     4 (cl:length (cl:slot-value msg 'name))
     2
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'keyvalues) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CaptainStateFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'CaptainStateFeedback
    (cl:cons ':header (header msg))
    (cl:cons ':state (state msg))
    (cl:cons ':time_to_finish (time_to_finish msg))
    (cl:cons ':name (name msg))
    (cl:cons ':id (id msg))
    (cl:cons ':keyvalues (keyvalues msg))
))
