import copy
import numpy as np

import rospy
from geometry_msgs.msg import Pose

from rockwalk_planner.srv import *



def request_next_apex_point(rockwalk_step):

    rospy.wait_for_service('apex_point')

    try:
        apex_point_handle = rospy.ServiceProxy('apex_point', ApexPoint)
        response = apex_point_handle(rockwalk_step)
        return response.apex_point

    except rospy.ServiceException, e:
        print "Service call failed: %s"%e


def zigzag_relocation_timing(rockwalk_step, body_euler, body_twist, ur10_moveit_control, initial_pose):


    if abs(body_twist.twist.angular.z) < np.radians(5) and body_euler.z > np.radians(10) and (rockwalk_step % 2) == 0:

        rospy.loginfo("Left Rock")

        next_apex_point = request_next_apex_point(rockwalk_step)

        target_pose = Pose()
        target_pose.position.x = initial_pose.position.x + next_apex_point.x
        target_pose.position.y = initial_pose.position.y + next_apex_point.y
        target_pose.position.z = initial_pose.position.z + next_apex_point.z

        target_pose.orientation = copy.deepcopy(initial_pose.orientation)

        ur10_moveit_control.reach_target_pose(target_pose)

        rockwalk_step += 1

        return rockwalk_step


    elif abs(body_twist.twist.angular.z) < np.radians(5) and body_euler.z < np.radians(-10) and (rockwalk_step % 2) == 1:

        rospy.loginfo("Right Rock")

        next_apex_point = request_next_apex_point(rockwalk_step)


        target_pose = Pose()
        target_pose.position.x = initial_pose.position.x + next_apex_point.x
        target_pose.position.y = initial_pose.position.y + next_apex_point.y
        target_pose.position.z = initial_pose.position.z + next_apex_point.z

        target_pose.orientation = copy.deepcopy(initial_pose.orientation)

        ur10_moveit_control.reach_target_pose(target_pose)

        rockwalk_step += 1

        return rockwalk_step


    else:
        return rockwalk_step
