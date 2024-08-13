;; Auto-generated. Do not edit!


(when (boundp 'cola2_msgs::KeyValueArray)
  (if (not (find-package "COLA2_MSGS"))
    (make-package "COLA2_MSGS"))
  (shadow 'KeyValueArray (find-package "COLA2_MSGS")))
(unless (find-package "COLA2_MSGS::KEYVALUEARRAY")
  (make-package "COLA2_MSGS::KEYVALUEARRAY"))

(in-package "ROS")
;;//! \htmlinclude KeyValueArray.msg.html


(defclass cola2_msgs::KeyValueArray
  :super ros::object
  :slots (_keyvalues ))

(defmethod cola2_msgs::KeyValueArray
  (:init
   (&key
    ((:keyvalues __keyvalues) ())
    )
   (send-super :init)
   (setq _keyvalues __keyvalues)
   self)
  (:keyvalues
   (&rest __keyvalues)
   (if (keywordp (car __keyvalues))
       (send* _keyvalues __keyvalues)
     (progn
       (if __keyvalues (setq _keyvalues (car __keyvalues)))
       _keyvalues)))
  (:serialization-length
   ()
   (+
    ;; cola2_msgs/KeyValue[] _keyvalues
    (apply #'+ (send-all _keyvalues :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; cola2_msgs/KeyValue[] _keyvalues
     (write-long (length _keyvalues) s)
     (dolist (elem _keyvalues)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; cola2_msgs/KeyValue[] _keyvalues
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _keyvalues (let (r) (dotimes (i n) (push (instance cola2_msgs::KeyValue :init) r)) r))
     (dolist (elem- _keyvalues)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get cola2_msgs::KeyValueArray :md5sum-) "e6aed4084986fd7ac11d4023a138269c")
(setf (get cola2_msgs::KeyValueArray :datatype-) "cola2_msgs/KeyValueArray")
(setf (get cola2_msgs::KeyValueArray :definition-)
      "cola2_msgs/KeyValue[] keyvalues

================================================================================
MSG: cola2_msgs/KeyValue
string key
string value

")



(provide :cola2_msgs/KeyValueArray "e6aed4084986fd7ac11d4023a138269c")


