#!/usr/bin/env python

import rospy
import copy
import tf
import math
from geometry_msgs.msg import QuaternionStamped, Quaternion
from geometry_msgs.msg import Vector3


def euler_cb(data, euler_publisher):

    unit_quat_vec = tf.transformations.unit_vector([data.quaternion.x/1000,
                                                    data.quaternion.y/1000,
                                                    data.quaternion.z/1000,
                                                    data.quaternion.w/1000])

    unit_quat = Quaternion(unit_quat_vec[0], unit_quat_vec[1], unit_quat_vec[2], unit_quat_vec[3])

    euler_zyx = tf.transformations.euler_from_quaternion([unit_quat_vec[0],
                                                            unit_quat_vec[1],
                                                            unit_quat_vec[2],
                                                            unit_quat_vec[3]], axes='szxy')

    euler_vector3 = Vector3(math.degrees(euler_zyx[0]),
                            math.degrees(euler_zyx[1]),
                            math.degrees(euler_zyx[2]))

    euler_publisher.publish(euler_vector3)




if __name__ == '__main__':

    rospy.init_node("unit_quat", anonymous=True)


    # quat_publisher = rospy.Publisher("unit_quat_motion_shield", Quaternion, queue_size=10)
    euler_publisher = rospy.Publisher("euler_motion_shield", Vector3, queue_size=10)


    rospy.Subscriber('quat_motion_shield', QuaternionStamped, euler_cb, euler_publisher)

    rospy.spin()
