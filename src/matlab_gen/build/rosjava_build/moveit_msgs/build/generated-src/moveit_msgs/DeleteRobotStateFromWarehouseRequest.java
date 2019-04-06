package moveit_msgs;

public interface DeleteRobotStateFromWarehouseRequest extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/DeleteRobotStateFromWarehouseRequest";
  static final java.lang.String _DEFINITION = "string name\nstring robot\n\n";
  static final boolean _IS_SERVICE = true;
  static final boolean _IS_ACTION = false;
  java.lang.String getName();
  void setName(java.lang.String value);
  java.lang.String getRobot();
  void setRobot(java.lang.String value);
}
