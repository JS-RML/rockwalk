package moveit_msgs;

public interface PlaceFeedback extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/PlaceFeedback";
  static final java.lang.String _DEFINITION = "\n# The internal state that the place action currently is in\nstring state";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = true;
  java.lang.String getState();
  void setState(java.lang.String value);
}
