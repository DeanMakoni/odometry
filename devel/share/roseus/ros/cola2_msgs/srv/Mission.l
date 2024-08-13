;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::Mission)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'Mission (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::MISSION")
  (make-package "COLA2_MSGS::MISSION"))
(unless (find-package "COLA2_MSGS::MISSIONREQUEST")
  (make-package "COLA2_MSGS::MISSIONREQUEST"))
(unless (find-package "COLA2_MSGS::MISSIONRESPONSE")
  (make-package "COLA2_MSGS::MISSIONRESPONSE"))

(in-package "ROS")





(defclass cola2_msgs::MissionRequest
  :super ros::object
  :slots (_mission ))

(defmethod cola2_msgs::MissionRequest
  (:init
   (&key
    ((:mission __mission) "")
    )
   (send-super :init)
   (setq _mission (string __mission))
   self)
  (:mission
   (&optional __mission)
   (if __mission (setq _mission __mission)) _mission)
  (:serialization-length
   ()
   (+
    ;; string _mission
    4 (length _mission)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _mission
       (write-long (length _mission) s) (princ _mission s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _mission
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _mission (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass cola2_msgs::MissionResponse
  :super ros::object
  :slots (_success _message ))

(defmethod cola2_msgs::MissionResponse
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

(defclass cola2_msgs::Mission
  :super ros::object
  :slots ())

(setf (get cola2_msgs::Mission :md5sum-) "4c0bb5660c3e04aa8fcef310293495f7")
(setf (get cola2_msgs::Mission :datatype-) "cola2_msgs/Mission")
(setf (get cola2_msgs::Mission :request) cola2_msgs::MissionRequest)
(setf (get cola2_msgs::Mission :response) cola2_msgs::MissionResponse)

(defmethod cola2_msgs::MissionRequest
  (:response () (instance cola2_msgs::MissionResponse :init)))

(setf (get cola2_msgs::MissionRequest :md5sum-) "4c0bb5660c3e04aa8fcef310293495f7")
(setf (get cola2_msgs::MissionRequest :datatype-) "cola2_msgs/MissionRequest")
(setf (get cola2_msgs::MissionRequest :definition-)
      "string mission
---
bool success
string message

")

(setf (get cola2_msgs::MissionResponse :md5sum-) "4c0bb5660c3e04aa8fcef310293495f7")
(setf (get cola2_msgs::MissionResponse :datatype-) "cola2_msgs/MissionResponse")
(setf (get cola2_msgs::MissionResponse :definition-)
      "string mission
---
bool success
string message

")



(provide :cola2_msgs/Mission "4c0bb5660c3e04aa8fcef310293495f7")


