;; Auto-generated. Do not edit!


(when (boundp 'ur10_cm::dual_arm_eff_msg)
  (if (not (find-package "UR10_CM"))
    (make-package "UR10_CM"))
  (shadow 'dual_arm_eff_msg (find-package "UR10_CM")))
(unless (find-package "UR10_CM::DUAL_ARM_EFF_MSG")
  (make-package "UR10_CM::DUAL_ARM_EFF_MSG"))

(in-package "ROS")
;;//! \htmlinclude dual_arm_eff_msg.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ur10_cm::dual_arm_eff_msg
  :super ros::object
  :slots (_header _hong_target_pose _kong_target_pose ))

(defmethod ur10_cm::dual_arm_eff_msg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:hong_target_pose __hong_target_pose) (instance geometry_msgs::Pose :init))
    ((:kong_target_pose __kong_target_pose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _hong_target_pose __hong_target_pose)
   (setq _kong_target_pose __kong_target_pose)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:hong_target_pose
   (&rest __hong_target_pose)
   (if (keywordp (car __hong_target_pose))
       (send* _hong_target_pose __hong_target_pose)
     (progn
       (if __hong_target_pose (setq _hong_target_pose (car __hong_target_pose)))
       _hong_target_pose)))
  (:kong_target_pose
   (&rest __kong_target_pose)
   (if (keywordp (car __kong_target_pose))
       (send* _kong_target_pose __kong_target_pose)
     (progn
       (if __kong_target_pose (setq _kong_target_pose (car __kong_target_pose)))
       _kong_target_pose)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Pose _hong_target_pose
    (send _hong_target_pose :serialization-length)
    ;; geometry_msgs/Pose _kong_target_pose
    (send _kong_target_pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Pose _hong_target_pose
       (send _hong_target_pose :serialize s)
     ;; geometry_msgs/Pose _kong_target_pose
       (send _kong_target_pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Pose _hong_target_pose
     (send _hong_target_pose :deserialize buf ptr-) (incf ptr- (send _hong_target_pose :serialization-length))
   ;; geometry_msgs/Pose _kong_target_pose
     (send _kong_target_pose :deserialize buf ptr-) (incf ptr- (send _kong_target_pose :serialization-length))
   ;;
   self)
  )

(setf (get ur10_cm::dual_arm_eff_msg :md5sum-) "ed9e1d286bd8f03ad213c307ed3832c4")
(setf (get ur10_cm::dual_arm_eff_msg :datatype-) "ur10_cm/dual_arm_eff_msg")
(setf (get ur10_cm::dual_arm_eff_msg :definition-)
      "Header header
geometry_msgs/Pose hong_target_pose
geometry_msgs/Pose kong_target_pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :ur10_cm/dual_arm_eff_msg "ed9e1d286bd8f03ad213c307ed3832c4")


