package moveit_msgs;

public interface GetPlanningSceneRequest extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/GetPlanningSceneRequest";
  static final java.lang.String _DEFINITION = "# Get parts of the planning scene that are of interest\nPlanningSceneComponents components\n";
  static final boolean _IS_SERVICE = true;
  static final boolean _IS_ACTION = false;
  moveit_msgs.PlanningSceneComponents getComponents();
  void setComponents(moveit_msgs.PlanningSceneComponents value);
}
