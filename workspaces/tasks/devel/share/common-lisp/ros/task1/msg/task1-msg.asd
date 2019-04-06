
(cl:in-package :asdf)

(defsystem "task1-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "Checkpoints" :depends-on ("_package_Checkpoints"))
    (:file "_package_Checkpoints" :depends-on ("_package"))
    (:file "EllipseData" :depends-on ("_package_EllipseData"))
    (:file "_package_EllipseData" :depends-on ("_package"))
    (:file "ScanFlag" :depends-on ("_package_ScanFlag"))
    (:file "_package_ScanFlag" :depends-on ("_package"))
  ))