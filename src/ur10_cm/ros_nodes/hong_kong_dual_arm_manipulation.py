#!/usr/bin/env python
"""Subscribes to pose topic and and track the pose with UR-10 end-effector
Author: Abdullah Nazir"""

import sys
import rospy
import copy
import moveit_commander
from geometry_msgs.msg import Pose, PoseStamped, Point, Quaternion

class robot_control:
    """Initializes a robot arm with moveit and provides methods
    for tracking effector pose
    @param: group name of the arm to manipulate
    """

    def __init__(self, group):

        moveit_commander.roscpp_initialize(sys.argv) #Check this line. And also how to control two robots

        self._robot = moveit_commander.RobotCommander()
        self._scene = moveit_commander.PlanningSceneInterface()
        self._group = moveit_commander.MoveGroupCommander(group)


    def set_vel_scaling (self, factor):
        self._group.set_max_velocity_scaling_factor(factor)


    def set_accel_scaling (self, factor):
        self._group.set_max_acceleration_scaling_factor(factor)

    def follow_target_pose(self, data):

        rospy.loginfo("Following Target Pose with End Effector Now")

        try:
            self._group.set_pose_target(data.pose)
            plan = self._group.plan()
            self._group.execute(plan)
            self._group.clear_pose_targets()

        except rospy.ROSInterruptException:
            pass

if __name__ == '__main__':
    rospy.init_node("hong_ur10", anonymous=True)

    group_hong = "hong_arm" # group name for hong arm as defined in moveit_config package
    group_kong = "kong_arm" # group name for kong arm as defined in moveit_config package

    target_pose_topic_hong = "/hong_ur10/pose_to_follow" # Pose topic which hong arm subscribes to
    target_pose_topic_kong = "/kong_ur10/pose_to_follow" # Pose topic which kong arm subscribes to


    """Initializating the two robot arms with the robot control class"""
    hong_ur10 = robot_control(group_hong)
    kong_ur10 = robot_control(group_kong)


    """Setting control properties for the two robot arms"""
    hong_ur10.set_vel_scaling(0.2)
    hong_ur10.set_accel_scaling(0.2)

    kong_ur10.set_vel_scaling(0.2)
    kong_ur10.set_accel_scaling(0.2)


    """Subscribing to target pose topics here"""

    rospy.loginfo("Subscribing to pose topic for hong_ur10")
    rospy.Subscriber(target_pose_topic_hong, PoseStamped, hong_ur10.follow_target_pose) # tracks hong effector according to the target pose


    rospy.loginfo("Subscribing to pose topic for kong_ur10")
    rospy.Subscriber(target_pose_topic_kong, PoseStamped, kong_ur10.follow_target_pose) # tracks kong effector according to the pose topic


    rospy.spin()
