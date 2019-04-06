package moveit_msgs;

public interface LinkScale extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/LinkScale";
  static final java.lang.String _DEFINITION = "#name for the link\nstring link_name\n\n# scaling to apply to the link\nfloat64 scale\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  java.lang.String getLinkName();
  void setLinkName(java.lang.String value);
  double getScale();
  void setScale(double value);
}
