package ur_msgs;

public interface SetIOResponse extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "ur_msgs/SetIOResponse";
  static final java.lang.String _DEFINITION = "bool success";
  static final boolean _IS_SERVICE = true;
  static final boolean _IS_ACTION = false;
  boolean getSuccess();
  void setSuccess(boolean value);
}
