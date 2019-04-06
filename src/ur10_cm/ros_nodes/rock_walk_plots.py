#!/usr/bin/env python


"""
Visualizing relevant plots for rock and walk motion:
1. Phase plot + Time
2. Cone roll angle, roll velocity, robot joint angle against time
3. Force topic when you add mass

"""

import sys
import rospy
import copy
import math
import tf
from geometry_msgs.msg import Pose, Point, Quaternion, Vector3
from geometry_msgs.msg import PoseStamped, QuaternionStamped, TwistStamped, AccelStamped, Vector3Stamped, PoseArray
from visualization_msgs.msg import Marker
from std_msgs.msg import Header, ColorRGBA
from tf import transformations as tfms
import tf_conversions as tfc
import numpy as np
import matplotlib
matplotlib.use('GTKAgg')
import matplotlib.pyplot as plt
from cone_pose_visualization import cone_manipuland


font = {'family' : 'normal',
        'weight' : 'normal',
        'size'   : 16}

matplotlib.rc('font', **font)

class rock_walk_plot:

    def __init__(self):

        self._init_time = rospy.get_time()

        self.initialize_data_arrays()

        # self.initialize_phase_plot()

        # self.initialize_kong_end_effector_plot()

        self.initialize_time_plot()

        # self.initialize_april_tag_xy_plot()

        self.initialize_publishers()
        self.initialize_tf_broadcasters_listeners()
        self.initialize_subscribers()

    def initialize_data_arrays(self):
        self._time_values = []

        self._euler_values_x = []
        self._twist_values_x = []

        self._euler_values_y = []
        self._twist_values_y = []

        self._euler_values_z = []
        self._twist_values_z = []

        #List for end-effector poses
        self._kong_eef_position_x = []
        self._kong_eef_position_y = []


        self._april_tag_position_x=[]
        self._april_tag_position_y=[]
        self._april_tag_position_z=[]

    def append_data_values(self):
        self._time_values.append(self._curr_time_difference)


        self._euler_values_x.append(math.radians(self._body_euler.x))
        self._twist_values_x.append(math.radians(self._twist.twist.angular.x))

        self._euler_values_y.append(math.radians(self._body_euler.y))
        self._twist_values_y.append(math.radians(self._twist.twist.angular.y))

        self._euler_values_z.append(math.radians(self._body_euler.z))
        self._twist_values_z.append(math.radians(self._twist.twist.angular.z))


        #Append kong effector pose coordinates
        # self._kong_eef_position_x.append(self._kong_eef_position.y)
        # self._kong_eef_position_y.append(-self._kong_eef_position.x)



        #Append april tag positions
        # self._april_tag_position_x.append(self._object_pose_from_tag.position.x)
        # self._april_tag_position_y.append(self._object_pose_from_tag.position.y)
        # self._april_tag_position_z.append(self._object_pose_from_tag.position.z)


    def initialize_phase_plot(self):
        self._fig_phase, self._ax = plt.subplots(1, 1)
        # self._ax.set_aspect('equal')
        self._ax.set_xlim(-0.80, 0.80)
        self._ax.set_ylim(-2.5, 2.5)
        self._ax.hold(True)

        plt.show(False)
        plt.draw()
        plt.xlabel("Rocking angle (rad)")
        plt.ylabel("Rocking angular velocity (rad/s)")
        plt.title("Phase Plot for Rocking Motion")

        self._background = self._fig_phase.canvas.copy_from_bbox(self._ax.bbox)

        self._points = self._ax.plot(0, 0, 'b-')[0]


        plt.pause(1e-17)


    def initialize_april_tag_xy_plot(self):
        self._fig_phase, self._ax = plt.subplots(1, 1)
        # self._ax.set_aspect('equal')
        self._ax.set_xlim(-2.5, -0.5)
        self._ax.set_ylim(-0.5, -2)
        self._ax.hold(True)

        plt.show(False)
        plt.draw()
        plt.xlabel("world x (m)")
        plt.ylabel("world y (m)")
        plt.title("xy plot")

        self._background = self._fig_phase.canvas.copy_from_bbox(self._ax.bbox)

        self._points = self._ax.plot(0, 0, 'b-')[0]


        plt.pause(1e-17)

    def initialize_kong_end_effector_plot(self):
        self._fig_eef, self._ax_eef = plt.subplots(1, 1)
        # self._ax.set_aspect('equal')
        self._ax_eef.set_xlim(-5, 5)
        self._ax_eef.set_ylim(-5, 5)
        self._ax_eef.hold(True)

        plt.show(False)
        plt.draw()
        plt.xlabel("x")
        plt.ylabel("y")
        plt.title("Effector Position Plot")

        self._background_eef = self._fig_eef.canvas.copy_from_bbox(self._ax_eef.bbox)

        self._points_eef = self._ax_eef.plot(0, 0, 'b-')[0]


        plt.pause(1e-17)





    def initialize_time_plot(self):
        self._fig, (self._ax_1, self._ax_2, self._ax_3) = plt.subplots(3, sharex=True, sharey=False)
        # self._ax.set_aspect('equal')

        """These axis limits for euler plot"""
        self._ax_1.set_xlim(0, 40)
        self._ax_1.set_ylim(math.radians(-270),math.radians(0))
        self._ax_2.set_ylim(math.radians(-135),math.radians(135))
        self._ax_3.set_ylim(math.radians(-270),math.radians(0))

        #old limits-used in photo in draft
        # self._ax_1.set_xlim(0, 80)
        # self._ax_1.set_ylim(math.radians(-135), math.radians(-45))
        # self._ax_2.set_ylim(math.radians(-135),math.radians(135))
        # self._ax_3.set_ylim(-math.pi, 0)

        """These axis limits for april tag plot"""
        # self._ax_1.set_xlim(0, 100)
        # self._ax_1.set_ylim(-2.5,-0.5)
        # self._ax_2.set_ylim(-2,-0.5)
        # self._ax_3.set_ylim(-1,0)

        self._ax_1.set_ylabel("Pitch (rad)")
        self._ax_2.set_ylabel("Roll (rad)")
        self._ax_3.set_ylabel("Yaw (rad)")
        self._ax_3.set_xlabel("Time (seconds)")


        self._ax_1.hold(True)
        self._ax_2.hold(True)
        self._ax_3.hold(True)

        plt.show(False)
        plt.draw()


        self._background = self._fig.canvas.copy_from_bbox(self._ax_1.bbox)


        self._points_1_angle = self._ax_1.plot(0, 0, 'r-')[0]
        self._points_2_angle = self._ax_2.plot(0, 0, 'g-', label='Angle (rad)')[0]
        self._points_2_velocity = self._ax_2.plot(0, 0, 'm-', label='Rate (rad/s)')[0]
        self._points_3_angle = self._ax_3.plot(0, 0, 'b-')[0]
        # self._points_3_velocity = self._ax_3.plot(0, 0, 'm-', label = "Rate")[0]



        self._ax_2.legend()
        self._ax_3.legend()


        plt.pause(1e-17)



    def initialize_publishers(self):
        pass

    def initialize_tf_broadcasters_listeners(self):
        pass

    def initialize_subscribers(self):
        self.subscribe_body_euler()
        self.subscribe_object_twist()
        self.subscribe_end_effector_position()
        self.subscribe_april_tag_position()
        rospy.sleep(2)



    def subscribe_object_twist(self):
        rospy.loginfo("Subscribing to Twist Topic")
        self._twist_sub =rospy.Subscriber("twist_motion_shield", TwistStamped, self.store_twist_data)


    def subscribe_body_euler(self):
        rospy.loginfo("Subscribing to Euler Topic")
        self._euler_sub =rospy.Subscriber("body_euler", Vector3, self.store_body_euler_data)


    def subscribe_end_effector_position(self):
        rospy.loginfo("Subscribing to End Effector Pose Topic")
        self._kong_eef_position_sub =rospy.Subscriber("kong_eef_position", Point, self.store_kong_eef_position)

    def subscribe_april_tag_position(self):
        self._april_tag_sub = rospy.Subscriber("object_pose_world", Pose, self.store_object_april_tag_pose)

    def store_object_april_tag_pose(self, object_pose):
        self._object_pose_from_tag = copy.deepcopy(object_pose)

    def store_kong_eef_position(self, eef_position):
        self._kong_eef_position = copy.deepcopy(eef_position)

    def store_twist_data(self, twist_data):
        self._twist = copy.deepcopy(twist_data)


    def store_body_euler_data(self, body_euler_data):
        self._body_euler = copy.deepcopy(body_euler_data)


    def curr_time_difference(self):

        curr_time = rospy.get_time()
        self._curr_time_difference = (curr_time - self._init_time)

        print(self._curr_time_difference)


    def phase_plot(self):


        self._points.set_data(self._euler_values_y, self._twist_values_y)


        self._fig_phase.canvas.restore_region(self._background)
        self._ax.draw_artist(self._points)

        self._fig_phase.canvas.blit(self._ax.bbox)

        plt.pause(1e-50)

    def april_tag_xy_plot(self):


        self._points.set_data(self._april_tag_position_x,self._april_tag_position_y )


        self._fig_phase.canvas.restore_region(self._background)
        self._ax.draw_artist(self._points)

        self._fig_phase.canvas.blit(self._ax.bbox)

        plt.pause(1e-50)

    def curr_effector_position_plot(self):

        self._points_eef.set_data(self._kong_eef_position_x, self._kong_eef_position_y)

        self._fig_eef.canvas.restore_region(self._background_eef)
        self._ax_eef.draw_artist(self._points_eef)

        self._fig_eef.canvas.blit(self._ax_eef.bbox)

        plt.pause(1e-50)


    def time_plot(self):

        self._points_1_angle.set_data(self._time_values, self._euler_values_x)
        self._points_2_angle.set_data(self._time_values, self._euler_values_y)
        self._points_2_velocity.set_data(self._time_values, self._twist_values_y)
        self._points_3_angle.set_data(self._time_values, self._euler_values_z)
        # self._points_3_velocity.set_data(self._time_values, self._twist_values_z)


        self._fig.canvas.restore_region(self._background)

        self._ax_1.draw_artist(self._points_1_angle)
        self._ax_2.draw_artist(self._points_2_angle)
        self._ax_2.draw_artist(self._points_2_velocity)
        self._ax_3.draw_artist(self._points_3_angle)
        # self._ax_3.draw_artist(self._points_3_velocity)

        self._fig.canvas.blit(self._ax_1.bbox)

        plt.pause(1e-50)

    def april_tag_plot(self):
        self._points_1.set_data(self._time_values, self._april_tag_position_x)
        self._points_2_angle.set_data(self._time_values, self._april_tag_position_y)#angle by name only
        self._points_3_angle.set_data(self._time_values, self._april_tag_position_z)#angle by name only


        self._fig.canvas.restore_region(self._background)

        self._ax_1.draw_artist(self._points_1)
        self._ax_2.draw_artist(self._points_2_angle)
        self._ax_2.draw_artist(self._points_2_velocity)
        self._ax_3.draw_artist(self._points_3_angle)
        # self._ax_3.draw_artist(self._points_3_velocity)


        self._fig.canvas.blit(self._ax_1.bbox)

        plt.pause(1e-50)




if __name__ == '__main__':
    rospy.init_node("rock_walk_plots", anonymous=True)


    rw_plot = rock_walk_plot()

    rate = rospy.Rate(50) #previously 55


    while not rospy.is_shutdown():

        rw_plot.curr_time_difference()

        rw_plot.append_data_values()

        # rw_plot.phase_plot()

        # rw_plot.curr_effector_position_plot()

        rw_plot.time_plot()

        # rw_plot.april_tag_plot()

        # rw_plot.april_tag_xy_plot()

        rate.sleep()

    rospy.spin()
