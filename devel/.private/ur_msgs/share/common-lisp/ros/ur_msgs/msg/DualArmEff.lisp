; Auto-generated. Do not edit!


(cl:in-package ur_msgs-msg)


;//! \htmlinclude DualArmEff.msg.html

(cl:defclass <DualArmEff> (roslisp-msg-protocol:ros-message)
  ((HongTargetPose
    :reader HongTargetPose
    :initarg :HongTargetPose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (KongTargetPose
    :reader KongTargetPose
    :initarg :KongTargetPose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass DualArmEff (<DualArmEff>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DualArmEff>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DualArmEff)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur_msgs-msg:<DualArmEff> is deprecated: use ur_msgs-msg:DualArmEff instead.")))

(cl:ensure-generic-function 'HongTargetPose-val :lambda-list '(m))
(cl:defmethod HongTargetPose-val ((m <DualArmEff>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur_msgs-msg:HongTargetPose-val is deprecated.  Use ur_msgs-msg:HongTargetPose instead.")
  (HongTargetPose m))

(cl:ensure-generic-function 'KongTargetPose-val :lambda-list '(m))
(cl:defmethod KongTargetPose-val ((m <DualArmEff>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur_msgs-msg:KongTargetPose-val is deprecated.  Use ur_msgs-msg:KongTargetPose instead.")
  (KongTargetPose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DualArmEff>) ostream)
  "Serializes a message object of type '<DualArmEff>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'HongTargetPose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'KongTargetPose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DualArmEff>) istream)
  "Deserializes a message object of type '<DualArmEff>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'HongTargetPose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'KongTargetPose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DualArmEff>)))
  "Returns string type for a message object of type '<DualArmEff>"
  "ur_msgs/DualArmEff")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DualArmEff)))
  "Returns string type for a message object of type 'DualArmEff"
  "ur_msgs/DualArmEff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DualArmEff>)))
  "Returns md5sum for a message object of type '<DualArmEff>"
  "dc2cdf957047a17b7bfeba54584a1753")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DualArmEff)))
  "Returns md5sum for a message object of type 'DualArmEff"
  "dc2cdf957047a17b7bfeba54584a1753")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DualArmEff>)))
  "Returns full string definition for message of type '<DualArmEff>"
  (cl:format cl:nil "geometry_msgs/Pose HongTargetPose~%geometry_msgs/Pose KongTargetPose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DualArmEff)))
  "Returns full string definition for message of type 'DualArmEff"
  (cl:format cl:nil "geometry_msgs/Pose HongTargetPose~%geometry_msgs/Pose KongTargetPose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DualArmEff>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'HongTargetPose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'KongTargetPose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DualArmEff>))
  "Converts a ROS message object to a list"
  (cl:list 'DualArmEff
    (cl:cons ':HongTargetPose (HongTargetPose msg))
    (cl:cons ':KongTargetPose (KongTargetPose msg))
))
