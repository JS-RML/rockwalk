package moveit_msgs;

public interface MoveGroupGoal extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/MoveGroupGoal";
  static final java.lang.String _DEFINITION = "# Motion planning request to pass to planner\nMotionPlanRequest request\n\n# Planning options\nPlanningOptions planning_options\n\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = true;
  moveit_msgs.MotionPlanRequest getRequest();
  void setRequest(moveit_msgs.MotionPlanRequest value);
  moveit_msgs.PlanningOptions getPlanningOptions();
  void setPlanningOptions(moveit_msgs.PlanningOptions value);
}