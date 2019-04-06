package ur_msgs;

public interface Analog extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "ur_msgs/Analog";
  static final java.lang.String _DEFINITION = "uint8 pin\nfloat32 state\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  byte getPin();
  void setPin(byte value);
  float getState();
  void setState(float value);
}
