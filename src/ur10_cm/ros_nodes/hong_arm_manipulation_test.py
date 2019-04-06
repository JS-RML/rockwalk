#!/usr/bin/env python
"""Subscribes to pose topic and and track the pose with UR-10 end-effector
Author: Abdullah Nazir"""

import sys
import rospy
import copy
import moveit_commander
from geometry_msgs.msg import Pose, PoseStamped, Point, Quaternion

from ur_msgs.msg import DualArmEff

sys.dont_write_bytecode = True #prevents generating .pyc file

class robot_control:
    """Initializes a robot arm with moveit and provides methods
    for tracking effector pose
    @param: group name of the arm to manipulate
    """

    def __init__(self, group):

        moveit_commander.roscpp_initialize(sys.argv) #Check this line. And also how to control two robots

        self._robot = moveit_commander.RobotCommander("robot_description")
        self._scene = moveit_commander.PlanningSceneInterface()
        self._group = moveit_commander.MoveGroupCommander(group)


    def get_current_pose(self):
        return self._group.get_current_pose()

    def set_vel_scaling (self, factor):
        self._group.set_max_velocity_scaling_factor(factor)


    def set_accel_scaling (self, factor):
        self._group.set_max_acceleration_scaling_factor(factor)


    def initialize_hong_arm_pose(self):


        hong_arm_init_pose = Pose()

        hong_arm_init_pose.position.x = -0.550270429318
        hong_arm_init_pose.position.y = 2.07447302508
        hong_arm_init_pose.position.z = 0.599969959373

        hong_arm_init_pose.orientation.x = -0.460405688664
        hong_arm_init_pose.orientation.y = -0.531863606167
        hong_arm_init_pose.orientation.z =0.53313322292
        hong_arm_init_pose.orientation.w = 0.470017736792



        self.follow_target_pose(hong_arm_init_pose)


    def follow_target_pose(self, data):

        rospy.loginfo("Following Target Pose with End Effectors Now")

        try:
            self._group.set_pose_target(data, "hong_ee_link")

            plan = self._group.plan()

            self._group.execute(plan)

            self._group.clear_pose_targets()

        except rospy.ROSInterruptException:
            pass

if __name__ == '__main__':
    rospy.init_node("hong_arm_python", anonymous=True)

    topic = "target_pose_hong"

    """Initializating the two robot arms with the robot control class"""
    hong_arm_group = robot_control("hong_arm")

    """Setting control properties for the two robot arms"""
    hong_arm_group.set_vel_scaling(0.10)
    hong_arm_group.set_accel_scaling(0.10)


    #hong_arm_group.initialize_hong_arm_pose()
    rospy.sleep(1)

    rospy.loginfo("Subscribing to Pose Topic")
    rospy.Subscriber(topic, Pose, hong_arm_group.follow_target_pose) # Tracks Effector Here





    rospy.spin()
