package moveit_msgs;

public interface CheckIfRobotStateExistsInWarehouseResponse extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/CheckIfRobotStateExistsInWarehouseResponse";
  static final java.lang.String _DEFINITION = "\nbool exists";
  static final boolean _IS_SERVICE = true;
  static final boolean _IS_ACTION = false;
  boolean getExists();
  void setExists(boolean value);
}
