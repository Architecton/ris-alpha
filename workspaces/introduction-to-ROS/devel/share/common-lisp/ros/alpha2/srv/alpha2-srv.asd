
(cl:in-package :asdf)

(defsystem "alpha2-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "TurtleManager" :depends-on ("_package_TurtleManager"))
    (:file "_package_TurtleManager" :depends-on ("_package"))
  ))