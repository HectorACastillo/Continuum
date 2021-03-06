#!/usr/bin/env python2

import rospy
import tf2_ros
from geometry_msgs.msg import PoseStamped
from geometry_msgs.msg import PointStamped
import tf2_geometry_msgs
import time
# import tf2_geometry_msgs
global continuuum_base_pose
global aruco_end_pose

aruco_end_pose = None
continuum_base_pose = None
# base_pose = None

def continuum_base_callback(data):
    global continuum_base_pose
    # if continuum_base_pose is None:
    # if data is not None:
    continuum_base_pose = data
    # print("updated cotinuum_base_pose")

def aruco_end_callback(data):
    global aruco_end_pose
    # if data is not None:
    aruco_end_pose = data
    # print("updated aruco_end_pose")

# def base_callback(data):
#     base_pose = data

def continuum_end_tracker():
    global continuum_base_pose
    global aruco_end_pose

    rospy.Subscriber("/continuum_base_pose", PoseStamped, continuum_base_callback)
    rospy.Subscriber("/aruco_end/pose", PoseStamped, aruco_end_callback)
    # rospy.Subscriber("/continuum_base_pose", PoseStamped, base_callback)
    # spin() simply keeps python from exiting until this node is stopped
    # rospy.spin()

    # pub_cam  = rospy.Publisher('/continuum_end_pose_camera_frame', PoseStamped, queue_size=10)
    pub_base = rospy.Publisher('/continuum_end_point', PointStamped, queue_size=10)
    
    rospy.init_node('contimuum_end_tracker', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    output_position = PointStamped()
    # while continuum_base_pose is None or aruco_end_pose is None:
    #     pass
    seq = 0

    while not rospy.is_shutdown():
        
        # try:
        output_position.header.frame_id = 'continuum_base_frame'
        output_position.header.stamp.secs = time.time()
        output_position.header.seq = seq
        seq += 1
        try:
            output_position.point.x = -(aruco_end_pose.pose.position.x - continuum_base_pose.pose.position.x)
            output_position.point.y = -(aruco_end_pose.pose.position.y - continuum_base_pose.pose.position.y)
            output_position.point.z = -(aruco_end_pose.pose.position.z - continuum_base_pose.pose.position.z)
        except:
            pass
            # print("failed to calculate position")
        
        try:
            pub_base.publish(output_position)
        except:
            pass
            # print("failed to publish")

        rate.sleep()
        # if aruco_end_pose is not None:
        #     # rospy.loginfo(aruco_end_pose)
        #     # pub.publish(aruco_end_pose)
        #     pub_cam.publish(aruco_end_pose)
        #     output_pose = transform_pose(aruco_end_pose.pose,
        #                                  aruco_end_pose.header.frame_id,
        #                                  'continuum_base_frame',
        #                                  default=output_pose)
        #     if output_pose is not None:
        #         print("pubbing")
        #         pub_base.publish(output_pose)
        #     # try:
        #     #     trans = tfBuffer.lookup_transform(aruco_end_pose.header.frame_id, 'continuum_base_pose', rospy.Time())
        #     #     print(trans)
        #     #     pub.publish(trans)
        #     # except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException):
        #     #     print("transform not found")

        # rate.sleep()

# def transform_pose():
#     tfBuffer = tf2_ros.Buffer()
#     listener = tf2_ros.TransformListener(tfBuffer)



def transform_pose(input_pose, from_frame, to_frame, default=None):

    # **Assuming /tf2 topic is being broadcasted
    tf_buffer = tf2_ros.Buffer()
    listener = tf2_ros.TransformListener(tf_buffer)

    pose_stamped = tf2_geometry_msgs.PoseStamped()
    pose_stamped.pose = input_pose
    pose_stamped.header.frame_id = from_frame
    pose_stamped.header.stamp = rospy.Time.now()

    try:
        # ** It is important to wait for the listener to start listening. Hence the rospy.Duration(1)
        output_pose_stamped = tf_buffer.transform(pose_stamped, to_frame, rospy.Duration(1))
        return output_pose_stamped#.pose

    except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException):
        return default

if __name__ == '__main__':
    try:
        continuum_end_tracker()
    except rospy.ROSInterruptException:
        pass