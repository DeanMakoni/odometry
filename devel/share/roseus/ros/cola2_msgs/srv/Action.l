;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::Action)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'Action (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::ACTION")
  (make-package "COLA2_MSGS::ACTION"))
(unless (find-package "COLA2_MSGS::ACTIONREQUEST")
  (make-package "COLA2_MSGS::ACTIONREQUEST"))
(unless (find-package "COLA2_MSGS::ACTIONRESPONSE")
  (make-package "COLA2_MSGS::ACTIONRESPONSE"))

(in-package "ROS")





(defclass cola2_msgs::ActionRequest
  :super ros::object
  :slots (_param ))

(defmethod cola2_msgs::ActionRequest
  (:init
   (&key
    ((:param __param) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _param __param)
   self)
  (:param
   (&optional __param)
   (if __param (setq _param __param)) _param)
  (:serialization-length
   ()
   (+
    ;; string[] _param
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _param)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _param
     (write-long (length _param) s)
     (dolist (elem _param)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _param
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _param (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _param i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass cola2_msgs::ActionResponse
  :super ros::object
  :slots (_success _message ))

(defmethod cola2_msgs::ActionResponse
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

(defclass cola2_msgs::Action
  :super ros::object
  :slots ())

(setf (get cola2_msgs::Action :md5sum-) "b78dc2864250f8243cb4ae06aec6c0bb")
(setf (get cola2_msgs::Action :datatype-) "cola2_msgs/Action")
(setf (get cola2_msgs::Action :request) cola2_msgs::ActionRequest)
(setf (get cola2_msgs::Action :response) cola2_msgs::ActionResponse)

(defmethod cola2_msgs::ActionRequest
  (:response () (instance cola2_msgs::ActionResponse :init)))

(setf (get cola2_msgs::ActionRequest :md5sum-) "b78dc2864250f8243cb4ae06aec6c0bb")
(setf (get cola2_msgs::ActionRequest :datatype-) "cola2_msgs/ActionRequest")
(setf (get cola2_msgs::ActionRequest :definition-)
      "string[] param
---
bool success
string message

")

(setf (get cola2_msgs::ActionResponse :md5sum-) "b78dc2864250f8243cb4ae06aec6c0bb")
(setf (get cola2_msgs::ActionResponse :datatype-) "cola2_msgs/ActionResponse")
(setf (get cola2_msgs::ActionResponse :definition-)
      "string[] param
---
bool success
string message

")



(provide :cola2_msgs/Action "b78dc2864250f8243cb4ae06aec6c0bb")


