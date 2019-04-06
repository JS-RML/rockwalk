#!/usr/bin/env python

import rospy
import tf
import math
from visualization_msgs.msg import Marker
from geometry_msgs.msg import QuaternionStamped, Quaternion, Pose, Point, Vector3
from std_msgs.msg import Header, ColorRGBA



# def quat_callback(marker_pub):
#
#
#
#     init_quat = tf.transformations.quaternion_from_euler(math.pi/2,0,0)
#
#     new_quat = tf.transformations.quaternion_multiply(my_quat_vec, init_quat)
#
#
#     my_quat_new =  Quaternion(new_quat[0], new_quat[1], new_quat[2], new_quat[3])
#
#     print (new_quat)
#
#     marker = Marker(
#                     type=Marker.MESH_RESOURCE,
#                     action=Marker.ADD,
#                     id=0,
#                     #lifetime=rospy.Duration(1.5),
#                     pose=Pose(Point(-0.215, 0.543, 0), Quaternion(init_quat[0], init_quat[1], init_quat[2], init_quat[3])),
#
#                     #pose = Pose(Point(0,0,0), my_quat_new),
#                     scale=Vector3(0.001, .001, .001),
#                     header=Header(frame_id='world'),
#                     color=ColorRGBA(0.0, 1.0, 0.0, 0.8),
#                     mesh_resource="file:///home/nazir/ws_moveit/src/ur10_cm/models/manipuland_object.dae"
#                     )
#
#     #rate = rospy.Rate(10)
#     #while not rospy.is_shutdown():
#     marker_pub.publish(marker)
#         #rate.sleep()
#



if __name__ == '__main__':
    rospy.init_node("cone_marker_node", anonymous=True)

    marker_pub = rospy.Publisher('cone_marker_topic', Marker, queue_size=10)

    listener = tf.TransformListener()

    rate = rospy.Rate(10.0)

    while not rospy.is_shutdown():
        try:
            (trans,rot) = listener.lookupTransform('world', 'motion_shield', rospy.Time(0))
        except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
            continue

        init_object_quat = tf.transformations.quaternion_from_euler(math.pi/2,0,0)
        init_object_pos = Point(-0.215, 0.543, 0)


        curr_quat = tf.transformations.quaternion_multiply(init_object_quat, rot)




        marker = Marker(
                        type=Marker.MESH_RESOURCE,
                        action=Marker.ADD,
                        id=0,
                        #lifetime=rospy.Duration(1.5),
                        #pose=Pose(Point(-0.215, 0.543, 0), Quaternion(init_quat[0], init_quat[1], init_quat[2], init_quat[3])),

                        pose=Pose(Point(-0.215, 0.543, 0), Quaternion(rot[0], rot[1], rot[2], rot[3])),
                        scale=Vector3(0.001, .001, .001),
                        header=Header(frame_id='world'),
                        color=ColorRGBA(0.0, 1.0, 0.0, 0.8),
                        mesh_resource="file:///home/nazir/ws_moveit/src/ur10_cm/models/right_cone.dae"
                        )

        marker_pub.publish(marker)
        rate.sleep()
