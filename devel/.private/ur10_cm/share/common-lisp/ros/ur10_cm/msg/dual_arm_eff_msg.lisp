; Auto-generated. Do not edit!


(cl:in-package ur10_cm-msg)


;//! \htmlinclude dual_arm_eff_msg.msg.html

(cl:defclass <dual_arm_eff_msg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (hong_target_pose
    :reader hong_target_pose
    :initarg :hong_target_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (kong_target_pose
    :reader kong_target_pose
    :initarg :kong_target_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass dual_arm_eff_msg (<dual_arm_eff_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <dual_arm_eff_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'dual_arm_eff_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur10_cm-msg:<dual_arm_eff_msg> is deprecated: use ur10_cm-msg:dual_arm_eff_msg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <dual_arm_eff_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_cm-msg:header-val is deprecated.  Use ur10_cm-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'hong_target_pose-val :lambda-list '(m))
(cl:defmethod hong_target_pose-val ((m <dual_arm_eff_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_cm-msg:hong_target_pose-val is deprecated.  Use ur10_cm-msg:hong_target_pose instead.")
  (hong_target_pose m))

(cl:ensure-generic-function 'kong_target_pose-val :lambda-list '(m))
(cl:defmethod kong_target_pose-val ((m <dual_arm_eff_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_cm-msg:kong_target_pose-val is deprecated.  Use ur10_cm-msg:kong_target_pose instead.")
  (kong_target_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <dual_arm_eff_msg>) ostream)
  "Serializes a message object of type '<dual_arm_eff_msg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'hong_target_pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'kong_target_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <dual_arm_eff_msg>) istream)
  "Deserializes a message object of type '<dual_arm_eff_msg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'hong_target_pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'kong_target_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<dual_arm_eff_msg>)))
  "Returns string type for a message object of type '<dual_arm_eff_msg>"
  "ur10_cm/dual_arm_eff_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'dual_arm_eff_msg)))
  "Returns string type for a message object of type 'dual_arm_eff_msg"
  "ur10_cm/dual_arm_eff_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<dual_arm_eff_msg>)))
  "Returns md5sum for a message object of type '<dual_arm_eff_msg>"
  "ed9e1d286bd8f03ad213c307ed3832c4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'dual_arm_eff_msg)))
  "Returns md5sum for a message object of type 'dual_arm_eff_msg"
  "ed9e1d286bd8f03ad213c307ed3832c4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<dual_arm_eff_msg>)))
  "Returns full string definition for message of type '<dual_arm_eff_msg>"
  (cl:format cl:nil "Header header~%geometry_msgs/Pose hong_target_pose~%geometry_msgs/Pose kong_target_pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'dual_arm_eff_msg)))
  "Returns full string definition for message of type 'dual_arm_eff_msg"
  (cl:format cl:nil "Header header~%geometry_msgs/Pose hong_target_pose~%geometry_msgs/Pose kong_target_pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <dual_arm_eff_msg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'hong_target_pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'kong_target_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <dual_arm_eff_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'dual_arm_eff_msg
    (cl:cons ':header (header msg))
    (cl:cons ':hong_target_pose (hong_target_pose msg))
    (cl:cons ':kong_target_pose (kong_target_pose msg))
))
