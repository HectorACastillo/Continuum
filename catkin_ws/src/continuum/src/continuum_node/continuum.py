#!/usr/bin/python -i

#Adapted from the OpenHand_node by the Yale Grablab
#Made by Hector Castillo
#Updated 05/2021

from __future__ import print_function
from lib_robotis_mod import *
from hands import OpenHand
import time
import numpy as np	#for array handling
import scipy.io
import math
from decimal import Decimal
import progressbar
from collections import OrderedDict
import rospy
from geometry_msgs.msg import PoseStamped

import matplotlib.pyplot as plt 

#Assumptions:
	#only dynamixel servos being used
	#either all RX or MX servos being used (no mixing)
	#different encoder limits for each type
		#motor limits and mov't designated in terms of proportion, not encoder value


# Motor Mapping for RX:
# 
# Motor Degrees         0 -------------------------------- 300
# Encoder Clicks        0 -------------------------------- 1023
# OpenHand Mapping      0 -------------------------------- 1.0
# Safety Range Limits     0.05 ------------------------ 0.95
# Operable Region (Amt)	   0.0 ------------------------ 1.0


class Continuum(OpenHand):

	def __init__(self,port="COM8",motor_assignments=[2,3,4],dyn_model="RX",naturalLength=1.0,radius=0.026,tendon_randian_offsets=[0,4*np.pi/3,2*np.pi/3],
	            pulley_radii=[0.021,0.021,0.021],motor_zeros=[0.5,0.5,0.5],motor_ranges=[5.4*np.pi,5.4*np.pi,5.4*np.pi],runTuning=False):

		self.num_motors = len(motor_assignments)
		self.naturalLength = naturalLength
		self.radius = radius
		self.tendon_randian_offsets = np.transpose(np.array([tendon_randian_offsets])) # 3x1
		self.pulley_radii = np.transpose(np.array([pulley_radii])) # 3x1
		self.motor_zeros = np.transpose(np.array([motor_zeros]))  # 3x1 # Operable Region Mapping
		self.motor_ranges = np.transpose(np.array([motor_ranges])) # 3x1 # radians of rotation from 0.0 to 1.0 in the Operable Region Mapping

		self.motor_states = np.copy(self.motor_zeros) # 3x1 # Operable Region Mapping
		self.rt_state = (0,0) # end effector state in rho-theta space

		self.cartesian_state_actual = None

		self.motorDir = [1,1,1] 
		self.motorMin = [0.05,0.05,0.05] # safety limits in the OpenHand Mapping
		self.motorMax = [0.95,0.95,0.95] # safety limits in the OpenHand Mapping

		OpenHand.__init__(self,port,motor_assignments,dyn_model)

		if runTuning:
			print("[INFO] Initializing motor tuning procedure...")
			self.tuneMotors()

		

	#move servo according to amnt, not encoder value, scaled between designated min/max values
	def moveMotors(self,indices,setpts,max_motor_speed=0.01,delay=0.01,oride=False,printout=True):
		'''
		Moves all of the motors in small steps such that they all reach the set point at the same time
		max_motor_speed is the amount the motor can move in the Operable Range Mapping with in the time of delay (sec)

		indices         - list of indices refering to motors
		stepts          - 3x1 numpy array of setpoints in motor space
		max_motor_speed - the maximum amount in motor space that motors can move for a given step
		delay           - time delay (in seconds) per step
		oride           - boolean overriding the the max_motor_speed restriction
		printout        - boolean used to control printing
		'''
		# check that setpts and indices are in bounds
		for i in range(len(indices)):
			index = indices[i]
			setpt = setpts[i,0]

			if setpt < 0. or setpt > 1.0:
				print( "[WARNING] motion out of bounds, capping to [0,1]. Index: "+repr(index)+", Cmd:"+repr(setpt))
			setpt = min(max(setpt,0.),1.0)
			if (index < 0 or index >= len(self.servos)):
				print( "[ERR] invalid motor index "+repr(index))

		deltas = np.copy(self.motor_states) - setpts # 3x1
		
		abs_max_delta = abs(np.max(deltas)) 

		if abs_max_delta > max_motor_speed and not oride: # need to slow down
			steps = int(np.ceil(abs_max_delta/max_motor_speed)) # calculate number of steps to take
			delta_steps = np.divide(deltas, steps) # 3x1
			if printout:
				bar = progressbar.ProgressBar(maxval=steps, \
					widgets=[progressbar.Bar('=', '[', ']'), ' ', progressbar.Percentage()])
				bar.start()

			for step in range(steps):
				for index in indices:
					self.moveMotor(index,self.motor_states[index,0]-delta_steps[index,0])
					self.motor_states[index,0] -= delta_steps[index,0]
				time.sleep(delay)
				if printout: bar.update(step+1)
			if printout: bar.finish
		
		else:
			for i in range(len(indices)):
				index = indices[i]
				setpt = setpts[i]
				self.moveMotor(index,setpt)
				self.motor_states[index,0] = setpt
			time.sleep(delay)

		return True
			

	def reset(self):
		'''
		Set the motors back to their zero positions
		'''
		time.sleep(0.5)
		print("Moving to motor state")
		print(self.motor_zeros)
		res = self.moveMotors([0,1,2],self.motor_zeros)
		if res:
			self.rt_state = (0,0)
			
		print("Done!")

	def inverse(self, rho, theta):
		# calculate the delta tendon lengths from the natural length
		Tendon_deltas = self.naturalLength*self.radius*rho*np.cos(self.tendon_randian_offsets - theta) # 3x1
		Motor_deltas  = np.divide(Tendon_deltas, self.pulley_radii) # 3x1
		setpts = np.copy(self.motor_zeros) - np.divide(Motor_deltas,self.motor_ranges) # 3x1
		return setpts
	
	def goto(self,rho,theta,speed=0.01,K=1.0,error_accept=(0.01, 0.063),_open=True,printout=True):

		if _open:
			'''
			Uses the inverse kinematics to determine motor position for a given rho and theta
			'''
			setpts = self.inverse(rho, theta) # 3x1

			if printout:
				print("Moving to motor state")
				print(setpts)

			res = self.moveMotors([0,1,2],setpts,speed,printout=printout)
			if res:
				self.rt_state = (rho, theta) # TODO: figure out if I need this

			if printout:
				print("Done!")

		else:
			'''
			The missile knows where it is becuase it knows where it isn't.
			'''
			if self.cartesian_state_actual is None:
				print("No feedback - running open loop")
				self.goto(rho,theta,speed=speed,K=K,error_accept=error_accept,_open=True,printout=printout)
				return 

			rho_actual, theta_actual = self.XYZ2RT(self.cartesian_state_actual)

			error = np.transpose(np.array([[rho-rho_actual, theta-theta_actual]])) # 2x1

			if error[0] < error_accept[0] and error[1] < error_accept[1]:
				if printout:
					print("Done!")
				return

			else:
				J = self.getJacobian(rho_actual, theta_actual) # 3x2
				d_setpts = np.dot(J, error) # 3x1

				res = self.moveMotors([0,1,2],np.add(self.motor_states,K*d_setpts),speed=speed,oride=True,printout=printout)
				if res:
					self.rt_state = (rho, theta) # TODO: figure out if I need this

				self.goto(rho_desired,theta_desired,speed=speed,K=K,error_accept=error_accept,_open=_open,printout=printout)
		
	def poseCallback(self, data):
		self.cartesian_state_actual = np.reshape(np.array([data.pose.position.x,data.pose.position.y,data.pose.position.z]),(3,1)) # 3x1


	def startFeedback(self):
		sub = rospy.Subscriber("\continuum_end_pose_base_frame", PoseStamped, qposeCallback)


	def tuneMotors(self,small=0.01,large=0.1):

		setpts = np.copy(self.motor_zeros) # 3x1
		self.moveMotors([0,1,2],setpts)
		time.sleep(0.1)

		looping = True

		while looping:
			command = input()

			# motor 0
			if 'u' in command:
				setpts[0,0] += small
			elif 'U' in command:
				setpts[0,0] += large
			elif 'j' in command:
				setpts[0,0] -= small
			elif 'J' in command:
				setpts[0,0] -= large

			# motor 1
			elif 'i' in command:
				setpts[1,0] += small
			elif 'I' in command:
				setpts[1,0] += large
			elif 'k' in command:
				setpts[1,0] -= small
			elif 'K' in command:
				setpts[1,0] -= large

			# motor 2
			elif 'o' in command:
				setpts[2,0] += small
			elif 'O' in command:
				setpts[2,0] += large
			elif 'l' in command:
				setpts[2,0] -= small
			elif 'L' in command:
				setpts[2,0] -= large

			elif "save" in command:
				print("zeros_saved")
				self.motor_zeros = np.copy(self.motor_states) # 3x1 Operable Region Mapping
				looping = False
			else:
				print("invalid command")
			
			print("Moving to motor state")
			print(self.setpts)

			self.moveMotors([0,1,2],setpts)

			time.sleep(0.1)

		print("[INFO] Done tuning!")

	def getMotorStates(self):
		return np.copy(self.motor_states)
	
	def getMotorZeros(self):
		return np.copy(self.motor_zeros)

	def getEncoderValues(self):
		for i in range(self.num_motors):
			print(self.readMotor(i))

	def followTrajectory(self, rhos, thetas, speed=0.01, K=1.0, _open=True):

		print("Starting trajectory...")
		bar = progressbar.ProgressBar(maxval=rhos.size, \
			widgets=[progressbar.Bar('=', '[', ']'), ' ', progressbar.Percentage()])
		bar.start()

		print("Starting trajectory...")
		for i in range(rhos.size):
			self.goto(rhos[i],thetas[i],speed=speed,K=K,_open=_open,printout=False)
			bar.update(i+1)
		bar.finish
		print("Done!")


	def genTrajectory(self,trajType="circle",radius=0.5,theta_0=0,revs=1,width=0.75,num=100,oride=False):

		thetas = np.array([[]])
		rhos = np.array([[]])
		
		if trajType == "circle":
			if radius > 2*self.naturalLength/np.pi and not oride:
				print("[ERR] Trajectory out of bounds - radius too large!")
			else:
				# get linear interpolation because analytical solution may not be possible
				rhos_interp  = np.linspace(0.01,np.pi/(2*self.naturalLength),num=num) # 1x100
				radii_interp = np.divide(1-np.cos(rhos_interp*self.naturalLength),rhos_interp) # 1x100
				rho = np.interp(radius,radii_interp,rhos_interp) # 1x100

				thetas = np.linspace(theta_0,theta_0+(2*np.pi*revs),num=num) # 1x100
				rhos = np.ones(thetas.size)*rho # 1x100
		
		elif trajType == "square":
			if width*np.sqrt(2)/2 > 2*self.naturalLength/np.pi and not oride:
				print("[ERR] Trajectory out of bounds - square too wide!")
			else:
				# get linear interpolation because analytical solution may not be possible
				rhos_interp  = np.linspace(0.01,np.pi/(2*self.naturalLength),num=num) # 1x100
				radii_interp = np.divide(1-np.cos(rhos_interp*self.naturalLength),rhos_interp) # 1x100

				thetas = np.linspace(theta_0,theta_0+(2*np.pi*revs),num=num) # 1x100
				radii = np.divide(width,2*np.cos(np.mod(thetas,np.pi/2))) # 1x100
				rhos = np.interp(radii,radii_interp,rhos_interp) # 1x100

		return rhos, thetas

	def getJacobian(self,rho,theta,d_rho=0.0001,d_theta=0.0001):

		J = np.array([(self.inverse(rho,theta)-self.inverse(rho+d_rho,theta))/d_rho,(self.inverse(rho,theta)-self.inverse(rho,theta+d_theta))/d_theta]) # 3x2
		return J

	def RT2XYZ(self,rhos,thetas,nl=None):
		'''
		Transform points from rho-theta space to cartesian space
		'''
		# make sure data is formatted int the proper matrix
		if nl is None:
			nl = np.array([[self.naturalLength]])
		elif np.isscalar(nl):
			nl = np.array([[nl]])
		elif len(nl.shape) == 1:
			nl = np.array([nl])

		if np.isscalar(rhos):
			rhos = np.array([[rhos]])
		elif len(rhos.shape) == 1:
			rhos = np.array([rhos])

		if np.isscalar(thetas):
			thetas = np.array([[thetas]])
		elif len(thetas.shape) == 1:
			thetas = np.array([thetas])

		x = np.dot(np.transpose(np.divide(1-np.cos(np.multiply(rhos,nl)),rhos)),np.cos(thetas)) # len(rhos)xlen(thetas)
		y = np.dot(np.transpose(np.divide(1-np.cos(np.multiply(rhos,nl)),rhos)),np.sin(thetas)) # len(rhos)xlen(thetas)
		z = np.dot(np.transpose(np.divide(np.sin(np.multiply(rhos,nl)),rhos)),np.ones(thetas.shape)) # len(rhos)xlen(thetas)

		return x,y,z

	def XYZ2RT(self,cartesian):
		'''
		Transform points from catesian space to rho-theta space
		'''
		cartesian = np.reshape(cartesian,(3,1))
		x = cartesian[0,0]
		y = cartesian[1,0]
		z = cartesian[2,0]
		theta = np.atan(y/x)

		# get linear interpolation because analytical solution may not be possible
		rhos_interp  = np.linspace(0.0001,np.pi/(2*self.naturalLength),num=100) # 1x100
		radii_interp = np.divide(1-np.cos(rhos_interp*self.naturalLength),rhos_interp) # 1x100
		rho = np.interp(np.sqrt(x**2+y**2),radii_interp,rhos_interp) # 1x100

		return rho, theta


	def plotXYZ(self,x,y,z,c='red',alpha=1.0,cmap=None,ax=None):

		if len(x.shape) > 1:
			x = x.reshape((1,x.size)).squeeze()
		if len(y.shape) > 1:
			y = y.reshape((1,y.size)).squeeze()
		if len(z.shape) > 1:
			z = z.reshape((1,z.size)).squeeze()

		if ax is None:
			ax = plt.axes(projection='3d')
		
		ax.scatter(x,y,z,s=5.0,c=c,alpha=alpha,cmap=cmap)

	def plotWorkspaceInCartesian(self,ax=None):
		'''
		Map the workspace of the robot to cartesian coordinates
		'''
		# first discretize the workspace in the 
		rhos = np.linspace(0.0001,np.pi/(2*self.naturalLength),num=100)
		thetas = np.linspace(0,2*np.pi,num=100)

		x,y,z = self.RT2XYZ(rhos, thetas)

		if ax is None:
			ax = plt.axes(projection='3d')
		ax.plot_surface(x,y,z,alpha=0.5,cmap='viridis')

	def plotTrajectoryInCartesian(self,traj,color='red',ax=None):
		'''
		Plot a trajectory path in cartesian space
		'''
		rhos, thetas = traj
		x,y,z = self.RT2XYZ(rhos, thetas)
		self.plotXYZ(x,y,z,c=color,ax=ax)

	def plotEndEffectorInCartesian(self,color='cyan',ax=None):
		'''
		plot the position of the end effector in cartesian space
		'''
		rho, theta = self.rt_state
		rho = max(rho, 0.0001) # avoid division by zero in the transform
		x,y,z, = self.RT2XYZ(rho, theta)
		self.plotXYZ(x,y,z,c='cyan',ax=ax)

	def plotArmInCartesian(self,color='blue',ax=None):
		'''
		plot a representation of hte robot arm in zartesian space
		'''
		rho, theta = self.rt_state
		rho = max(rho, 0.0001) # avoid division by zero in the transform
		nl = np.linspace(0,self.naturalLength,num=100)
		x,y,z = self.RT2XYZ(rho,theta,nl=nl)
		self.plotXYZ(x,y,z,c=color,ax=ax)



if __name__ == '__main__':

	Continuum0 = Continuum(port='COM8',motor_assignments=[2,3,4],naturalLength=0.94,runTuning=False)

	print("Starting session")
	looping = True
	trajectory = (np.array([]),np.array([]))

	while looping:

		command = input()

		if "end" in command or "done" in command or "quit" in command or "exit" in command:
			print("[INFO] Ending session")
			looping = False
		elif "tune_motors" in command:
			Continuum0.tune_motors()
		elif "goto" in command:
			rho = float(input("Enter rho: "))
			theta = float(input("Enter theta: "))
			speed = 0.01
			_open = False
			if "-s" in command:
				speed = float(input("Enter speed: "))
			if "-o" in command:
				_open = True
			if "-c" in command:
				_open = False
			Continuum0.goto(rho,theta,speed=speed,_open=_open)

		elif "reset" in command:
			Continuum0.reset()
		elif "state" in command:
			print(Continuum0.getMotorStates())
		elif "zero" in command:
			print(Continuum0.getMotorZeros())
		elif "traj" in command:
			validTraj = True

			# trajectory type
			if "-c" in command:
				trajType = "circle"
			elif "-sq" in command:
				trajType = "square"
			else:
				trajTypeInput = input("Enter trajorty type: ")
				if "circle" in trajTypeInput:
					trajType = "circle"
				elif "square" in trajTypeInput:
					trajType = "square"
			
			# traejectory speed
			speed = 0.01
			if "-sp" in command:
				try:
					speed = float(input("Enter speed (default is 0.01):"))
				except:
					speed = 0.01

			revs = 1
			if "-rev" in command:
				try:
					revs = int(float(input("Enter num revs (default is 1):")))
				except:
					revs = 1

			if trajType == "circle":
				try:
					radius = float(input("Enter radius (default is 0.5): "))
				except:
					radius = 0.5
				rhos, thetas = Continuum0.genTrajectory(trajType="circle",radius=radius)
				if "-sv" in command:
					trajectory = (rhos, thetas)
			elif trajType == "square":
				try:
					width = float(input("Enter width (default is 0.75): "))
				except:
					width = 0.75
				rhos, thetas = Continuum0.genTrajectory(trajType="square",width=width,revs=revs)
			else:
				print("Unknown trajectory")
				validTraj = False
			
			if validTraj:
				Continuum0.followTrajectory(rhos,thetas,speed=speed)
			
		elif "plot" in command:
			fig = plt.figure()
			# ax = fig.add_subplot(111, projection='3d', proj_type = 'ortho')
			ax = plt.axes(projection='3d', proj_type = 'ortho')
			# fig = plt.figure(figsize=plt.figaspect(1)*2)
			# ax = plt.gca(projection='3d', proj_type = 'ortho')
			if "-ws" in command:
				Continuum0.plotWorkspaceInCartesian(ax=ax)
			if "-tj" in command:
				Continuum0.plotTrajectoryInCartesian(trajectory,ax=ax)
			if "-ee" in command:
				Continuum0.plotEndEffectorInCartesian(ax=ax)
			if "-arm" in command:
				Continuum0.plotArmInCartesian(ax=ax)
			plt.show()

		elif "encoders" in command:
			print("Encoder values")
			Continuum0.getEncoderValues()

		else:
			print("invalid command")

		time.sleep(0.1)