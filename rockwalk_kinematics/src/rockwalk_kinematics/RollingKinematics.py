import rospy

import math
import numpy as np

from tf import transformations as tfms

from geometry_msgs.msg import PoseStamped, QuaternionStamped, TwistStamped
from geometry_msgs.msg import Pose, Point, Quaternion, Vector3

import Utilities


OBJECT_RADIUS = 0.35 # Base radius of (cone)

# Check how you imu if fixed on the object relative to the body frame introduced in Ginsberg
IMU_GINSBERG_QUATERNION = tfms.quaternion_from_euler(math.pi/2, 0, math.pi/2, 'rxyz')

#----

class Kinematics:

    def __init__(self, sub_motion_shield):

        self._sub_motion_shield = sub_motion_shield

        global CURRENT_POSITION, CURRENT_TIME

        CURRENT_POSITION = Vector3(0,0,0) # Begin position of the object at 0,0,0
        CURRENT_TIME = rospy.get_time()

        self.record_initial_object_configuration()


    def record_initial_object_configuration(self):

        rospy.loginfo("Bring the object to its initial configuration:")
        rospy.sleep(2)
        self._earth_initialConfiguration_quaternion = self._sub_motion_shield._unit_imu_quaternion
        rospy.loginfo("Initial IMU quaternion recorded")


    def compute_ginsberg_euler(self):

        """Compute the euler angles according to the rolling disk model on
        pg. 317 of Advanced Engineering Dynamics 2nd Edition, J.H. Ginsberg.
        Assume that your world frame aligns with the world frame in Ginsberg.
        """


        earth_world_quaternion = tfms.quaternion_multiply(self._earth_initialConfiguration_quaternion,
                                                    tfms.quaternion_from_euler(math.pi/2, 0, math.pi/2, 'rxyz'))

        earth_ginsberg_quaternion = tfms.quaternion_multiply(self._sub_motion_shield._unit_imu_quaternion,
                                                             IMU_GINSBERG_QUATERNION)

        self._world_ginsberg_quaternion = tfms.quaternion_multiply(tfms.quaternion_inverse(earth_world_quaternion),
                                                                   earth_ginsberg_quaternion)

        world_ginsberg_rot = tfms.quaternion_matrix(self._world_ginsberg_quaternion)

        [psi, theta, phi] = Utilities.compute_rolling_euler(world_ginsberg_rot)

        self._ginsberg_euler = Vector3()
        self._ginsberg_euler.x = np.degrees(psi)
        self._ginsberg_euler.y = np.degrees(theta)
        self._ginsberg_euler.z = np.degrees(phi)



    def compute_ginsberg_twist(self):

        #-------------------------------
        #Angular velocity
        twist_vec = np.array([[self._sub_motion_shield._twist.twist.angular.x],
                              [self._sub_motion_shield._twist.twist.angular.y],
                              [self._sub_motion_shield._twist.twist.angular.z],
                              [0]])

        imu_ginsberg_rot = tfms.quaternion_matrix(IMU_GINSBERG_QUATERNION)
        angular_velocity_ginsberg = np.matmul(np.transpose(imu_ginsberg_rot),twist_vec) #IN DEGREES

        #-------------------------------
        #Translational Velocity from nonholonomic contact
        psi = np.radians(self._ginsberg_euler.x)
        theta = np.radians(self._ginsberg_euler.y)
        phi = np.radians(self._ginsberg_euler.z)

        psi_dot = np.radians(angular_velocity_ginsberg[0])
        theta_dot = np.radians(angular_velocity_ginsberg[1])
        phi_dot = np.radians(angular_velocity_ginsberg[2])

        trans_vel_x = OBJECT_RADIUS*psi_dot*math.cos(psi)*math.cos(theta) - \
                      OBJECT_RADIUS*theta_dot*math.sin(psi)*math.sin(theta) + \
                      OBJECT_RADIUS*phi_dot*math.cos(psi)

        trans_vel_y = OBJECT_RADIUS*psi_dot*math.sin(psi)*math.cos(theta) - \
                      OBJECT_RADIUS*theta_dot*math.cos(psi)*math.sin(theta) + \
                      OBJECT_RADIUS*phi_dot*math.sin(psi)

        trans_vel_z = OBJECT_RADIUS*theta_dot*math.cos(theta)

        #-------------------------------


        self._ginsberg_twist = TwistStamped()
        self._ginsberg_twist.header.stamp = rospy.Time.now()
        self._ginsberg_twist.twist.angular = Vector3(angular_velocity_ginsberg[0],
                                                     angular_velocity_ginsberg[1],
                                                     angular_velocity_ginsberg[2])

        self._ginsberg_twist.twist.linear = Vector3(trans_vel_x, trans_vel_y, trans_vel_z)



    def compute_object_pose(self):
        """
        Position: Base (disk) center coordinates (x_D, y_D, z_D)
        Orientation: Quaternion relative to the world frame
        """
        global CURRENT_POSITION, CURRENT_TIME


        [CURRENT_POSITION, CURRENT_TIME] = self.nonholonomic_translational_distance(CURRENT_POSITION,
                                                                                    CURRENT_TIME)

        self._object_pose = PoseStamped()
        self._object_pose.header.stamp = rospy.Time.now()
        self._object_pose.pose.position = Point(self._disk_center_position.x,
                                                self._disk_center_position.y,
                                                self._disk_center_position.z)

        self._object_pose.pose.position = Quaternion(self._world_ginsberg_quaternion[0],
                                                     self._world_ginsberg_quaternion[1],
                                                     self._world_ginsberg_quaternion[2],
                                                     self._world_ginsberg_quaternion[3])




    def nonholonomic_translational_distance(self, current_position, current_time):

        new_time = self._ginsberg_twist.header.stamp.to_sec()

        position_change_x = self._ginsberg_twist.twist.linear.x * (new_time - current_time)
        position_change_y = self._ginsberg_twist.twist.linear.y * (new_time - current_time)

        self._disk_center_position = Vector3()
        self._disk_center_position.x = current_position.x + position_change_x
        self._disk_center_position.y = current_position.y + position_change_y
        self._disk_center_position.z = OBJECT_RADIUS*math.sin(np.radians(self._ginsberg_euler.y))

        return self._disk_center_position, new_time


    def compute_contact_coordinates(self):

        rot_psi = tfms.rotation_matrix(np.radians(self._ginsberg_euler.x), [0,0,1])
        init_rot = tfms.rotation_matrix(math.pi/2, [0,0,1])
        rot_theta = tfms.rotation_matrix(np.radians(self._ginsberg_euler.y), [0,1,0])
        rot_phi = tfms.rotation_matrix(np.radians(self._ginsberg_euler.z), [0,0,1])

        rot_StoQ = np.matmul(np.matmul(rot_psi, init_rot),rot_theta)
        rot_StoB = np.matmul(rot_StoQ, rot_phi)

        ground_contact_vector = np.matmul(rot_StoQ,np.array([[OBJECT_RADIUS],[0],[0],[0]]))

        contact_position_x = self._disk_center_position.x + ground_contact_vector[0]
        contact_position_y = self._disk_center_position.y + ground_contact_vector[1]

        self._ground_contact_position = Vector3()
        self._ground_contact_position.x = contact_position_x
        self._ground_contact_position.y = contact_position_y
        self._ground_contact_position.z = 0
