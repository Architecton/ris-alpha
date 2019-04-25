
(cl:in-package :asdf)

(defsystem "task1-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "CheckpointProcessorResponse" :depends-on ("_package_CheckpointProcessorResponse"))
    (:file "_package_CheckpointProcessorResponse" :depends-on ("_package"))
    (:file "Checkpoints" :depends-on ("_package_Checkpoints"))
    (:file "_package_Checkpoints" :depends-on ("_package"))
    (:file "EllipseData" :depends-on ("_package_EllipseData"))
    (:file "_package_EllipseData" :depends-on ("_package"))
    (:file "RingData" :depends-on ("_package_RingData"))
    (:file "_package_RingData" :depends-on ("_package"))
    (:file "ScanFlag" :depends-on ("_package_ScanFlag"))
    (:file "_package_ScanFlag" :depends-on ("_package"))
  ))