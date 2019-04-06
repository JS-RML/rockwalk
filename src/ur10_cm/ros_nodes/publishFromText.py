#!/usr/bin/env python

import rospy
import numpy
import copy

from ur_msgs.msg import DualArmEff

from geometry_msgs.msg import Pose

from hong_kong_dual_arm_manipulation_test import robot_control

dual_arm_pose_publisher = rospy.Publisher("target_pose_hong_kong", DualArmEff, queue_size=10)


def setMsgData(msg, hong_data, kong_data, i, hong_arm_init_pose, kong_arm_init_pose, dir):
    msg.HongTargetPose.position.x = hong_data[i,0]
    msg.HongTargetPose.position.y = hong_data[i,1]
    msg.HongTargetPose.position.z = hong_arm_init_pose.position.z - dir*0.05

    msg.HongTargetPose.orientation = copy.deepcopy(hong_arm_init_pose.orientation)



    msg.KongTargetPose.position.x = kong_data[i,0]
    msg.KongTargetPose.position.y = kong_data[i,1]
    msg.KongTargetPose.position.z = kong_arm_init_pose.position.z + dir*0.05

    msg.KongTargetPose.orientation = copy.deepcopy(kong_arm_init_pose.orientation)


    return msg


if __name__ == '__main__':

    rospy.init_node("target_pose_publisher", anonymous=True)

    hong_data = numpy.genfromtxt("/home/nazir/Documents/MATLAB/RW-Motion/hong_manipulator_motion.txt", skip_header=1)
    kong_data = numpy.genfromtxt("/home/nazir/Documents/MATLAB/RW-Motion/kong_manipulator_motion.txt", skip_header=1)

    pub_rate = rospy.Rate(0.16) # 10hz
    #while not rospy.is_shutdown():

    hong_arm_group = robot_control("hong_arm")
    kong_arm_group = robot_control("kong_arm")

    hong_arm_init_pose = Pose()
    kong_arm_init_pose = Pose()

    hong_arm_init_pose = copy.deepcopy(hong_arm_group.get_current_pose().pose)
    kong_arm_init_pose = copy.deepcopy(kong_arm_group.get_current_pose().pose)

    print(hong_arm_init_pose)
    print(kong_arm_init_pose)


    reverse = False

    dir = 1 #To adjust the z coordinate

    if not reverse:

        for i in range(hong_data.shape[0]):

                msg = DualArmEff()
                setted_msg = setMsgData(msg, hong_data, kong_data, i, hong_arm_init_pose, kong_arm_init_pose, dir)

                dual_arm_pose_publisher.publish(setted_msg)

                dir = -1*dir

                pub_rate.sleep()

    else:
        for i in range(hong_data.shape[0]):
            msg = DualArmEff()
            setted_msg = setMsgData(msg, hong_data, kong_data, -i-1, hong_arm_init_pose, kong_arm_init_pose)

            dual_arm_pose_publisher.publish(setted_msg)

            pub_rate.sleep()



    rospy.spin()
