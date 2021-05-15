#!/usr/bin/env python2

import rospy
import tf2
from geometry_msgs.msg import PoseStamped

aruco_end_pose = None

def aruco_end_callback(data):
    aruco_end_pose = data

def continuum_end_tracker():
    rospy.Subscriber("/aruco_end/pose", PoseStamped, aruco_end_callback)
    rospy.Subscriber("/continuum_base_pose/", PoseStamped, base_callback)
    # spin() simply keeps python from exiting until this node is stopped
    # rospy.spin()

    pub = rospy.Publisher('/continuum_end_pose', PoseStamped, queue_size=10)
    rospy.init_node('contimuum_end_tracker', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
        if end_pose is not None:
            rospy.loginfo(end_pose)
            pub.publish(end_pose)
        rate.sleep()


if __name__ == '__main__':
    try:
        continuum_end_tracker()
    except rospy.ROSInterruptException:
        pass