#!/usr/bin/env python

import rospy
import numpy
import copy

#from ur_msgs.msg import DualArmEff

from geometry_msgs.msg import Pose

from hong_kong_dual_arm_manipulation_test import robot_control

hong_arm_pose_publisher = rospy.Publisher("target_pose_hong", Pose, queue_size=10)


def setMsgData(msg, hong_data, i, hong_arm_curr_pose):
    msg.position.x = hong_arm_curr_pose.position.x + hong_data[i,0]
    msg.position.y = hong_arm_curr_pose.position.y + hong_data[i,1]
    msg.position.z = hong_arm_curr_pose.position.z + 0.01#- dir*0.05

    msg.orientation = copy.deepcopy(hong_arm_curr_pose.orientation)

    return msg


if __name__ == '__main__':

    rospy.init_node("target_pose_publisher", anonymous=True)

    hong_data = numpy.genfromtxt("/home/nazir/Documents/MATLAB/CDRM_Control/hong_manipulator_motion.txt", skip_header=1)

    pub_rate = rospy.Rate(0.2)
    #while not rospy.is_shutdown():

    hong_arm_group = robot_control("hong_arm")

    hong_arm_init_pose = Pose()

    hong_arm_init_pose = copy.deepcopy(hong_arm_group.get_current_pose().pose)

    print(hong_arm_init_pose)


    reverse = False


    if not reverse:

        for i in range(hong_data.shape[0]):

                msg = Pose()
                hong_arm_curr_pose = copy.deepcopy(hong_arm_group.get_current_pose().pose)

                setted_msg = setMsgData(msg, hong_data, i, hong_arm_curr_pose)

                hong_arm_pose_publisher.publish(setted_msg)


                pub_rate.sleep()

    else:
        for i in range(hong_data.shape[0]):
            msg = Pose()
            setted_msg = setMsgData(msg, hong_data, -i-1, hong_arm_init_pose, dir)

            hong_arm_pose_publisher.publish(setted_msg)

            pub_rate.sleep()



    rospy.spin()
