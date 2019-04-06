package moveit_msgs;

public interface GetConstraintAwarePositionIKResponse extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/GetConstraintAwarePositionIKResponse";
  static final java.lang.String _DEFINITION = "\n# The returned solution \nRobotState solution\nMoveItErrorCodes error_code";
  static final boolean _IS_SERVICE = true;
  static final boolean _IS_ACTION = false;
  moveit_msgs.RobotState getSolution();
  void setSolution(moveit_msgs.RobotState value);
  moveit_msgs.MoveItErrorCodes getErrorCode();
  void setErrorCode(moveit_msgs.MoveItErrorCodes value);
}
