import rospy
import copy
from geometry_msgs.msg import QuaternionStamped, TwistStamped

from tf import transformations as tfms


class SubscriberMotionShield:
    """Subscriber to Quaternion and Twist topics from 9-axis arduino motion shield
    """

    def __init__(self):

        rospy.loginfo("Subscribing to Quaternion Topic from Motion Shield")
        self._quaternion_sub =rospy.Subscriber("quat_motion_shield", QuaternionStamped, self.store_quaternion_data)

        rospy.loginfo("Subscribing to Twist Topic from Motion Shield")
        self._twist_sub =rospy.Subscriber("twist_motion_shield", TwistStamped, self.store_twist_data)

    def store_quaternion_data(self, quaternion_data):
        self._quaternion = copy.deepcopy(quaternion_data)

        self._unit_imu_quaternion = tfms.unit_vector([self._quaternion.quaternion.x/1000.0,
                                                      self._quaternion.quaternion.y/1000.0,
                                                      self._quaternion.quaternion.z/1000.0,
                                                      self._quaternion.quaternion.w/1000.0])


    def store_twist_data(self, twist_data):
        self._twist = copy.deepcopy(twist_data)
