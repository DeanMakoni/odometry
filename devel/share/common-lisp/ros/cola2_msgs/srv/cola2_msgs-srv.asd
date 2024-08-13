
(cl:in-package :asdf)

(defsystem "cola2_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :cola2_msgs-msg
)
  :components ((:file "_package")
    (:file "Action" :depends-on ("_package_Action"))
    (:file "_package_Action" :depends-on ("_package"))
    (:file "DigitalOutput" :depends-on ("_package_DigitalOutput"))
    (:file "_package_DigitalOutput" :depends-on ("_package"))
    (:file "Goto" :depends-on ("_package_Goto"))
    (:file "_package_Goto" :depends-on ("_package"))
    (:file "MaxJoyVelocity" :depends-on ("_package_MaxJoyVelocity"))
    (:file "_package_MaxJoyVelocity" :depends-on ("_package"))
    (:file "Mission" :depends-on ("_package_Mission"))
    (:file "_package_Mission" :depends-on ("_package"))
    (:file "Recovery" :depends-on ("_package_Recovery"))
    (:file "_package_Recovery" :depends-on ("_package"))
    (:file "Section" :depends-on ("_package_Section"))
    (:file "_package_Section" :depends-on ("_package"))
    (:file "String" :depends-on ("_package_String"))
    (:file "_package_String" :depends-on ("_package"))
  ))