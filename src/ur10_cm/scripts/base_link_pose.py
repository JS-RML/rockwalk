#!/usr/bin/env python

"""Format to quaternion naming:
    quat_frameA_frameB := orientation of frameB
    expressed in frameA."""

import rospy
import tf
from geometry_msgs.msg import Quaternion, QuaternionStamped, TwistStamped
from std_msgs.msg import Float64
from tf import transformations as tfms
import math



def quat_cb(data, broadcaster):

    quat_ref_base = [0.707, 0, 0, 0.707] # reference orientation of shield frame relative to world frame. Base aligns with world frame

    quat_earth_ref = [0.7106, 0.00933, 0.02892, 0.7029] #Need to determine this emprically


    quat_earth_sensor = tfms.unit_vector([data.quaternion.x/1000,
                                          data.quaternion.y/1000,
                                          data.quaternion.z/1000,
                                          data.quaternion.w/1000])


    quat_ref_sensor = tfms.quaternion_multiply(quat_earth_sensor, tfms.quaternion_inverse(quat_earth_ref)) #check commutation

    quat_sensor_base =  tfms.quaternion_multiply(quat_ref_base, tfms.quaternion_inverse(quat_ref_sensor))


    euler_sensor_base = tfms.euler_from_quaternion(quat_sensor_base)

    pos_x = 0 #- 0.4*math.sin(euler_sensor_base[1])
    pos_y = 0.120# - 0.4*math.sin(euler_sensor_base[0])
    pos_z = 0.70 #- 0.4*(math.sin(euler_sensor_base[1]) + math.sin(euler_sensor_base[2]))

    pos_sensor_base = qv_mult(quat_sensor_base, [pos_x, pos_y, pos_z])

    broadcaster.sendTransform((pos_sensor_base[0], pos_sensor_base[1], pos_sensor_base[2]),
                    (quat_sensor_base[0], quat_sensor_base[1], quat_sensor_base[2], quat_sensor_base[3]),
                    rospy.Time.now(),
                    "base_link",
                    "motion_shield_ref")





if __name__=='__main__':
    rospy.init_node('base_link_pos')

    broadcaster = tf.TransformBroadcaster()

    rospy.Subscriber('quat_motion_shield', QuaternionStamped, quat_cb, broadcaster)


    rospy.spin()
