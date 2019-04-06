package moveit_msgs;

public interface GetConstraintAwarePositionIK$Service extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/GetConstraintAwarePositionIK$Service";
  static final java.lang.String _DEFINITION = "# A service call to carry out an inverse kinematics computation\n# The inverse kinematics request\nPositionIKRequest ik_request\n\n# A set of constraints that the IK must obey\nConstraints constraints\n\n---\n\n# The returned solution \nRobotState solution\nMoveItErrorCodes error_code\n\n";
  static final boolean _IS_SERVICE = true;
  static final boolean _IS_ACTION = false;
}
