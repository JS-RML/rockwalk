package moveit_msgs;

public interface GetMotionPlanResponse extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/GetMotionPlanResponse";
  static final java.lang.String _DEFINITION = "\nMotionPlanResponse motion_plan_response";
  static final boolean _IS_SERVICE = true;
  static final boolean _IS_ACTION = false;
  moveit_msgs.MotionPlanResponse getMotionPlanResponse();
  void setMotionPlanResponse(moveit_msgs.MotionPlanResponse value);
}
