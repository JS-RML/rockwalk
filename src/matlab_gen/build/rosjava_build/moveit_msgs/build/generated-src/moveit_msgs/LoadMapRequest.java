package moveit_msgs;

public interface LoadMapRequest extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/LoadMapRequest";
  static final java.lang.String _DEFINITION = "string filename\n";
  static final boolean _IS_SERVICE = true;
  static final boolean _IS_ACTION = false;
  java.lang.String getFilename();
  void setFilename(java.lang.String value);
}
