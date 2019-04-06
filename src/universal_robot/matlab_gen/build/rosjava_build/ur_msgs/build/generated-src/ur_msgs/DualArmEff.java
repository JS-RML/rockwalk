package ur_msgs;

public interface DualArmEff extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "ur_msgs/DualArmEff";
  static final java.lang.String _DEFINITION = "Header header\ngeometry_msgs/Pose hong_target_pose\ngeometry_msgs/Pose kong_target_pose\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  std_msgs.Header getHeader();
  void setHeader(std_msgs.Header value);
  geometry_msgs.Pose getHongTargetPose();
  void setHongTargetPose(geometry_msgs.Pose value);
  geometry_msgs.Pose getKongTargetPose();
  void setKongTargetPose(geometry_msgs.Pose value);
}
