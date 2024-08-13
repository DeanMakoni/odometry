;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::Goto)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'Goto (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::GOTO")
  (make-package "COLA2_MSGS::GOTO"))
(unless (find-package "COLA2_MSGS::GOTOREQUEST")
  (make-package "COLA2_MSGS::GOTOREQUEST"))
(unless (find-package "COLA2_MSGS::GOTORESPONSE")
  (make-package "COLA2_MSGS::GOTORESPONSE"))

(in-package "ROS")





(intern "*NED*" (find-package "COLA2_MSGS::GOTOREQUEST"))
(shadow '*NED* (find-package "COLA2_MSGS::GOTOREQUEST"))
(defconstant cola2_msgs::GotoRequest::*NED* 0)
(intern "*GLOBAL*" (find-package "COLA2_MSGS::GOTOREQUEST"))
(shadow '*GLOBAL* (find-package "COLA2_MSGS::GOTOREQUEST"))
(defconstant cola2_msgs::GotoRequest::*GLOBAL* 1)
(intern "*DEPTH*" (find-package "COLA2_MSGS::GOTOREQUEST"))
(shadow '*DEPTH* (find-package "COLA2_MSGS::GOTOREQUEST"))
(defconstant cola2_msgs::GotoRequest::*DEPTH* 0)
(intern "*ALTITUDE*" (find-package "COLA2_MSGS::GOTOREQUEST"))
(shadow '*ALTITUDE* (find-package "COLA2_MSGS::GOTOREQUEST"))
(defconstant cola2_msgs::GotoRequest::*ALTITUDE* 1)
(intern "*BOTH*" (find-package "COLA2_MSGS::GOTOREQUEST"))
(shadow '*BOTH* (find-package "COLA2_MSGS::GOTOREQUEST"))
(defconstant cola2_msgs::GotoRequest::*BOTH* 2)

(defun cola2_msgs::GotoRequest-to-symbol (const)
  (cond
        ((= const 0) 'cola2_msgs::GotoRequest::*NED*)
        ((= const 1) 'cola2_msgs::GotoRequest::*GLOBAL*)
        ((= const 0) 'cola2_msgs::GotoRequest::*DEPTH*)
        ((= const 1) 'cola2_msgs::GotoRequest::*ALTITUDE*)
        ((= const 2) 'cola2_msgs::GotoRequest::*BOTH*)
        (t nil)))

(defclass cola2_msgs::GotoRequest
  :super ros::object
  :slots (_final_x _final_y _final_depth _final_altitude _reference _heave_mode _surge_velocity _tolerance_xy _timeout _no_altitude_goes_up ))

(defmethod cola2_msgs::GotoRequest
  (:init
   (&key
    ((:final_x __final_x) 0.0)
    ((:final_y __final_y) 0.0)
    ((:final_depth __final_depth) 0.0)
    ((:final_altitude __final_altitude) 0.0)
    ((:reference __reference) 0)
    ((:heave_mode __heave_mode) 0)
    ((:surge_velocity __surge_velocity) 0.0)
    ((:tolerance_xy __tolerance_xy) 0.0)
    ((:timeout __timeout) 0.0)
    ((:no_altitude_goes_up __no_altitude_goes_up) nil)
    )
   (send-super :init)
   (setq _final_x (float __final_x))
   (setq _final_y (float __final_y))
   (setq _final_depth (float __final_depth))
   (setq _final_altitude (float __final_altitude))
   (setq _reference (round __reference))
   (setq _heave_mode (round __heave_mode))
   (setq _surge_velocity (float __surge_velocity))
   (setq _tolerance_xy (float __tolerance_xy))
   (setq _timeout (float __timeout))
   (setq _no_altitude_goes_up __no_altitude_goes_up)
   self)
  (:final_x
   (&optional __final_x)
   (if __final_x (setq _final_x __final_x)) _final_x)
  (:final_y
   (&optional __final_y)
   (if __final_y (setq _final_y __final_y)) _final_y)
  (:final_depth
   (&optional __final_depth)
   (if __final_depth (setq _final_depth __final_depth)) _final_depth)
  (:final_altitude
   (&optional __final_altitude)
   (if __final_altitude (setq _final_altitude __final_altitude)) _final_altitude)
  (:reference
   (&optional __reference)
   (if __reference (setq _reference __reference)) _reference)
  (:heave_mode
   (&optional __heave_mode)
   (if __heave_mode (setq _heave_mode __heave_mode)) _heave_mode)
  (:surge_velocity
   (&optional __surge_velocity)
   (if __surge_velocity (setq _surge_velocity __surge_velocity)) _surge_velocity)
  (:tolerance_xy
   (&optional __tolerance_xy)
   (if __tolerance_xy (setq _tolerance_xy __tolerance_xy)) _tolerance_xy)
  (:timeout
   (&optional __timeout)
   (if __timeout (setq _timeout __timeout)) _timeout)
  (:no_altitude_goes_up
   (&optional (__no_altitude_goes_up :null))
   (if (not (eq __no_altitude_goes_up :null)) (setq _no_altitude_goes_up __no_altitude_goes_up)) _no_altitude_goes_up)
  (:serialization-length
   ()
   (+
    ;; float64 _final_x
    8
    ;; float64 _final_y
    8
    ;; float64 _final_depth
    8
    ;; float64 _final_altitude
    8
    ;; uint8 _reference
    1
    ;; uint64 _heave_mode
    8
    ;; float64 _surge_velocity
    8
    ;; float64 _tolerance_xy
    8
    ;; float64 _timeout
    8
    ;; bool _no_altitude_goes_up
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _final_x
       (sys::poke _final_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _final_y
       (sys::poke _final_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _final_depth
       (sys::poke _final_depth (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _final_altitude
       (sys::poke _final_altitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _reference
       (write-byte _reference s)
     ;; uint64 _heave_mode
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _heave_mode (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _heave_mode) (= (length (_heave_mode . bv)) 2)) ;; bignum
              (write-long (ash (elt (_heave_mode . bv) 0) 0) s)
              (write-long (ash (elt (_heave_mode . bv) 1) -1) s))
             ((and (class _heave_mode) (= (length (_heave_mode . bv)) 1)) ;; big1
              (write-long (elt (_heave_mode . bv) 0) s)
              (write-long (if (>= _heave_mode 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _heave_mode s)(write-long (if (>= _heave_mode 0) 0 #xffffffff) s)))
     ;; float64 _surge_velocity
       (sys::poke _surge_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _tolerance_xy
       (sys::poke _tolerance_xy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _timeout
       (sys::poke _timeout (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _no_altitude_goes_up
       (if _no_altitude_goes_up (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _final_x
     (setq _final_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _final_y
     (setq _final_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _final_depth
     (setq _final_depth (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _final_altitude
     (setq _final_altitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _reference
     (setq _reference (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint64 _heave_mode
     
#+(or :alpha :irix6 :x86_64)
      (setf _heave_mode (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _heave_mode (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _surge_velocity
     (setq _surge_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _tolerance_xy
     (setq _tolerance_xy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _timeout
     (setq _timeout (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _no_altitude_goes_up
     (setq _no_altitude_goes_up (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass cola2_msgs::GotoResponse
  :super ros::object
  :slots (_success _message ))

(defmethod cola2_msgs::GotoResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass cola2_msgs::Goto
  :super ros::object
  :slots ())

(setf (get cola2_msgs::Goto :md5sum-) "d7ca42db7492724e2ad137e654c018a7")
(setf (get cola2_msgs::Goto :datatype-) "cola2_msgs/Goto")
(setf (get cola2_msgs::Goto :request) cola2_msgs::GotoRequest)
(setf (get cola2_msgs::Goto :response) cola2_msgs::GotoResponse)

(defmethod cola2_msgs::GotoRequest
  (:response () (instance cola2_msgs::GotoResponse :init)))

(setf (get cola2_msgs::GotoRequest :md5sum-) "d7ca42db7492724e2ad137e654c018a7")
(setf (get cola2_msgs::GotoRequest :datatype-) "cola2_msgs/GotoRequest")
(setf (get cola2_msgs::GotoRequest :definition-)
      "# Final state
float64 final_x
float64 final_y
float64 final_depth
float64 final_altitude

# Reference frame for both the inital and final positions
uint8 NED=0
uint8 GLOBAL=1
uint8 reference

# Heave mode
uint64 heave_mode
uint64 DEPTH=0
uint64 ALTITUDE=1
uint64 BOTH=2

# Surge velocity
float64 surge_velocity

# Tolerance
float64 tolerance_xy

# Timeout
float64 timeout

# No altitude reactive behavior
bool no_altitude_goes_up

---
bool success
string message

")

(setf (get cola2_msgs::GotoResponse :md5sum-) "d7ca42db7492724e2ad137e654c018a7")
(setf (get cola2_msgs::GotoResponse :datatype-) "cola2_msgs/GotoResponse")
(setf (get cola2_msgs::GotoResponse :definition-)
      "# Final state
float64 final_x
float64 final_y
float64 final_depth
float64 final_altitude

# Reference frame for both the inital and final positions
uint8 NED=0
uint8 GLOBAL=1
uint8 reference

# Heave mode
uint64 heave_mode
uint64 DEPTH=0
uint64 ALTITUDE=1
uint64 BOTH=2

# Surge velocity
float64 surge_velocity

# Tolerance
float64 tolerance_xy

# Timeout
float64 timeout

# No altitude reactive behavior
bool no_altitude_goes_up

---
bool success
string message

")



(provide :cola2_msgs/Goto "d7ca42db7492724e2ad137e654c018a7")


