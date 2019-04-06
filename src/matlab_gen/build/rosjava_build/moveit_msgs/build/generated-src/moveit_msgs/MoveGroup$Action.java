package moveit_msgs;

public interface MoveGroup$Action extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/MoveGroup$Action";
  static final java.lang.String _DEFINITION = "# Motion planning request to pass to planner\nMotionPlanRequest request\n\n# Planning options\nPlanningOptions planning_options\n\n---\n\n# An error code reflecting what went wrong\nMoveItErrorCodes error_code\n\n# The full starting state of the robot at the start of the trajectory\nmoveit_msgs/RobotState trajectory_start\n\n# The trajectory that moved group produced for execution\nmoveit_msgs/RobotTrajectory planned_trajectory\n\n# The trace of the trajectory recorded during execution\nmoveit_msgs/RobotTrajectory executed_trajectory\n\n# The amount of time it took to complete the motion plan\nfloat64 planning_time\n\n---\n\n# The internal state that the move group action currently is in\nstring state\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = true;
}
