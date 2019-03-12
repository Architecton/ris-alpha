
(cl:in-package :asdf)

(defsystem "alpha1-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SumIntegers" :depends-on ("_package_SumIntegers"))
    (:file "_package_SumIntegers" :depends-on ("_package"))
  ))