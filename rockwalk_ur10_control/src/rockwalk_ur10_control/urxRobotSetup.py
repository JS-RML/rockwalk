import urx
import rospy
import math
import numpy as np
from tf import transformations as tfms
import math3d as m3d

from geometry_msgs.msg import Vector3, Point
from visualization_msgs.msg import Marker
from std_msgs.msg import Header, ColorRGBA

class RobotSetup:

    def __init__(self, robot_ip):

        self._robot = urx.Robot(robot_ip, use_rt=True)
        rospy.sleep(1)

    def get_robot(self):
        return self._robot


    def set_home_configuration_hong(self):

        rospy.loginfo("Moving hong robot to home configuration")
        hong_pose = m3d.Transform()
        hong_pose.pos = m3d.Vector([0.70, -0.58, 0.40])
        hong_pose.orient = m3d.Orientation([0, -1, 0,
                                            -1, 0, 0,
                                            0, 0, -1])

        self._robot.set_pose(hong_pose, acc=0.05, vel=0.05, wait=False)
        rospy.sleep(0.1)

    def set_home_configuration_kong(self):

        rospy.loginfo("Moving kong robot to home configuration")
        kong_pose = m3d.Transform()
        kong_pose.pos = m3d.Vector([-0.50, -0.80, 0.50])
        kong_pose.orient = m3d.Orientation([0, 1, 0,
                                            1, 0, 0,
                                            0, 0, -1])



        self._robot.set_pose(kong_pose, acc=0.05, vel=0.05, wait=False)
        rospy.sleep(0.1)


#single arm caging treadmill [-0.30, -0.80, 0.54]
#single arm caging turning [0.20, -0.90, 0.53]
#dual arm cable obtuse-angled configuration [-0.72, -0.60, 0.48]
#dual arm cable acute-angle configuration [-0.70, -0.55, 0.54]
