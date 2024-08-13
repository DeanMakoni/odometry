; Auto-generated. Do not edit!


(cl:in-package cola2_msgs-srv)


;//! \htmlinclude Goto-request.msg.html

(cl:defclass <Goto-request> (roslisp-msg-protocol:ros-message)
  ((final_x
    :reader final_x
    :initarg :final_x
    :type cl:float
    :initform 0.0)
   (final_y
    :reader final_y
    :initarg :final_y
    :type cl:float
    :initform 0.0)
   (final_depth
    :reader final_depth
    :initarg :final_depth
    :type cl:float
    :initform 0.0)
   (final_altitude
    :reader final_altitude
    :initarg :final_altitude
    :type cl:float
    :initform 0.0)
   (reference
    :reader reference
    :initarg :reference
    :type cl:fixnum
    :initform 0)
   (heave_mode
    :reader heave_mode
    :initarg :heave_mode
    :type cl:integer
    :initform 0)
   (surge_velocity
    :reader surge_velocity
    :initarg :surge_velocity
    :type cl:float
    :initform 0.0)
   (tolerance_xy
    :reader tolerance_xy
    :initarg :tolerance_xy
    :type cl:float
    :initform 0.0)
   (timeout
    :reader timeout
    :initarg :timeout
    :type cl:float
    :initform 0.0)
   (no_altitude_goes_up
    :reader no_altitude_goes_up
    :initarg :no_altitude_goes_up
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Goto-request (<Goto-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Goto-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Goto-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cola2_msgs-srv:<Goto-request> is deprecated: use cola2_msgs-srv:Goto-request instead.")))

(cl:ensure-generic-function 'final_x-val :lambda-list '(m))
(cl:defmethod final_x-val ((m <Goto-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:final_x-val is deprecated.  Use cola2_msgs-srv:final_x instead.")
  (final_x m))

(cl:ensure-generic-function 'final_y-val :lambda-list '(m))
(cl:defmethod final_y-val ((m <Goto-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:final_y-val is deprecated.  Use cola2_msgs-srv:final_y instead.")
  (final_y m))

(cl:ensure-generic-function 'final_depth-val :lambda-list '(m))
(cl:defmethod final_depth-val ((m <Goto-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:final_depth-val is deprecated.  Use cola2_msgs-srv:final_depth instead.")
  (final_depth m))

(cl:ensure-generic-function 'final_altitude-val :lambda-list '(m))
(cl:defmethod final_altitude-val ((m <Goto-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:final_altitude-val is deprecated.  Use cola2_msgs-srv:final_altitude instead.")
  (final_altitude m))

(cl:ensure-generic-function 'reference-val :lambda-list '(m))
(cl:defmethod reference-val ((m <Goto-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:reference-val is deprecated.  Use cola2_msgs-srv:reference instead.")
  (reference m))

(cl:ensure-generic-function 'heave_mode-val :lambda-list '(m))
(cl:defmethod heave_mode-val ((m <Goto-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:heave_mode-val is deprecated.  Use cola2_msgs-srv:heave_mode instead.")
  (heave_mode m))

(cl:ensure-generic-function 'surge_velocity-val :lambda-list '(m))
(cl:defmethod surge_velocity-val ((m <Goto-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:surge_velocity-val is deprecated.  Use cola2_msgs-srv:surge_velocity instead.")
  (surge_velocity m))

(cl:ensure-generic-function 'tolerance_xy-val :lambda-list '(m))
(cl:defmethod tolerance_xy-val ((m <Goto-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:tolerance_xy-val is deprecated.  Use cola2_msgs-srv:tolerance_xy instead.")
  (tolerance_xy m))

(cl:ensure-generic-function 'timeout-val :lambda-list '(m))
(cl:defmethod timeout-val ((m <Goto-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:timeout-val is deprecated.  Use cola2_msgs-srv:timeout instead.")
  (timeout m))

(cl:ensure-generic-function 'no_altitude_goes_up-val :lambda-list '(m))
(cl:defmethod no_altitude_goes_up-val ((m <Goto-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:no_altitude_goes_up-val is deprecated.  Use cola2_msgs-srv:no_altitude_goes_up instead.")
  (no_altitude_goes_up m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Goto-request>)))
    "Constants for message type '<Goto-request>"
  '((:NED . 0)
    (:GLOBAL . 1)
    (:DEPTH . 0)
    (:ALTITUDE . 1)
    (:BOTH . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Goto-request)))
    "Constants for message type 'Goto-request"
  '((:NED . 0)
    (:GLOBAL . 1)
    (:DEPTH . 0)
    (:ALTITUDE . 1)
    (:BOTH . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Goto-request>) ostream)
  "Serializes a message object of type '<Goto-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'final_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'final_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'final_depth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'final_altitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'reference)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'heave_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'heave_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'heave_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'heave_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'heave_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'heave_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'heave_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'heave_mode)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'surge_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'tolerance_xy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'timeout))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'no_altitude_goes_up) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Goto-request>) istream)
  "Deserializes a message object of type '<Goto-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'final_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'final_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'final_depth) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'final_altitude) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'reference)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'heave_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'heave_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'heave_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'heave_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'heave_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'heave_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'heave_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'heave_mode)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'surge_velocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tolerance_xy) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'timeout) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'no_altitude_goes_up) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Goto-request>)))
  "Returns string type for a service object of type '<Goto-request>"
  "cola2_msgs/GotoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Goto-request)))
  "Returns string type for a service object of type 'Goto-request"
  "cola2_msgs/GotoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Goto-request>)))
  "Returns md5sum for a message object of type '<Goto-request>"
  "d7ca42db7492724e2ad137e654c018a7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Goto-request)))
  "Returns md5sum for a message object of type 'Goto-request"
  "d7ca42db7492724e2ad137e654c018a7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Goto-request>)))
  "Returns full string definition for message of type '<Goto-request>"
  (cl:format cl:nil "# Final state~%float64 final_x~%float64 final_y~%float64 final_depth~%float64 final_altitude~%~%# Reference frame for both the inital and final positions~%uint8 NED=0~%uint8 GLOBAL=1~%uint8 reference~%~%# Heave mode~%uint64 heave_mode~%uint64 DEPTH=0~%uint64 ALTITUDE=1~%uint64 BOTH=2~%~%# Surge velocity~%float64 surge_velocity~%~%# Tolerance~%float64 tolerance_xy~%~%# Timeout~%float64 timeout~%~%# No altitude reactive behavior~%bool no_altitude_goes_up~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Goto-request)))
  "Returns full string definition for message of type 'Goto-request"
  (cl:format cl:nil "# Final state~%float64 final_x~%float64 final_y~%float64 final_depth~%float64 final_altitude~%~%# Reference frame for both the inital and final positions~%uint8 NED=0~%uint8 GLOBAL=1~%uint8 reference~%~%# Heave mode~%uint64 heave_mode~%uint64 DEPTH=0~%uint64 ALTITUDE=1~%uint64 BOTH=2~%~%# Surge velocity~%float64 surge_velocity~%~%# Tolerance~%float64 tolerance_xy~%~%# Timeout~%float64 timeout~%~%# No altitude reactive behavior~%bool no_altitude_goes_up~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Goto-request>))
  (cl:+ 0
     8
     8
     8
     8
     1
     8
     8
     8
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Goto-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Goto-request
    (cl:cons ':final_x (final_x msg))
    (cl:cons ':final_y (final_y msg))
    (cl:cons ':final_depth (final_depth msg))
    (cl:cons ':final_altitude (final_altitude msg))
    (cl:cons ':reference (reference msg))
    (cl:cons ':heave_mode (heave_mode msg))
    (cl:cons ':surge_velocity (surge_velocity msg))
    (cl:cons ':tolerance_xy (tolerance_xy msg))
    (cl:cons ':timeout (timeout msg))
    (cl:cons ':no_altitude_goes_up (no_altitude_goes_up msg))
))
;//! \htmlinclude Goto-response.msg.html

(cl:defclass <Goto-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass Goto-response (<Goto-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Goto-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Goto-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cola2_msgs-srv:<Goto-response> is deprecated: use cola2_msgs-srv:Goto-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Goto-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:success-val is deprecated.  Use cola2_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <Goto-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cola2_msgs-srv:message-val is deprecated.  Use cola2_msgs-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Goto-response>) ostream)
  "Serializes a message object of type '<Goto-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Goto-response>) istream)
  "Deserializes a message object of type '<Goto-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Goto-response>)))
  "Returns string type for a service object of type '<Goto-response>"
  "cola2_msgs/GotoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Goto-response)))
  "Returns string type for a service object of type 'Goto-response"
  "cola2_msgs/GotoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Goto-response>)))
  "Returns md5sum for a message object of type '<Goto-response>"
  "d7ca42db7492724e2ad137e654c018a7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Goto-response)))
  "Returns md5sum for a message object of type 'Goto-response"
  "d7ca42db7492724e2ad137e654c018a7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Goto-response>)))
  "Returns full string definition for message of type '<Goto-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Goto-response)))
  "Returns full string definition for message of type 'Goto-response"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Goto-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Goto-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Goto-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Goto)))
  'Goto-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Goto)))
  'Goto-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Goto)))
  "Returns string type for a service object of type '<Goto>"
  "cola2_msgs/Goto")