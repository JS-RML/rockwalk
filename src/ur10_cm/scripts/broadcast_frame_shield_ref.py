#!/usr/bin/env python

import rospy
import tf

if __name__=='__main__':
    rospy.init_node('braodcast_frame_shield_ref')

    broadcaster = tf.TransformBroadcaster()

    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        broadcaster.sendTransform((0,0.120,0.70),
                        (0.707, 0, 0, 0.707),
                        rospy.Time.now(),
                        "motion_shield_ref",
                        "world")
        rate.sleep()
