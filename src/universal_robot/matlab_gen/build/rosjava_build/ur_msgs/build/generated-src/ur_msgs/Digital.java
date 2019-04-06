package ur_msgs;

public interface Digital extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "ur_msgs/Digital";
  static final java.lang.String _DEFINITION = "uint8 pin\nbool state\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  byte getPin();
  void setPin(byte value);
  boolean getState();
  void setState(boolean value);
}
