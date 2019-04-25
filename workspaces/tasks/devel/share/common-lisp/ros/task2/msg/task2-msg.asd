
(cl:in-package :asdf)

(defsystem "task2-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ApproachImageFeedback" :depends-on ("_package_ApproachImageFeedback"))
    (:file "_package_ApproachImageFeedback" :depends-on ("_package"))
    (:file "RingData" :depends-on ("_package_RingData"))
    (:file "_package_RingData" :depends-on ("_package"))
    (:file "TerminalApproachFeedback" :depends-on ("_package_TerminalApproachFeedback"))
    (:file "_package_TerminalApproachFeedback" :depends-on ("_package"))
    (:file "ValidRegionsMapResponse" :depends-on ("_package_ValidRegionsMapResponse"))
    (:file "_package_ValidRegionsMapResponse" :depends-on ("_package"))
  ))