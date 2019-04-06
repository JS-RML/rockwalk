package moveit_msgs;

public interface ExecuteTrajectory$Action extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/ExecuteTrajectory$Action";
  static final java.lang.String _DEFINITION = "# The trajectory to execute\nRobotTrajectory trajectory\n\n---\n\n# Error code - encodes the overall reason for failure\nMoveItErrorCodes error_code\n\n---\n\n# The internal state that the move group action currently is in\nstring state\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = true;
}
