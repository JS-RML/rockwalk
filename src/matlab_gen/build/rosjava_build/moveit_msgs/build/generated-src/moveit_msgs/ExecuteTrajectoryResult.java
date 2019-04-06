package moveit_msgs;

public interface ExecuteTrajectoryResult extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/ExecuteTrajectoryResult";
  static final java.lang.String _DEFINITION = "\n# Error code - encodes the overall reason for failure\nMoveItErrorCodes error_code\n\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = true;
  moveit_msgs.MoveItErrorCodes getErrorCode();
  void setErrorCode(moveit_msgs.MoveItErrorCodes value);
}
