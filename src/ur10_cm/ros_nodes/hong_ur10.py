#!/usr/bin/env python
"""Subscribes to pose topic and and track the pose with UR-10 end-effector
Author: Abdullah Nazir"""

import sys
import rospy
import copy
import moveit_commander
from geometry_msgs.msg import Pose, PoseStamped, Point, Quaternion

sys.dont_write_bytecode = True

class robot_control:
    """Initializes robot with moveit and provides methods for tracking effector
    pose
    Parmaeters:
    Group Name
    """

    def __init__(self, group):

        moveit_commander.roscpp_initialize(sys.argv) #Check this line. And also how to control two robots

        self._robot = moveit_commander.RobotCommander()
        self._scene = moveit_commander.PlanningSceneInterface()
        self._group = moveit_commander.MoveGroupCommander(group)

    def set_planning_scene(self):
        pass

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

    group = "hong_arm"
    topic = "/hong_ur10/pose_to_follow"

    hong_ur10 = robot_control(group) #Intialize robot control class


    hong_ur10.set_vel_scaling(0.2)
    hong_ur10.set_accel_scaling(0.4)


    rospy.loginfo("Subscribing to Pose Topic")
    rospy.Subscriber(topic, PoseStamped, hong_ur10.follow_target_pose) # Tracks Effector Here

    rospy.spin()
