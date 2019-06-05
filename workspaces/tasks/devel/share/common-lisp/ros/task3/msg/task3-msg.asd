
(cl:in-package :asdf)

(defsystem "task3-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "TreasureLocatorResponse" :depends-on ("_package_TreasureLocatorResponse"))
    (:file "_package_TreasureLocatorResponse" :depends-on ("_package"))
  ))