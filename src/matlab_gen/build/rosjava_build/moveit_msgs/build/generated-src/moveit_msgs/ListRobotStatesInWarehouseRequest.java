package moveit_msgs;

public interface ListRobotStatesInWarehouseRequest extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/ListRobotStatesInWarehouseRequest";
  static final java.lang.String _DEFINITION = "string regex\nstring robot\n\n";
  static final boolean _IS_SERVICE = true;
  static final boolean _IS_ACTION = false;
  java.lang.String getRegex();
  void setRegex(java.lang.String value);
  java.lang.String getRobot();
  void setRobot(java.lang.String value);
}
