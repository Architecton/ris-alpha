
(cl:in-package :asdf)

(defsystem "task2-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ApproachImageFeedback" :depends-on ("_package_ApproachImageFeedback"))
    (:file "_package_ApproachImageFeedback" :depends-on ("_package"))
    (:file "RingApproachPointResponse" :depends-on ("_package_RingApproachPointResponse"))
    (:file "_package_RingApproachPointResponse" :depends-on ("_package"))
    (:file "SayCommand" :depends-on ("_package_SayCommand"))
    (:file "_package_SayCommand" :depends-on ("_package"))
    (:file "TerminalApproachFeedback" :depends-on ("_package_TerminalApproachFeedback"))
    (:file "_package_TerminalApproachFeedback" :depends-on ("_package"))
    (:file "ValidRegionsMapResponse" :depends-on ("_package_ValidRegionsMapResponse"))
    (:file "_package_ValidRegionsMapResponse" :depends-on ("_package"))
  ))