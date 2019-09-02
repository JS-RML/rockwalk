import rospy
import math

from geometry_msgs.msg import Pose


def initial_robot_pose_1():

    target_pose = Pose()

    target_pose.position.x =  -0.65
    target_pose.position.y = 0
    target_pose.position.z = 0.58

    target_pose.orientation.x = -0.0260040764497
    target_pose.orientation.y = -0.701264425535
    target_pose.orientation.z = 0.712262067535
    target_pose.orientation.w = 0.0153212479218

    return target_pose
