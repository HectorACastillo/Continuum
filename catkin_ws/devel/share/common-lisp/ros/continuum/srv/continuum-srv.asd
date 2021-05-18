
(cl:in-package :asdf)

(defsystem "continuum-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GoTo" :depends-on ("_package_GoTo"))
    (:file "_package_GoTo" :depends-on ("_package"))
    (:file "MotorStates" :depends-on ("_package_MotorStates"))
    (:file "_package_MotorStates" :depends-on ("_package"))
    (:file "Reset" :depends-on ("_package_Reset"))
    (:file "_package_Reset" :depends-on ("_package"))
  ))