import rospy
import copy
from geometry_msgs.msg import Vector3, TwistStamped



class SubscriberRockwalkKinematics:
    """Subscribers for topics published by rockwalk_kinematics package.
    Subscribed data used for feedback control of rockwalk.
    """

    def __init__(self):

        self._body_euler_sub = rospy.Subscriber("body_euler", Vector3, self.store_body_euler_data)

        self._body_twist_sub = rospy.Subscriber("body_twist", TwistStamped, self.store_body_twsit_data)


    def store_body_euler_data(self, body_euler_data):
        self._body_euler = copy.deepcopy(body_euler_data)


    def store_body_twsit_data(self, body_twist_data):
        self._body_twist = copy.deepcopy(body_twist_data)
