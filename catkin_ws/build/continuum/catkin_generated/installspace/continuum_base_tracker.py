#!/usr/bin/env python2

import rospy
from geometry_msgs.msg import Pose, PoseStamped
import time

base_top_pose = None
base_left_pose = None
base_right_pose = None


def base_top_callback(data):
    global base_top_pose
    base_top_pose = data

def base_left_callback(data):
    global base_left_pose
    base_left_pose = data

def base_right_callback(data):
    global base_right_pose
    base_right_pose = data

def continuum_base_tracker():

    global base_top_pose, base_left_pose, base_right_pose
    rospy.Subscriber("/aruco_base_top/pose", PoseStamped, base_top_callback)
    rospy.Subscriber("/aruco_base_left/pose", PoseStamped, base_left_callback)
    rospy.Subscriber("/aruco_base_right/pose", PoseStamped, base_right_callback)

    pub = rospy.Publisher('/continuum_base_pose', PoseStamped, queue_size=10)
    rospy.init_node('contimuum_base_tracker', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    seq = 0
    base_pose = PoseStamped()
    
    while not rospy.is_shutdown():
        if base_top_pose is not None and base_left_pose is not None and base_right_pose is not None:
            base_pose.header.frame_id = base_top_pose.header.frame_id

            base_pose.pose.position.x = (base_top_pose.pose.position.x+base_left_pose.pose.position.x+base_right_pose.pose.position.x)/3
            base_pose.pose.position.y = (base_left_pose.pose.position.y+base_right_pose.pose.position.y)/2
            base_pose.pose.position.z = (base_top_pose.pose.position.z+base_left_pose.pose.position.z+base_right_pose.pose.position.z)/3 + 0.108
            base_pose.pose.orientation = base_top_pose.pose.orientation

            base_pose.header.seq = seq
            base_pose.header.stamp.secs = time.time()
            # base_pose.header.stamp.nsecs = time.time_ns()
            seq += 1
    
            # rospy.loginfo(base_pose)
            pub.publish(base_pose)
        rate.sleep()


if __name__ == '__main__':
    try:
        continuum_base_tracker()
    except rospy.ROSInterruptException:
        pass