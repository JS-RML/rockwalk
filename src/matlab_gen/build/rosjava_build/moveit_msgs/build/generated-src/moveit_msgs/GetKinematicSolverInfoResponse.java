package moveit_msgs;

public interface GetKinematicSolverInfoResponse extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "moveit_msgs/GetKinematicSolverInfoResponse";
  static final java.lang.String _DEFINITION = "KinematicSolverInfo kinematic_solver_info";
  static final boolean _IS_SERVICE = true;
  static final boolean _IS_ACTION = false;
  moveit_msgs.KinematicSolverInfo getKinematicSolverInfo();
  void setKinematicSolverInfo(moveit_msgs.KinematicSolverInfo value);
}
