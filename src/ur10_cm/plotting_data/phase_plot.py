#!/usr/bin/env python

import rospy
import copy
import math
from matplotlib import pyplot as plt
from geometry_msgs.msg import TwistStamped, Vector3Stamped


class PhasePlot:
    def __init__(self):
        self.euler_msg = None
        self.twist_msg = None

    def euler_cb(self, msg):
        self.euler_msg = msg

        self.plot()

    def twist_cb(self, msg):
        self.twist_msg = msg

        #self.plot()

    def plot(self):
        if self.euler_msg is not None and self.twist_msg is not None:

            plt.plot(self.euler_msg.vector.y, self.twist_msg.twist.angular.y, '.r-')
            plt.axis("equal")

            plt.draw()
            plt.pause(0.0000000000000000000000000000000000000000000000000000000000000001)





if __name__ == '__main__':
    rospy.init_node('phase_plot')

    phasePlot = PhasePlot()

    rospy.Subscriber('euler_motion_shield', Vector3Stamped , phasePlot.euler_cb)


    rospy.Subscriber('twist_motion_shield', TwistStamped, phasePlot.twist_cb)

    plt.ion()
    plt.show(block=True)

    rospy.spin()
