#!/usr/bin/env python
"""Subscribes to pose topic and and track the pose with UR-10 end-effector
Author: Abdullah Nazir"""

import sys
import rospy
import copy
import moveit_commander
from geometry_msgs.msg import Pose, PoseStamped, Point, Quaternion
import numpy as np
import scipy.io as sio


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

    def set_planning_scene(self):
        table_pose = PoseStamped()
        table_pose.header.frame_id = "world"
        table_pose.pose.orientation.w = 1.0
        table_name = "support_table"

        self._scene.add_box(table_name, table_pose, size=(1.8, 2.4, 0.18))

    def initialize_dual_arm_pose(self):

        self._dual_arm_init_pose = DualArmEff()

        self._dual_arm_init_pose.HongTargetPose.position.x = 0#-0.80
        self._dual_arm_init_pose.HongTargetPose.position.y = 0.25 #0.40
        self._dual_arm_init_pose.HongTargetPose.position.z = 0.50

        self._dual_arm_init_pose.HongTargetPose.orientation.x = 0.707
        self._dual_arm_init_pose.HongTargetPose.orientation.y = -0.707
        self._dual_arm_init_pose.HongTargetPose.orientation.z = 0
        self._dual_arm_init_pose.HongTargetPose.orientation.w = 0


        self._dual_arm_init_pose.KongTargetPose.position.x = 0#-0.80
        self._dual_arm_init_pose.KongTargetPose.position.y = -0.25 #-0.40
        self._dual_arm_init_pose.KongTargetPose.position.z = 0.50

        self._dual_arm_init_pose.KongTargetPose.orientation.x = 0.50
        self._dual_arm_init_pose.KongTargetPose.orientation.y = 0.50
        self._dual_arm_init_pose.KongTargetPose.orientation.z = 0.50
        self._dual_arm_init_pose.KongTargetPose.orientation.w = 0.50


        self.follow_target_pose(self._dual_arm_init_pose)


    def follow_target_pose(self, data):

        rospy.loginfo("Following Target Pose with End Effectors Now")

        try:
            self._group.set_pose_target(data.HongTargetPose, "hong_ee_link")
            self._group.set_pose_target(data.KongTargetPose, "kong_ee_link")

            plan = self._group.plan()

            self._group.execute(plan)

            self._group.clear_pose_targets()

        except rospy.ROSInterruptException:
            pass

    def import_left_right_rocking_matlab(self):
        # lr_rocking = sio.loadmat('/home/nazir/ws_moveit/src/ur10_cm/matlab_scripts/lr_rocking.mat')
        lr_rocking = sio.loadmat('~/ws_moveit/src/ur10_cm/matlab_scripts/lr_rocking.mat')

        self._right_rocking_target = lr_rocking['right_rock']
        self._left_rocking_target = lr_rocking['left_rock']


    def set_dual_arm_pose(self, rock_sign, count_right_rock, count_left_rock):
        """
        rock_sign: -1 for left rock. 1 for right rock. To make sure only alternate rocks
        """

        if rock_sign == 1:
            #right rock
            self.relocate_dual_arm_right(count_right_rock)
            rock_sign = -1*rock_sign
            count_right_rock += 1
            rospy.sleep(1)
        else:
            #left rock
            self.relocate_dual_arm_left(count_left_rock)
            rock_sign = -1*rock_sign
            count_left_rock += 1
            rospy.sleep(1)

        return rock_sign, count_right_rock, count_left_rock


    def relocate_dual_arm_right(self, count_right_rock):

        right_dual_arm_pose = DualArmEff()
        #note the signs below. maltab frame didnot align with world frame here. (-y,x)
        right_dual_arm_pose.HongTargetPose.position.x = self._dual_arm_init_pose.HongTargetPose.position.x + self._right_rocking_target[count_right_rock, 1]
        right_dual_arm_pose.HongTargetPose.position.y = self._dual_arm_init_pose.HongTargetPose.position.y - self._right_rocking_target[count_right_rock, 0]
        right_dual_arm_pose.HongTargetPose.position.z = self._dual_arm_init_pose.HongTargetPose.position.z
        right_dual_arm_pose.HongTargetPose.orientation = copy.deepcopy(self._dual_arm_init_pose.HongTargetPose.orientation)

        right_dual_arm_pose.KongTargetPose.position.x = self._dual_arm_init_pose.KongTargetPose.position.x + self._right_rocking_target[count_right_rock, 1]
        right_dual_arm_pose.KongTargetPose.position.y = self._dual_arm_init_pose.KongTargetPose.position.y - self._right_rocking_target[count_right_rock, 0]
        right_dual_arm_pose.KongTargetPose.position.z = self._dual_arm_init_pose.KongTargetPose.position.z
        right_dual_arm_pose.KongTargetPose.orientation = copy.deepcopy(self._dual_arm_init_pose.KongTargetPose.orientation)

        self.follow_target_pose(right_dual_arm_pose)


    def relocate_dual_arm_left(self, count_left_rock):

        left_dual_arm_pose = DualArmEff()
        #note the signs below. maltab frame didnot align with world frame here. (-y,x)
        left_dual_arm_pose.HongTargetPose.position.x = self._dual_arm_init_pose.HongTargetPose.position.x + self._left_rocking_target[count_right_rock, 1]
        left_dual_arm_pose.HongTargetPose.position.y = self._dual_arm_init_pose.HongTargetPose.position.y - self._left_rocking_target[count_right_rock, 0]
        left_dual_arm_pose.HongTargetPose.position.z = self._dual_arm_init_pose.HongTargetPose.position.z
        left_dual_arm_pose.HongTargetPose.orientation = copy.deepcopy(self._dual_arm_init_pose.HongTargetPose.orientation)

        left_dual_arm_pose.KongTargetPose.position.x = self._dual_arm_init_pose.KongTargetPose.position.x + self._left_rocking_target[count_right_rock, 1]
        left_dual_arm_pose.KongTargetPose.position.y = self._dual_arm_init_pose.KongTargetPose.position.y - self._left_rocking_target[count_right_rock, 0]
        left_dual_arm_pose.KongTargetPose.position.z = self._dual_arm_init_pose.KongTargetPose.position.z
        left_dual_arm_pose.KongTargetPose.orientation = copy.deepcopy(self._dual_arm_init_pose.KongTargetPose.orientation)

        self.follow_target_pose(left_dual_arm_pose)



if __name__ == '__main__':
    rospy.init_node("dual_arm_python", anonymous=True)

    group_dual_arm = "dual_arm"
    topic = "target_pose_hong_kong"

    """Initializating the two robot arms with the robot control class"""
    dual_arm_hong_kong = robot_control(group_dual_arm)


    """Import left and right rocking positions from Matlab model"""
    dual_arm_hong_kong.import_left_right_rocking_matlab()

    dual_arm_hong_kong.initialize_dual_arm_pose()

    # rospy.sleep(2)


    """Initialize some parameters"""
    count_right_rock = 0
    count_left_rock = 0
    rocking_steps = 20 # based on the Matlab script
    rock_sign = -1; #-1 for left rock. 1 for right rock. To make sure only alternate rocks


    rate = rospy.Rate(50)
    count = 1
    while not rospy.is_shutdown():

        """Initializing planning scene for the dual arm robot"""
        dual_arm_hong_kong.set_planning_scene()


        rock_sign, count_right_rock, count_left_rock = dual_arm_hong_kong.set_dual_arm_pose(rock_sign,
                                                                                        count_right_rock,
                                                                                        count_left_rock)



    # rospy.loginfo("Subscribing to Pose Topic")
    # rospy.Subscriber(topic, DualArmEff, dual_arm_hong_kong.follow_target_pose) # Tracks Effector Here



    rospy.spin()
