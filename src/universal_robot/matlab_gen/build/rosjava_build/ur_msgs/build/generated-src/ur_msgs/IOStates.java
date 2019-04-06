package ur_msgs;

public interface IOStates extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "ur_msgs/IOStates";
  static final java.lang.String _DEFINITION = "Digital[] digital_in_states\nDigital[] digital_out_states\nDigital[] flag_states\nAnalog[] analog_in_states\nAnalog[] analog_out_states\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  java.util.List<ur_msgs.Digital> getDigitalInStates();
  void setDigitalInStates(java.util.List<ur_msgs.Digital> value);
  java.util.List<ur_msgs.Digital> getDigitalOutStates();
  void setDigitalOutStates(java.util.List<ur_msgs.Digital> value);
  java.util.List<ur_msgs.Digital> getFlagStates();
  void setFlagStates(java.util.List<ur_msgs.Digital> value);
  java.util.List<ur_msgs.Analog> getAnalogInStates();
  void setAnalogInStates(java.util.List<ur_msgs.Analog> value);
  java.util.List<ur_msgs.Analog> getAnalogOutStates();
  void setAnalogOutStates(java.util.List<ur_msgs.Analog> value);
}
