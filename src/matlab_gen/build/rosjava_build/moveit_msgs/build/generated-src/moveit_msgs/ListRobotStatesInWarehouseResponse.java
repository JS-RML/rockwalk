package moveit_msgs;

public interface ListRobotStatesInWarehouseResponse extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/ListRobotStatesInWarehouseResponse";
  static final java.lang.String _DEFINITION = "\nstring[] states";
  static final boolean _IS_SERVICE = true;
  static final boolean _IS_ACTION = false;
  java.util.List<java.lang.String> getStates();
  void setStates(java.util.List<java.lang.String> value);
}
