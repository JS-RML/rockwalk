import copy
import math
import rospy

import numpy as np
import matplotlib
matplotlib.use('GTKAgg')
import matplotlib.pyplot as plt


font = {'family' : 'normal',
        'weight' : 'normal',
        'size'   : 20}

matplotlib.rc('font', **font)


#---

class RockwalkPlots:

    def __init__(self, object_kinematics):

        self._init_time = rospy.get_time()
        self.initialize_data_arrays()

        self._object_kinematics = object_kinematics


    def current_time_difference(self):

        current_time = rospy.get_time()
        self._current_time_difference = (current_time - self._init_time)

        # print(self._current_time_difference)

    def initialize_data_arrays(self):
        self._time_values = []

        self._euler_ginsberg_values_x = []
        self._euler_ginsberg_values_y = []
        self._euler_ginsberg_values_z = []

        self._twist_ginsberg_values_x = []
        self._twist_ginsberg_values_y = []
        self._twist_ginsberg_values_z = []

        self._ground_contact_position_values_x = []
        self._ground_contact_position_values_y = []


    def append_data_values(self):
        self._time_values.append(self._current_time_difference)

        self._euler_ginsberg_values_x.append(self._object_kinematics._ginsberg_euler.x)
        self._euler_ginsberg_values_y.append(self._object_kinematics._ginsberg_euler.y)
        self._euler_ginsberg_values_z.append(self._object_kinematics._ginsberg_euler.z)

        self._twist_ginsberg_values_x.append(self._object_kinematics._ginsberg_twist.twist.angular.x)
        self._twist_ginsberg_values_y.append(self._object_kinematics._ginsberg_twist.twist.angular.y)
        self._twist_ginsberg_values_z.append(self._object_kinematics._ginsberg_twist.twist.angular.z)

        self._ground_contact_position_values_x.append(self._object_kinematics._ground_contact_position.x)
        self._ground_contact_position_values_y.append(self._object_kinematics._ground_contact_position.y)


    def setup_contact_position_plot(self):
        fig_contact_plot, axis_contact_plot = plt.subplots(1, 1)
        # axis_contact_plot.set_aspect('equal')
        axis_contact_plot.set_xlim(-20, 20)
        axis_contact_plot.set_ylim(-20, 20)
        axis_contact_plot.hold(True)

        plt.show(False)
        plt.draw()
        plt.xlabel("World x (m)")
        plt.ylabel("World y (m)")
        plt.title("Contact Position Plot")

        background_contact_plot = fig_contact_plot.canvas.copy_from_bbox(axis_contact_plot.bbox)

        points_contact_plot = axis_contact_plot.plot(0, 0, 'b-')[0]

        plt.pause(1e-17)

        return fig_contact_plot, axis_contact_plot, background_contact_plot, points_contact_plot


    def setup_euler_plot(self):
        figure_euler_plot, axis_euler_plot = plt.subplots(1, 1)
        # self._ax.set_aspect('equal')
        axis_euler_plot.set_xlim(0, 90)
        axis_euler_plot.set_ylim(-90,90)

        axis_euler_plot.hold(True)
        plt.show(False)
        plt.draw()
        plt.xlabel("Time (seconds)")
        plt.ylabel("Angles (degrees)")
        plt.title("Euler Plot")

        background_euler_plot = figure_euler_plot.canvas.copy_from_bbox(axis_euler_plot.bbox)


        points_euler_plot_theta = axis_euler_plot.plot(0, 0, 'g-', label='Theta (deg)')[0]
        points_euler_plot_phi = axis_euler_plot.plot(0, 0, 'm-', label='Phi (deg)')[0]

        axis_euler_plot.legend()
        plt.pause(1e-17)

        return figure_euler_plot, axis_euler_plot, background_euler_plot, points_euler_plot_theta, points_euler_plot_phi


    def setup_phase_plot(self):
        fig_phase_plot, axis_phase_plot = plt.subplots(1, 1)
        # axis_contact_plot.set_aspect('equal')
        axis_phase_plot.set_xlim(-180, 180)
        axis_phase_plot.set_ylim(-270, 270)
        axis_phase_plot.hold(True)

        plt.show(False)
        plt.draw()
        plt.xlabel("phi (deg)")
        plt.ylabel("phi_dot (deg)")
        plt.title("Phase Plot")

        background_phase_plot = fig_phase_plot.canvas.copy_from_bbox(axis_phase_plot.bbox)

        points_phase_plot = axis_phase_plot.plot(0, 0, 'b-')[0]

        plt.pause(1e-17)

        return fig_phase_plot, axis_phase_plot, background_phase_plot, points_phase_plot


    def contact_position_plot(self, figure, axis, background, points):

        points.set_data(self._ground_contact_position_values_x,self._ground_contact_position_values_y)
        figure.canvas.restore_region(background)
        axis.draw_artist(points)
        figure.canvas.blit(axis.bbox)
        plt.pause(1e-50)



    def euler_plot(self, figure, axis, background, points_theta, points_phi):

        points_theta.set_data(self._time_values, self._euler_ginsberg_values_y)
        points_phi.set_data(self._time_values, self._euler_ginsberg_values_z)

        figure.canvas.restore_region(background)
        axis.draw_artist(points_theta)
        axis.draw_artist(points_phi)
        figure.canvas.blit(axis.bbox)

        plt.pause(1e-50)


    def phase_plot(self, figure, axis, background, points):
        points.set_data(self._euler_ginsberg_values_z,self._twist_ginsberg_values_z)
        figure.canvas.restore_region(background)
        axis.draw_artist(points)
        figure.canvas.blit(axis.bbox)
        plt.pause(1e-50)
