package moveit_msgs;

public interface ExecuteTrajectoryGoal extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/ExecuteTrajectoryGoal";
  static final java.lang.String _DEFINITION = "# The trajectory to execute\nRobotTrajectory trajectory\n\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = true;
  moveit_msgs.RobotTrajectory getTrajectory();
  void setTrajectory(moveit_msgs.RobotTrajectory value);
}
