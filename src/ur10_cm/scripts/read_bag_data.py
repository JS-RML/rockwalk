#!/usr/bin/env python

import rospy
import rosbag
from geometry_msgs.msg import TwistStamped, QuaternionStamped, Vector3Stamped


bag = rosbag.Bag('/home/nazir/data_rock_walk/2018-05-30-20-33-13.bag')

for topic, msg, t in bag.read_messages(topics=['twist_motion_shield']):
    print msg
bag.close()
