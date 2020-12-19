import rospy

from std_msgs.msg import Float64
from geometry_msgs.msg import Pose, Twist, Wrench
from sensor_msgs.msg import JointState



class RobotControlPublishers:

    def __init__(self):
        pass

    def initialize_publishers_1(self):

        rospy.loginfo("Publishing the following topics: tcp_pose and tcp_force")

        self._hong_tcp_pose_publisher = rospy.Publisher('hong_tcp_pose', Pose, queue_size=10)
        self._hong_wrench_publisher = rospy.Publisher('hong_tcp_force', Wrench, queue_size=10)

        self._kong_joint_state_publisher = rospy.Publisher('kong_joint_state', JointState, queue_size=10)
        self._kong_tcp_pose_publisher = rospy.Publisher('kong_tcp_pose', Pose, queue_size=10)
        self._kong_wrench_publisher = rospy.Publisher('kong_tcp_force', Wrench, queue_size=10)


    def initialize_publishers_2(self):

        self._control_action_publisher = rospy.Publisher('control_action', Float64, queue_size=10)
