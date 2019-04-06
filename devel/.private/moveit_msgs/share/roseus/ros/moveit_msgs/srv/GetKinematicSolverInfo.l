;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::GetKinematicSolverInfo)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'GetKinematicSolverInfo (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::GETKINEMATICSOLVERINFO")
  (make-package "MOVEIT_MSGS::GETKINEMATICSOLVERINFO"))
(unless (find-package "MOVEIT_MSGS::GETKINEMATICSOLVERINFOREQUEST")
  (make-package "MOVEIT_MSGS::GETKINEMATICSOLVERINFOREQUEST"))
(unless (find-package "MOVEIT_MSGS::GETKINEMATICSOLVERINFORESPONSE")
  (make-package "MOVEIT_MSGS::GETKINEMATICSOLVERINFORESPONSE"))

(in-package "ROS")





(defclass moveit_msgs::GetKinematicSolverInfoRequest
  :super ros::object
  :slots ())

(defmethod moveit_msgs::GetKinematicSolverInfoRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass moveit_msgs::GetKinematicSolverInfoResponse
  :super ros::object
  :slots (_kinematic_solver_info ))

(defmethod moveit_msgs::GetKinematicSolverInfoResponse
  (:init
   (&key
    ((:kinematic_solver_info __kinematic_solver_info) (instance moveit_msgs::KinematicSolverInfo :init))
    )
   (send-super :init)
   (setq _kinematic_solver_info __kinematic_solver_info)
   self)
  (:kinematic_solver_info
   (&rest __kinematic_solver_info)
   (if (keywordp (car __kinematic_solver_info))
       (send* _kinematic_solver_info __kinematic_solver_info)
     (progn
       (if __kinematic_solver_info (setq _kinematic_solver_info (car __kinematic_solver_info)))
       _kinematic_solver_info)))
  (:serialization-length
   ()
   (+
    ;; moveit_msgs/KinematicSolverInfo _kinematic_solver_info
    (send _kinematic_solver_info :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; moveit_msgs/KinematicSolverInfo _kinematic_solver_info
       (send _kinematic_solver_info :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; moveit_msgs/KinematicSolverInfo _kinematic_solver_info
     (send _kinematic_solver_info :deserialize buf ptr-) (incf ptr- (send _kinematic_solver_info :serialization-length))
   ;;
   self)
  )

(defclass moveit_msgs::GetKinematicSolverInfo
  :super ros::object
  :slots ())

(setf (get moveit_msgs::GetKinematicSolverInfo :md5sum-) "9b591d98efeb66095c1b33a70221cab5")
(setf (get moveit_msgs::GetKinematicSolverInfo :datatype-) "moveit_msgs/GetKinematicSolverInfo")
(setf (get moveit_msgs::GetKinematicSolverInfo :request) moveit_msgs::GetKinematicSolverInfoRequest)
(setf (get moveit_msgs::GetKinematicSolverInfo :response) moveit_msgs::GetKinematicSolverInfoResponse)

(defmethod moveit_msgs::GetKinematicSolverInfoRequest
  (:response () (instance moveit_msgs::GetKinematicSolverInfoResponse :init)))

(setf (get moveit_msgs::GetKinematicSolverInfoRequest :md5sum-) "9b591d98efeb66095c1b33a70221cab5")
(setf (get moveit_msgs::GetKinematicSolverInfoRequest :datatype-) "moveit_msgs/GetKinematicSolverInfoRequest")
(setf (get moveit_msgs::GetKinematicSolverInfoRequest :definition-)
      "
---
KinematicSolverInfo kinematic_solver_info

================================================================================
MSG: moveit_msgs/KinematicSolverInfo
# A list of joints in the kinematic tree
string[] joint_names
# A list of joint limits corresponding to the joint names
moveit_msgs/JointLimits[] limits
# A list of links that the kinematics node provides solutions for
string[] link_names

================================================================================
MSG: moveit_msgs/JointLimits
# This message contains information about limits of a particular joint (or control dimension)
string joint_name

# true if the joint has position limits
bool has_position_limits

# min and max position limits
float64 min_position
float64 max_position

# true if joint has velocity limits
bool has_velocity_limits

# max velocity limit
float64 max_velocity
# min_velocity is assumed to be -max_velocity

# true if joint has acceleration limits
bool has_acceleration_limits
# max acceleration limit
float64 max_acceleration
# min_acceleration is assumed to be -max_acceleration
")

(setf (get moveit_msgs::GetKinematicSolverInfoResponse :md5sum-) "9b591d98efeb66095c1b33a70221cab5")
(setf (get moveit_msgs::GetKinematicSolverInfoResponse :datatype-) "moveit_msgs/GetKinematicSolverInfoResponse")
(setf (get moveit_msgs::GetKinematicSolverInfoResponse :definition-)
      "
---
KinematicSolverInfo kinematic_solver_info

================================================================================
MSG: moveit_msgs/KinematicSolverInfo
# A list of joints in the kinematic tree
string[] joint_names
# A list of joint limits corresponding to the joint names
moveit_msgs/JointLimits[] limits
# A list of links that the kinematics node provides solutions for
string[] link_names

================================================================================
MSG: moveit_msgs/JointLimits
# This message contains information about limits of a particular joint (or control dimension)
string joint_name

# true if the joint has position limits
bool has_position_limits

# min and max position limits
float64 min_position
float64 max_position

# true if joint has velocity limits
bool has_velocity_limits

# max velocity limit
float64 max_velocity
# min_velocity is assumed to be -max_velocity

# true if joint has acceleration limits
bool has_acceleration_limits
# max acceleration limit
float64 max_acceleration
# min_acceleration is assumed to be -max_acceleration
")



(provide :moveit_msgs/GetKinematicSolverInfo "9b591d98efeb66095c1b33a70221cab5")


