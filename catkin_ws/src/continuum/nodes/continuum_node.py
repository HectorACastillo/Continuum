#!/usr/bin/python

# Hector Castillo

# Adapted from:
# Andrew Morgan
# Yale University

# import continuum_node.syncRW_XMHandler as handler
import continuum.registerDict as registerDict
import continuum.continuum as continuum
from continuum.srv import *
from geometry_msgs.msg import PointStamped
from std_msgs.msg import Float32
import rospy
import numpy as np
from IPython import embed
import thread


#Communication class for continuum
class ContinuumNode():
    robot = None
    
    #Initialize to have a hand object
    def __init__(self, robot):
        self.robot = robot
        self.actual_cartesian = np.zeros((3,1))
        self.rho_actual = 0.0
        self.theta_actual = 0.0
        self.dq = np.zeros((3,1))

        self.rho_setpoint = 0.0
        self.theta_setpoint = 0.0
        self.K = 0.25
        self.err_acpt_r = 0.01
        self.err_acpt_t = 0.063
        self.openloop = False
        
        #initialize service handlers:
        rospy.Service('/continuum_node/reset',Reset,self.ResetCallback)
        rospy.Service('/continuum_node/goto',GoTo,self.GoToCallback)
        rospy.Service('/continuum_node/motor_states',MotorStates,self.MotorStatesCallback)

        rospy.Subscriber('/continuum_end_point',PointStamped,self.ContinuumEndCallback)
        
        rate = rospy.Rate(10) # 10hz
        setpoint_cartesian_pub = rospy.Publisher('/continuum_node/setpoint_cartesian', PointStamped, queue_size=10)
        setpoint_config_rho_pub = rospy.Publisher('/continuum_node/setpoint_config/rho', Float32, queue_size=10)
        setpoint_config_theta_pub = rospy.Publisher('/continuum_node/setpoint_config/theta', Float32, queue_size=10)
        rho_actual_pub = rospy.Publisher('/continuum_node/rho_actual', Float32, queue_size=10)
        theta_actual_pub = rospy.Publisher('/continuum_node/theta_actual', Float32, queue_size=10)

        position_stamped = PointStamped()
        position_stamped.header.frame_id = 'continuum_base_frame'

        rho_setpoint_msg = Float32()
        theta_setpoint_msg = Float32()
        rho_actual_msg = Float32()
        theta_actual_msg = Float32()

        # start motor control thread
        thread.start_new_thread(self.MotorControl,())

        while not rospy.is_shutdown():
            position_stamped.header.stamp = rospy.Time.now()
            x,y,z = self.robot.getSetpointCartesian()
            position_stamped.point.x = x
            position_stamped.point.y = y
            position_stamped.point.z = z
            setpoint_cartesian_pub.publish(position_stamped)

            rho_setpoint_msg = self.rho_setpoint
            theta_setpoint_msg = self.theta_setpoint
            setpoint_config_rho_pub.publish(rho_setpoint_msg)
            setpoint_config_theta_pub.publish(theta_setpoint_msg)

            rho_actual_msg = self.rho_actual
            theta_actual_msg = self.theta_actual
            rho_actual_pub.publish(rho_actual_msg)
            theta_actual_pub.publish(theta_actual_msg)
            

            rate.sleep()

        rospy.spin()		#blocking

    def MotorControl(self):
        while not rospy.is_shutdown():
            if not self.openloop:
                err_rho   = self.rho_setpoint   - self.rho_actual
                err_theta = self.theta_setpoint - self.theta_actual
                if err_theta > np.pi:
                    err_theta -= 2*np.pi
                elif err_theta < -np.pi:
                    err_theta += 2*np.pi

                J = self.robot.getJacobian(self.rho_actual, self.theta_actual)
                self.dq = np.dot(J,np.resize(np.array([err_rho,err_theta]),(2,1)))
                self.robot.moveMotors([0,1,2],np.clip(self.robot.getMotorStates()+self.K*self.dq,0.0,1.0),printout=False)

    def ContinuumEndCallback(self, data):

        self.actual_cartesian[0,0] = data.point.x
        self.actual_cartesian[1,0] = data.point.y
        self.actual_cartesian[2,0] = data.point.z

        self.rho_actual, self.theta_actual = self.robot.XYZ2RT(self.actual_cartesian)
        self.theta_actual = np.mod(self.theta_actual,2*np.pi)

        
    #This should work in theory, but dynamixels have a mind of their own.
    def ResetCallback(self,req):
        self.robot.reset()
        resp = ResetResponse()
        resp.err = 0
        return resp
        
    def GoToCallback(self,req):
        self.rho_setpoint = req.rho
        self.theta_setpoint = req.theta
        self.speed = req.speed
        self.K = req.K
        self.openloop = req.open
        
        if self.openloop:
            # run once
            self.robot.goto(self.rho_setpoint, self.theta_setpoint, self.speed, self.K, (self.err_acpt_r, self.err_acpt_t))

        resp = GoToResponse()   
        resp.err = 0
        return resp
        
    def MotorStatesCallback(self, req):
        
        resp = MotorStatesResponse()
        resp.states = self.robot.getMotorStates()
        resp.err = 0
        
        return resp


if __name__=="__main__":
    Robot = None
    #initialize ros node elements: (can't read parameters until node is initialized)
    rospy.init_node("continuumNode")
    
    port = rospy.get_param('~servo_port')
    motor_assignments = rospy.get_param('~motor_assignments')
    dyn_model = rospy.get_param('~dyn_model')
    natural_length = rospy.get_param('~natural_length')
    run_tuning = rospy.get_param('~run_tuning')
    
    Robot = continuum.Continuum(port=port, motor_assignments=motor_assignments, dyn_model=dyn_model, naturalLength=natural_length, runTuning = run_tuning)
    
    #start node if everything is initialized correctly
    if Robot is None:
        rospy.logerr("ERR: Cannot Initialize the continuum node (continuumNode.py). Please check to ensure your parameters are correct!")
    else:
        ContinuumNode(Robot)