
(cl:in-package :asdf)

(defsystem "task2-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :task2-msg
)
  :components ((:file "_package")
    (:file "ColourClassificationSrv" :depends-on ("_package_ColourClassificationSrv"))
    (:file "_package_ColourClassificationSrv" :depends-on ("_package"))
    (:file "FeatureBuilder" :depends-on ("_package_FeatureBuilder"))
    (:file "_package_FeatureBuilder" :depends-on ("_package"))
    (:file "RingApproachPoint" :depends-on ("_package_RingApproachPoint"))
    (:file "_package_RingApproachPoint" :depends-on ("_package"))
    (:file "TerminalApproach" :depends-on ("_package_TerminalApproach"))
    (:file "_package_TerminalApproach" :depends-on ("_package"))
    (:file "ValidRegionsMap" :depends-on ("_package_ValidRegionsMap"))
    (:file "_package_ValidRegionsMap" :depends-on ("_package"))
  ))