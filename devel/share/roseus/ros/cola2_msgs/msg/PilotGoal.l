;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::PilotGoal)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'PilotGoal (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::PILOTGOAL")
  (make-package "COLA2_MSGS::PILOTGOAL"))

(in-package "ROS")
;;//! \htmlinclude PilotGoal.msg.html


(intern "*DEPTH*" (find-package "COLA2_MSGS::PILOTGOAL"))
(shadow '*DEPTH* (find-package "COLA2_MSGS::PILOTGOAL"))
(defconstant cola2_msgs::PilotGoal::*DEPTH* 0)
(intern "*ALTITUDE*" (find-package "COLA2_MSGS::PILOTGOAL"))
(shadow '*ALTITUDE* (find-package "COLA2_MSGS::PILOTGOAL"))
(defconstant cola2_msgs::PilotGoal::*ALTITUDE* 1)
(intern "*BOTH*" (find-package "COLA2_MSGS::PILOTGOAL"))
(shadow '*BOTH* (find-package "COLA2_MSGS::PILOTGOAL"))
(defconstant cola2_msgs::PilotGoal::*BOTH* 2)
(intern "*SECTION*" (find-package "COLA2_MSGS::PILOTGOAL"))
(shadow '*SECTION* (find-package "COLA2_MSGS::PILOTGOAL"))
(defconstant cola2_msgs::PilotGoal::*SECTION* 0)
(intern "*ANCHOR*" (find-package "COLA2_MSGS::PILOTGOAL"))
(shadow '*ANCHOR* (find-package "COLA2_MSGS::PILOTGOAL"))
(defconstant cola2_msgs::PilotGoal::*ANCHOR* 1)
(intern "*HOLONOMIC_KEEP_POSITION*" (find-package "COLA2_MSGS::PILOTGOAL"))
(shadow '*HOLONOMIC_KEEP_POSITION* (find-package "COLA2_MSGS::PILOTGOAL"))
(defconstant cola2_msgs::PilotGoal::*HOLONOMIC_KEEP_POSITION* 2)

(defun cola2_msgs::PilotGoal-to-symbol (const)
  (cond
        ((= const 0) 'cola2_msgs::PilotGoal::*DEPTH*)
        ((= const 1) 'cola2_msgs::PilotGoal::*ALTITUDE*)
        ((= const 2) 'cola2_msgs::PilotGoal::*BOTH*)
        ((= const 0) 'cola2_msgs::PilotGoal::*SECTION*)
        ((= const 1) 'cola2_msgs::PilotGoal::*ANCHOR*)
        ((= const 2) 'cola2_msgs::PilotGoal::*HOLONOMIC_KEEP_POSITION*)
        (t nil)))

(defclass cola2_msgs::PilotGoal
  :super ros::object
  :slots (_initial_latitude _initial_longitude _initial_depth _final_latitude _final_longitude _final_depth _final_yaw _final_altitude _heave_mode _surge_velocity _tolerance_xy _timeout _controller_type _goal ))

(defmethod cola2_msgs::PilotGoal
  (:init
   (&key
    ((:initial_latitude __initial_latitude) 0.0)
    ((:initial_longitude __initial_longitude) 0.0)
    ((:initial_depth __initial_depth) 0.0)
    ((:final_latitude __final_latitude) 0.0)
    ((:final_longitude __final_longitude) 0.0)
    ((:final_depth __final_depth) 0.0)
    ((:final_yaw __final_yaw) 0.0)
    ((:final_altitude __final_altitude) 0.0)
    ((:heave_mode __heave_mode) 0)
    ((:surge_velocity __surge_velocity) 0.0)
    ((:tolerance_xy __tolerance_xy) 0.0)
    ((:timeout __timeout) 0.0)
    ((:controller_type __controller_type) 0)
    ((:goal __goal) (instance cola2_msgs::GoalDescriptor :init))
    )
   (send-super :init)
   (setq _initial_latitude (float __initial_latitude))
   (setq _initial_longitude (float __initial_longitude))
   (setq _initial_depth (float __initial_depth))
   (setq _final_latitude (float __final_latitude))
   (setq _final_longitude (float __final_longitude))
   (setq _final_depth (float __final_depth))
   (setq _final_yaw (float __final_yaw))
   (setq _final_altitude (float __final_altitude))
   (setq _heave_mode (round __heave_mode))
   (setq _surge_velocity (float __surge_velocity))
   (setq _tolerance_xy (float __tolerance_xy))
   (setq _timeout (float __timeout))
   (setq _controller_type (round __controller_type))
   (setq _goal __goal)
   self)
  (:initial_latitude
   (&optional __initial_latitude)
   (if __initial_latitude (setq _initial_latitude __initial_latitude)) _initial_latitude)
  (:initial_longitude
   (&optional __initial_longitude)
   (if __initial_longitude (setq _initial_longitude __initial_longitude)) _initial_longitude)
  (:initial_depth
   (&optional __initial_depth)
   (if __initial_depth (setq _initial_depth __initial_depth)) _initial_depth)
  (:final_latitude
   (&optional __final_latitude)
   (if __final_latitude (setq _final_latitude __final_latitude)) _final_latitude)
  (:final_longitude
   (&optional __final_longitude)
   (if __final_longitude (setq _final_longitude __final_longitude)) _final_longitude)
  (:final_depth
   (&optional __final_depth)
   (if __final_depth (setq _final_depth __final_depth)) _final_depth)
  (:final_yaw
   (&optional __final_yaw)
   (if __final_yaw (setq _final_yaw __final_yaw)) _final_yaw)
  (:final_altitude
   (&optional __final_altitude)
   (if __final_altitude (setq _final_altitude __final_altitude)) _final_altitude)
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
  (:controller_type
   (&optional __controller_type)
   (if __controller_type (setq _controller_type __controller_type)) _controller_type)
  (:goal
   (&rest __goal)
   (if (keywordp (car __goal))
       (send* _goal __goal)
     (progn
       (if __goal (setq _goal (car __goal)))
       _goal)))
  (:serialization-length
   ()
   (+
    ;; float64 _initial_latitude
    8
    ;; float64 _initial_longitude
    8
    ;; float64 _initial_depth
    8
    ;; float64 _final_latitude
    8
    ;; float64 _final_longitude
    8
    ;; float64 _final_depth
    8
    ;; float64 _final_yaw
    8
    ;; float64 _final_altitude
    8
    ;; uint64 _heave_mode
    8
    ;; float64 _surge_velocity
    8
    ;; float64 _tolerance_xy
    8
    ;; float64 _timeout
    8
    ;; uint64 _controller_type
    8
    ;; cola2_msgs/GoalDescriptor _goal
    (send _goal :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _initial_latitude
       (sys::poke _initial_latitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _initial_longitude
       (sys::poke _initial_longitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _initial_depth
       (sys::poke _initial_depth (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _final_latitude
       (sys::poke _final_latitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _final_longitude
       (sys::poke _final_longitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _final_depth
       (sys::poke _final_depth (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _final_yaw
       (sys::poke _final_yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _final_altitude
       (sys::poke _final_altitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
     ;; uint64 _controller_type
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _controller_type (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _controller_type) (= (length (_controller_type . bv)) 2)) ;; bignum
              (write-long (ash (elt (_controller_type . bv) 0) 0) s)
              (write-long (ash (elt (_controller_type . bv) 1) -1) s))
             ((and (class _controller_type) (= (length (_controller_type . bv)) 1)) ;; big1
              (write-long (elt (_controller_type . bv) 0) s)
              (write-long (if (>= _controller_type 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _controller_type s)(write-long (if (>= _controller_type 0) 0 #xffffffff) s)))
     ;; cola2_msgs/GoalDescriptor _goal
       (send _goal :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _initial_latitude
     (setq _initial_latitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _initial_longitude
     (setq _initial_longitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _initial_depth
     (setq _initial_depth (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _final_latitude
     (setq _final_latitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _final_longitude
     (setq _final_longitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _final_depth
     (setq _final_depth (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _final_yaw
     (setq _final_yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _final_altitude
     (setq _final_altitude (sys::peek buf ptr- :double)) (incf ptr- 8)
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
   ;; uint64 _controller_type
     
#+(or :alpha :irix6 :x86_64)
      (setf _controller_type (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _controller_type (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; cola2_msgs/GoalDescriptor _goal
     (send _goal :deserialize buf ptr-) (incf ptr- (send _goal :serialization-length))
   ;;
   self)
  )

(setf (get cola2_msgs::PilotGoal :md5sum-) "bc5e515316b2127f5f22f67e085e5c8d")
(setf (get cola2_msgs::PilotGoal :datatype-) "cola2_msgs/PilotGoal")
(setf (get cola2_msgs::PilotGoal :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# Define the REQUEST

# Initial state
float64 initial_latitude
float64 initial_longitude
float64 initial_depth

# Final state
float64 final_latitude
float64 final_longitude
float64 final_depth
float64 final_yaw
float64 final_altitude

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

# Controller type
uint64 controller_type
uint64 SECTION=0
uint64 ANCHOR=1
uint64 HOLONOMIC_KEEP_POSITION=2

# Requester and priority
cola2_msgs/GoalDescriptor goal


================================================================================
MSG: cola2_msgs/GoalDescriptor
# Contains values common to all waypoint request and status messages.
# Waypoint goals with higher priority trump lower priority goals. For
# goals of the same priority, the pilot should follow the latest
# received.

# Name of the requesting node, used with id to identify the request.
string requester

uint32 priority

# PRIORITY DEFINITIONS
uint32 PRIORITY_TELEOPERATION_LOW = 0
uint32 PRIORITY_SAFETY_LOW = 5
uint32 PRIORITY_NORMAL = 10
uint32 PRIORITY_SAFETY = 30
uint32 PRIORITY_TELEOPERATION = 40
uint32 PRIORITY_SAFETY_HIGH  = 50
uint32 PRIORITY_TELEOPERATION_HIGH = 60

")



(provide :cola2_msgs/PilotGoal "bc5e515316b2127f5f22f67e085e5c8d")


