
(cl:in-package :asdf)

(defsystem "ur10_cm-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "dual_arm_eff_msg" :depends-on ("_package_dual_arm_eff_msg"))
    (:file "_package_dual_arm_eff_msg" :depends-on ("_package"))
  ))