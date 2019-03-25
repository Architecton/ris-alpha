
(cl:in-package :asdf)

(defsystem "exercise4-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ForwardRange" :depends-on ("_package_ForwardRange"))
    (:file "_package_ForwardRange" :depends-on ("_package"))
  ))