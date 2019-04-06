#!/usr/bin/env python

import rospy
from sensor_msgs.msg import JointState

rospy.init_node("publish_joint_states")

joint_states = rospy.Publisher("/joint_states", JointState, queue_size = 1)

def remap_hong_joint_states(data):
    if not rospy.is_shutdown():
        joint_states.publish(data)

def remap_kong_joint_states(data):
    if not rospy.is_shutdown():
        joint_states.publish(data)

rospy.Subscriber("/ns_hong/joint_states", JointState, remap_hong_joint_states)
rospy.Subscriber("/ns_kong/joint_states", JointState, remap_kong_joint_states)


rospy.spin()
