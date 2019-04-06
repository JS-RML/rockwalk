package moveit_msgs;

public interface SaveMapResponse extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/SaveMapResponse";
  static final java.lang.String _DEFINITION = "\nbool success";
  static final boolean _IS_SERVICE = true;
  static final boolean _IS_ACTION = false;
  boolean getSuccess();
  void setSuccess(boolean value);
}
