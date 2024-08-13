;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::MissionState)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'MissionState (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::MISSIONSTATE")
  (make-package "COLA2_MSGS::MISSIONSTATE"))

(in-package "ROS")
;;//! \htmlinclude MissionState.msg.html


(defclass cola2_msgs::MissionState
  :super ros::object
  :slots (_name _current_step _last_active ))

(defmethod cola2_msgs::MissionState
  (:init
   (&key
    ((:name __name) "")
    ((:current_step __current_step) 0)
    ((:last_active __last_active) (instance ros::time :init))
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _current_step (round __current_step))
   (setq _last_active __last_active)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:current_step
   (&optional __current_step)
   (if __current_step (setq _current_step __current_step)) _current_step)
  (:last_active
   (&optional __last_active)
   (if __last_active (setq _last_active __last_active)) _last_active)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; int32 _current_step
    4
    ;; time _last_active
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; int32 _current_step
       (write-long _current_step s)
     ;; time _last_active
       (write-long (send _last_active :sec) s) (write-long (send _last_active :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _current_step
     (setq _current_step (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; time _last_active
     (send _last_active :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _last_active :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get cola2_msgs::MissionState :md5sum-) "b22991b6c5683eeec05d46250572c6e6")
(setf (get cola2_msgs::MissionState :datatype-) "cola2_msgs/MissionState")
(setf (get cola2_msgs::MissionState :definition-)
      "string name
int32 current_step
time last_active

")



(provide :cola2_msgs/MissionState "b22991b6c5683eeec05d46250572c6e6")


