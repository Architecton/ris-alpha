
(cl:in-package :asdf)

(defsystem "task1-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "Checkpoints" :depends-on ("_package_Checkpoints"))
    (:file "_package_Checkpoints" :depends-on ("_package"))
  ))