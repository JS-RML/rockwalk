import rospy
import math

import numpy as np



def zero_velocity_pos_phi(body_euler, body_twist):\

    if abs(body_twist.twist.angular.z) < np.degrees(5) and body_euler.z > 0:
        return True

    else:
        return False


def zero_velocity_neg_phi(body_euler, body_twist):

    if abs(body_twist.twist.angular.z) < np.degrees(5) and body_euler.z > 0:
        return True

    else:
        return False


def zero_phi_pos_velocity(body_euler, body_twist):

    if abs(body_euler.z) < np.degrees(2) and body_twist.twist.angular.z > 0:
        return True

    else:
        return False


def zero_phi_neg_velocity(body_euler, body_twist):

    if abs(body_euler.z) < np.degrees(2) and body_twist.twist.angular.z < 0:
        return True

    else:
        return False
