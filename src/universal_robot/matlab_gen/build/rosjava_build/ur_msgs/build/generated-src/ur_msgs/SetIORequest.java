package ur_msgs;

public interface SetIORequest extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "ur_msgs/SetIORequest";
  static final java.lang.String _DEFINITION = "int8 FUN_SET_DIGITAL_OUT = 1\nint8 FUN_SET_FLAG = 2\nint8 FUN_SET_ANALOG_OUT = 3\nint8 FUN_SET_TOOL_VOLTAGE = 4\nint8 fun\nint8 pin\nfloat32 state\n";
  static final boolean _IS_SERVICE = true;
  static final boolean _IS_ACTION = false;
  static final byte FUN_SET_DIGITAL_OUT = 1;
  static final byte FUN_SET_FLAG = 2;
  static final byte FUN_SET_ANALOG_OUT = 3;
  static final byte FUN_SET_TOOL_VOLTAGE = 4;
  byte getFun();
  void setFun(byte value);
  byte getPin();
  void setPin(byte value);
  float getState();
  void setState(float value);
}
