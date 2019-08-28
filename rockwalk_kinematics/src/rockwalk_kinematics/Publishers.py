import rospy

from geometry_msgs.msg import Vector3, PoseStamped, TwistStamped



class KinematicsPublishers:

    def __init__(self, object_kinematics):
        self._object_kinematics = object_kinematics
        self.initialize_publishers()

    def initialize_publishers(self):
        rospy.loginfo("Initializing the Following Publishers")

        self._ginsberg_euler_publisher = rospy.Publisher('euler_ginsberg', Vector3, queue_size=10)
        self._ginsberg_twist_publisher = rospy.Publisher('twist_ginsberg', TwistStamped, queue_size=10)
        self._object_pose_publisher = rospy.Publisher('object_pose', PoseStamped, queue_size=10)
        self._object_ground_contact_position_publisher = rospy.Publisher('ground_contact_coordinates',
                                                                          Vector3, queue_size=10)

    def publish_data(self):

        self._ginsberg_euler_publisher.publish(self._object_kinematics._ginsberg_euler)
        self._ginsberg_twist_publisher.publish(self._object_kinematics._ginsberg_twist)
        self._object_pose_publisher.publish(self._object_kinematics._object_pose)
        self._object_ground_contact_position_publisher.publish(self._object_kinematics._ground_contact_position)
