
(cl:in-package :asdf)

(defsystem "task2-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :task2-msg
)
  :components ((:file "_package")
    (:file "TerminalApproach" :depends-on ("_package_TerminalApproach"))
    (:file "_package_TerminalApproach" :depends-on ("_package"))
    (:file "ValidRegionsMap" :depends-on ("_package_ValidRegionsMap"))
    (:file "_package_ValidRegionsMap" :depends-on ("_package"))
  ))