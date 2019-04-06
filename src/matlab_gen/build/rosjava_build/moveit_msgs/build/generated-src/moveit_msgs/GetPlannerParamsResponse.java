package moveit_msgs;

public interface GetPlannerParamsResponse extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/GetPlannerParamsResponse";
  static final java.lang.String _DEFINITION = "\n# parameters as key-value pairs\nPlannerParams params";
  static final boolean _IS_SERVICE = true;
  static final boolean _IS_ACTION = false;
  moveit_msgs.PlannerParams getParams();
  void setParams(moveit_msgs.PlannerParams value);
}
