package moveit_msgs;

public interface GetRobotStateFromWarehouseResponse extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/GetRobotStateFromWarehouseResponse";
  static final java.lang.String _DEFINITION = "\nmoveit_msgs/RobotState state";
  static final boolean _IS_SERVICE = true;
  static final boolean _IS_ACTION = false;
  moveit_msgs.RobotState getState();
  void setState(moveit_msgs.RobotState value);
}
