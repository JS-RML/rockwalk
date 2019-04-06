package moveit_msgs;

public interface PickupFeedback extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/PickupFeedback";
  static final java.lang.String _DEFINITION = "\n# The internal state that the pickup action currently is in\nstring state";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = true;
  java.lang.String getState();
  void setState(java.lang.String value);
}
