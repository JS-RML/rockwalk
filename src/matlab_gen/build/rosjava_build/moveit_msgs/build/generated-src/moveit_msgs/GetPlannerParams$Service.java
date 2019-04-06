package moveit_msgs;

public interface GetPlannerParams$Service extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/GetPlannerParams$Service";
  static final java.lang.String _DEFINITION = "# Name of planning config\nstring planner_config\n\n# Optional name of planning group (return global defaults if empty)\nstring group\n\n---\n\n# parameters as key-value pairs\nPlannerParams params\n";
  static final boolean _IS_SERVICE = true;
  static final boolean _IS_ACTION = false;
}
