package ur_msgs;

public interface ToolDataMsg extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "ur_msgs/ToolDataMsg";
  static final java.lang.String _DEFINITION = "# This data structure contains the ToolData structure\n# used by the Universal Robots controller\n\nint8 ANALOG_INPUT_RANGE_CURRENT = 0\nint8 ANALOG_INPUT_RANGE_VOLTAGE = 1\n\nint8 analog_input_range2 # one of ANALOG_INPUT_RANGE_*\nint8 analog_input_range3 # one of ANALOG_INPUT_RANGE_*\nfloat64 analog_input2\nfloat64 analog_input3\nfloat32 tool_voltage_48v\nuint8 tool_output_voltage\nfloat32 tool_current\nfloat32 tool_temperature\n\nuint8 TOOL_BOOTLOADER_MODE = 249\nuint8 TOOL_RUNNING_MODE = 253\nuint8 TOOL_IDLE_MODE = 255\n\nuint8 tool_mode # one of TOOL_*\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  static final byte ANALOG_INPUT_RANGE_CURRENT = 0;
  static final byte ANALOG_INPUT_RANGE_VOLTAGE = 1;
  static final byte TOOL_BOOTLOADER_MODE = -7;
  static final byte TOOL_RUNNING_MODE = -3;
  static final byte TOOL_IDLE_MODE = -1;
  byte getAnalogInputRange2();
  void setAnalogInputRange2(byte value);
  byte getAnalogInputRange3();
  void setAnalogInputRange3(byte value);
  double getAnalogInput2();
  void setAnalogInput2(double value);
  double getAnalogInput3();
  void setAnalogInput3(double value);
  float getToolVoltage48v();
  void setToolVoltage48v(float value);
  byte getToolOutputVoltage();
  void setToolOutputVoltage(byte value);
  float getToolCurrent();
  void setToolCurrent(float value);
  float getToolTemperature();
  void setToolTemperature(float value);
  byte getToolMode();
  void setToolMode(byte value);
}
