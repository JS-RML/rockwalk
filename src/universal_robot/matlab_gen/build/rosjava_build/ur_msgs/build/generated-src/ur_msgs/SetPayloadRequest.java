package ur_msgs;

public interface SetPayloadRequest extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "ur_msgs/SetPayloadRequest";
  static final java.lang.String _DEFINITION = "float32 payload\n";
  static final boolean _IS_SERVICE = true;
  static final boolean _IS_ACTION = false;
  float getPayload();
  void setPayload(float value);
}
