
(cl:in-package :asdf)

(defsystem "task1-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :task1-msg
)
  :components ((:file "_package")
    (:file "Checkpoint_res" :depends-on ("_package_Checkpoint_res"))
    (:file "_package_Checkpoint_res" :depends-on ("_package"))
  ))