;; Auto-generated. Do not edit!


(when (boundp 'ur_msgs::DualArmEff)
  (if (not (find-package "UR_MSGS"))
    (make-package "UR_MSGS"))
  (shadow 'DualArmEff (find-package "UR_MSGS")))
(unless (find-package "UR_MSGS::DUALARMEFF")
  (make-package "UR_MSGS::DUALARMEFF"))

(in-package "ROS")
;;//! \htmlinclude DualArmEff.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass ur_msgs::DualArmEff
  :super ros::object
  :slots (_HongTargetPose _KongTargetPose ))

(defmethod ur_msgs::DualArmEff
  (:init
   (&key
    ((:HongTargetPose __HongTargetPose) (instance geometry_msgs::Pose :init))
    ((:KongTargetPose __KongTargetPose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _HongTargetPose __HongTargetPose)
   (setq _KongTargetPose __KongTargetPose)
   self)
  (:HongTargetPose
   (&rest __HongTargetPose)
   (if (keywordp (car __HongTargetPose))
       (send* _HongTargetPose __HongTargetPose)
     (progn
       (if __HongTargetPose (setq _HongTargetPose (car __HongTargetPose)))
       _HongTargetPose)))
  (:KongTargetPose
   (&rest __KongTargetPose)
   (if (keywordp (car __KongTargetPose))
       (send* _KongTargetPose __KongTargetPose)
     (progn
       (if __KongTargetPose (setq _KongTargetPose (car __KongTargetPose)))
       _KongTargetPose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _HongTargetPose
    (send _HongTargetPose :serialization-length)
    ;; geometry_msgs/Pose _KongTargetPose
    (send _KongTargetPose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _HongTargetPose
       (send _HongTargetPose :serialize s)
     ;; geometry_msgs/Pose _KongTargetPose
       (send _KongTargetPose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _HongTargetPose
     (send _HongTargetPose :deserialize buf ptr-) (incf ptr- (send _HongTargetPose :serialization-length))
   ;; geometry_msgs/Pose _KongTargetPose
     (send _KongTargetPose :deserialize buf ptr-) (incf ptr- (send _KongTargetPose :serialization-length))
   ;;
   self)
  )

(setf (get ur_msgs::DualArmEff :md5sum-) "dc2cdf957047a17b7bfeba54584a1753")
(setf (get ur_msgs::DualArmEff :datatype-) "ur_msgs/DualArmEff")
(setf (get ur_msgs::DualArmEff :definition-)
      "geometry_msgs/Pose HongTargetPose
geometry_msgs/Pose KongTargetPose

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



(provide :ur_msgs/DualArmEff "dc2cdf957047a17b7bfeba54584a1753")


