
(cl:in-package :asdf)

(defsystem "exercise5-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "EllipseData" :depends-on ("_package_EllipseData"))
    (:file "_package_EllipseData" :depends-on ("_package"))
  ))