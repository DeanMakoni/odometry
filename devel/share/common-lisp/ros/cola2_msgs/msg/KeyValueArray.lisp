; Auto-generated. Do not edit!


(cl:in-package cola2_msgs-msg)


;//! \htmlinclude KeyValueArray.msg.html

(cl:defclass <KeyValueArray> (roslisp-msg-protocol:ros-message)
  ((keyvalues
    :reader keyvalues
    :initarg :keyvalues
    :type (cl:vector cola2_msgs-msg:KeyValue)
   :initform (cl:make-array 0 :element-type 'cola2_msgs-msg:KeyValue :initial-element (cl:make-instance 'cola2_msgs-msg:KeyValue))))
)

(cl:defclass KeyValueArray (<KeyValueArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <KeyValueArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'KeyValueArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cola2_msgs-msg:<KeyValueArray> is deprecated: use cola2_msgs-msg:KeyValueArray instead.")))

(cl:ensure-generic-function 'keyvalues-val :lambda-list '(m))
(cl:defmethod keyvalues-val ((m <KeyValueArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-msg:keyvalues-val is deprecated.  Use cola2_msgs-msg:keyvalues instead.")
  (keyvalues m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <KeyValueArray>) ostream)
  "Serializes a message object of type '<KeyValueArray>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'keyvalues))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'keyvalues))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <KeyValueArray>) istream)
  "Deserializes a message object of type '<KeyValueArray>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<KeyValueArray>)))
  "Returns string type for a message object of type '<KeyValueArray>"
  "cola2_msgs/KeyValueArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'KeyValueArray)))
  "Returns string type for a message object of type 'KeyValueArray"
  "cola2_msgs/KeyValueArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<KeyValueArray>)))
  "Returns md5sum for a message object of type '<KeyValueArray>"
  "e6aed4084986fd7ac11d4023a138269c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'KeyValueArray)))
  "Returns md5sum for a message object of type 'KeyValueArray"
  "e6aed4084986fd7ac11d4023a138269c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<KeyValueArray>)))
  "Returns full string definition for message of type '<KeyValueArray>"
  (cl:format cl:nil "cola2_msgs/KeyValue[] keyvalues~%~%================================================================================~%MSG: cola2_msgs/KeyValue~%string key~%string value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'KeyValueArray)))
  "Returns full string definition for message of type 'KeyValueArray"
  (cl:format cl:nil "cola2_msgs/KeyValue[] keyvalues~%~%================================================================================~%MSG: cola2_msgs/KeyValue~%string key~%string value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <KeyValueArray>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'keyvalues) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <KeyValueArray>))
  "Converts a ROS message object to a list"
  (cl:list 'KeyValueArray
    (cl:cons ':keyvalues (keyvalues msg))
))
