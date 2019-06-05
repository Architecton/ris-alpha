
(cl:in-package :asdf)

(defsystem "task3-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "TreasureLocator" :depends-on ("_package_TreasureLocator"))
    (:file "_package_TreasureLocator" :depends-on ("_package"))
  ))