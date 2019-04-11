
(cl:in-package :asdf)

(defsystem "task2-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "TerminalApproachFeedback" :depends-on ("_package_TerminalApproachFeedback"))
    (:file "_package_TerminalApproachFeedback" :depends-on ("_package"))
  ))