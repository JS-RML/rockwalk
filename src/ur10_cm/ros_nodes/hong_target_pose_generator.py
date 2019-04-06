#!/usr/bin/env python
"""Offers interface between target_poses and the robot. The class in this node
also contains a method to generate virtual target poses for testing purposes
Author: Abdullah Nazir"""

from __future__ import division
import copy
import rospy
import tf
from geometry_msgs.msg import Pose, PoseStamped, Point, Quaternion

from hong_ur10 import robot_control

class pose_generator:
    """Generates a sequence of waypoints between
    any two inital configurations using linear interpolation for position
    and slerp for quaternion.
    Note:  Adjust frame accordingly. Adjust the rate as appropriate
    Accepts pose stamped messages and publishes pose stamped messages"""

    def __init__(self, topic):

        self._pub = rospy.Publisher(topic, PoseStamped, queue_size=10)

    def interpolate_two_poses(self, start_pose, end_pose, steps):
        """Takes Start and End Pose (or PoseStamped) messages and returns
        interpolated PoseStamped series of waypoints
        Frame can be adjusted manually"""

        self._waypoints = []


        if isinstance(start_pose, PoseStamped) & isinstance(end_pose, PoseStamped):
            self._startPose = copy.deepcopy(start_pose.pose)
            self._endPose = copy.deepcopy(end_pose.pose)

        elif isinstance(start_pose, Pose) & isinstance(end_pose, Pose):
            self._startPose = copy.deepcopy(start_pose)
            self._endPose = copy.deepcopy(end_pose)


        else:
            rospy.loginfo("ERROR: START OR END POSE NOT A VALID DATA TYPE. USE EITHER POSE OR POSE STAMPED")


        for i in range (steps):

            wpose = PoseStamped()
            wpose.header.stamp = rospy.Time.now()
            wpose.header.frame_id = "/base" #Chnage frame here


            wpose.pose.position.x = self._startPose.position.x + (i/steps)*(self._endPose.position.x - self._startPose.position.x)
            wpose.pose.position.y = self._startPose.position.y + (i/steps)*(self._endPose.position.y - self._startPose.position.y)
            wpose.pose.position.z = self._startPose.position.z + (i/steps)*(self._endPose.position.z - self._startPose.position.z)

            q1 = [self._startPose.orientation.x, self._startPose.orientation.y, self._startPose.orientation.z, self._startPose.orientation.w]
            q2 = [self._endPose.orientation.x, self._endPose.orientation.y, self._endPose.orientation.z, self._endPose.orientation.w]

            q_slerp = tf.transformations.quaternion_slerp(q1, q2, (i/steps)) #Output is a numpy array

            wpose.pose.orientation = Quaternion(*q_slerp)


            self._waypoints.append(copy.deepcopy(wpose))



    def publish_target_pose(self, loop):
        rospy.loginfo("Publishing generated waypoints")

        i = 0
        while not rospy.is_shutdown():
            if i < len(self._waypoints):
                rate = rospy.Rate(0.25) #Try different rates
                self._pub.publish(self._waypoints[i])
                i = i+1
                rate.sleep()

            else:
                if loop:
                    i = 0
                    self._waypoints = copy.deepcopy(self._waypoints[::-1])
                else:
                    pass


    #Write a subscriber function too, to subscribe to target poses from matlab type code etc.



if __name__ == '__main__':
    rospy.init_node("hong_target_pose_generator", anonymous=True)

    group = "hong_arm"
    topic = "/hong_ur10/pose_to_follow"

    hong_ur10 = robot_control(group) #Intialize robot control class

    hong_pose_publisher = pose_generator(topic)

    start_pose = hong_ur10._group.get_current_pose()
    end_pose = copy.deepcopy(start_pose)
    end_pose.pose.position.z -= 0.10

    #When orientation is such that it can cause potential collision with the arm,
    #the robot controller behaves very abruptly


    hong_pose_publisher.interpolate_two_poses(start_pose, end_pose, 2) #Stores interpolation in self._waypoints

    hong_pose_publisher.publish_target_pose(loop=True)



    rospy.spin()
