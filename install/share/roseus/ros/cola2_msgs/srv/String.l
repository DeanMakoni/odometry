;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::String)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'String (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::STRING")
  (make-package "COLA2_MSGS::STRING"))
(unless (find-package "COLA2_MSGS::STRINGREQUEST")
  (make-package "COLA2_MSGS::STRINGREQUEST"))
(unless (find-package "COLA2_MSGS::STRINGRESPONSE")
  (make-package "COLA2_MSGS::STRINGRESPONSE"))

(in-package "ROS")





(defclass cola2_msgs::StringRequest
  :super ros::object
  :slots (_data ))

(defmethod cola2_msgs::StringRequest
  (:init
   (&key
    ((:data __data) "")
    )
   (send-super :init)
   (setq _data (string __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; string _data
    4 (length _data)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _data
       (write-long (length _data) s) (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass cola2_msgs::StringResponse
  :super ros::object
  :slots (_success _message ))

(defmethod cola2_msgs::StringResponse
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

(defclass cola2_msgs::String
  :super ros::object
  :slots ())

(setf (get cola2_msgs::String :md5sum-) "546971982e3fbbd5a41e60fb6432e357")
(setf (get cola2_msgs::String :datatype-) "cola2_msgs/String")
(setf (get cola2_msgs::String :request) cola2_msgs::StringRequest)
(setf (get cola2_msgs::String :response) cola2_msgs::StringResponse)

(defmethod cola2_msgs::StringRequest
  (:response () (instance cola2_msgs::StringResponse :init)))

(setf (get cola2_msgs::StringRequest :md5sum-) "546971982e3fbbd5a41e60fb6432e357")
(setf (get cola2_msgs::StringRequest :datatype-) "cola2_msgs/StringRequest")
(setf (get cola2_msgs::StringRequest :definition-)
      "string data
---
bool success
string message

")

(setf (get cola2_msgs::StringResponse :md5sum-) "546971982e3fbbd5a41e60fb6432e357")
(setf (get cola2_msgs::StringResponse :datatype-) "cola2_msgs/StringResponse")
(setf (get cola2_msgs::StringResponse :definition-)
      "string data
---
bool success
string message

")



(provide :cola2_msgs/String "546971982e3fbbd5a41e60fb6432e357")


