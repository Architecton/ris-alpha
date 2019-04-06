
(cl:in-package :asdf)

(defsystem "task1-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :task1-msg
)
  :components ((:file "_package")
    (:file "CheckpointProcessor" :depends-on ("_package_CheckpointProcessor"))
    (:file "_package_CheckpointProcessor" :depends-on ("_package"))
    (:file "Checkpoint_res" :depends-on ("_package_Checkpoint_res"))
    (:file "_package_Checkpoint_res" :depends-on ("_package"))
    (:file "EllipseLocator" :depends-on ("_package_EllipseLocator"))
    (:file "_package_EllipseLocator" :depends-on ("_package"))
  ))