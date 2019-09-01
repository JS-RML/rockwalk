import sys
import rospy
import moveit_commander

from geometry_msgs.msg import PoseStamped, Pose, Point, Quaternion


class MoveitControl:
    def __init__(self, group):
        moveit_commander.roscpp_initialize(sys.argv) #Check this line. And also how to control two robots

        self._robot = moveit_commander.RobotCommander("robot_description")
        self._scene = moveit_commander.PlanningSceneInterface()
        self._group = moveit_commander.MoveGroupCommander(group)

        rospy.sleep(2) # important. otherwise, scene will not set up


    def reach_target_pose(self, target_pose):
        """Given target pose and the group, reach the target pose.
        Use this when you want your robot to move one pose at a time.
        """
        try:
            rospy.loginfo("Following Target Pose with End Effectors Now")

            self._group.set_pose_target(target_pose)
            plan = self._group.plan()
            self._group.execute(plan)
            self._group.clear_pose_targets()

            rospy.sleep(0.1)

        except rospy.ROSInterruptException:
            pass

    def follow_target_waypoints(self, waypoints):
        """Follow sequence of waypoints (PoseArray type)"""

        try:

            (plan, fraction) = self._group.compute_cartesian_path(waypoints,0.005,0.0)

            if fraction > 0.70:

                rospy.loginfo("Following Target Waypoints")
                self._group.execute(plan, wait=True)

                rospy.sleep(0.1)

        except rospy.ROSInterruptException:
            pass


    def setup_planning_scene(self):

        rospy.loginfo("Adding table to planning scene")

        table_pose = PoseStamped()
        table_pose.header.frame_id = self._robot.get_planning_frame()
        table_pose.pose = Pose(Point(0,0,-0.25), Quaternion(0,0,0,1))

        self._scene.add_box("table", table_pose, size = (0.5,0.5,0.5))

        rospy.sleep(0.1)
