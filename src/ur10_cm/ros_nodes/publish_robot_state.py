#!/usr/bin/env python

import sys
import rospy
import copy
import math
import tf
from geometry_msgs.msg import Pose, Point, Quaternion, Vector3
from geometry_msgs.msg import PoseStamped, QuaternionStamped, TwistStamped, AccelStamped, Vector3Stamped
from geometry_msgs.msg import PoseArray
from visualization_msgs.msg import Marker
from std_msgs.msg import Header, ColorRGBA
from tf import transformations as tfms
import tf_conversions as tfc
from hong_rigid_effector_control import manipulation_control_law


if __name__ == '__main__':
    rospy.init_node("publish_robot_state", anonymous=True)

    kong_manipulator_control = manipulation_control_law("kong_arm")

    rate = rospy.Rate(10)

    while not rospy.is_shutdown():

        kong_manipulator_control.publish_end_effector_pose()

        rate.sleep()

    rospy.spin()
