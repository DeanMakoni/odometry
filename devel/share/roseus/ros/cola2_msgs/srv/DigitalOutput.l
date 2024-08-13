;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::DigitalOutput)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'DigitalOutput (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::DIGITALOUTPUT")
  (make-package "COLA2_MSGS::DIGITALOUTPUT"))
(unless (find-package "COLA2_MSGS::DIGITALOUTPUTREQUEST")
  (make-package "COLA2_MSGS::DIGITALOUTPUTREQUEST"))
(unless (find-package "COLA2_MSGS::DIGITALOUTPUTRESPONSE")
  (make-package "COLA2_MSGS::DIGITALOUTPUTRESPONSE"))

(in-package "ROS")





(defclass cola2_msgs::DigitalOutputRequest
  :super ros::object
  :slots (_digital_output _value ))

(defmethod cola2_msgs::DigitalOutputRequest
  (:init
   (&key
    ((:digital_output __digital_output) 0)
    ((:value __value) 0)
    )
   (send-super :init)
   (setq _digital_output (round __digital_output))
   (setq _value (round __value))
   self)
  (:digital_output
   (&optional __digital_output)
   (if __digital_output (setq _digital_output __digital_output)) _digital_output)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; int32 _digital_output
    4
    ;; int32 _value
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _digital_output
       (write-long _digital_output s)
     ;; int32 _value
       (write-long _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _digital_output
     (setq _digital_output (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _value
     (setq _value (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass cola2_msgs::DigitalOutputResponse
  :super ros::object
  :slots (_success _message ))

(defmethod cola2_msgs::DigitalOutputResponse
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

(defclass cola2_msgs::DigitalOutput
  :super ros::object
  :slots ())

(setf (get cola2_msgs::DigitalOutput :md5sum-) "183c2e45b1ebafc9b5e338f77154c8b4")
(setf (get cola2_msgs::DigitalOutput :datatype-) "cola2_msgs/DigitalOutput")
(setf (get cola2_msgs::DigitalOutput :request) cola2_msgs::DigitalOutputRequest)
(setf (get cola2_msgs::DigitalOutput :response) cola2_msgs::DigitalOutputResponse)

(defmethod cola2_msgs::DigitalOutputRequest
  (:response () (instance cola2_msgs::DigitalOutputResponse :init)))

(setf (get cola2_msgs::DigitalOutputRequest :md5sum-) "183c2e45b1ebafc9b5e338f77154c8b4")
(setf (get cola2_msgs::DigitalOutputRequest :datatype-) "cola2_msgs/DigitalOutputRequest")
(setf (get cola2_msgs::DigitalOutputRequest :definition-)
      "int32 digital_output
int32 value
---
bool success
string message

")

(setf (get cola2_msgs::DigitalOutputResponse :md5sum-) "183c2e45b1ebafc9b5e338f77154c8b4")
(setf (get cola2_msgs::DigitalOutputResponse :datatype-) "cola2_msgs/DigitalOutputResponse")
(setf (get cola2_msgs::DigitalOutputResponse :definition-)
      "int32 digital_output
int32 value
---
bool success
string message

")



(provide :cola2_msgs/DigitalOutput "183c2e45b1ebafc9b5e338f77154c8b4")


