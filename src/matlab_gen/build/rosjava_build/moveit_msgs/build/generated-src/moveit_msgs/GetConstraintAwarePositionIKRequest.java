package moveit_msgs;

public interface GetConstraintAwarePositionIKRequest extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/GetConstraintAwarePositionIKRequest";
  static final java.lang.String _DEFINITION = "# A service call to carry out an inverse kinematics computation\n# The inverse kinematics request\nPositionIKRequest ik_request\n\n# A set of constraints that the IK must obey\nConstraints constraints\n\n";
  static final boolean _IS_SERVICE = true;
  static final boolean _IS_ACTION = false;
  moveit_msgs.PositionIKRequest getIkRequest();
  void setIkRequest(moveit_msgs.PositionIKRequest value);
  moveit_msgs.Constraints getConstraints();
  void setConstraints(moveit_msgs.Constraints value);
}
