# *Rock-and-Walk*

## 1. Overview
This package is an implementation of a novel robotic manipulation capability for transporting an object on the ground in a dynamic and nonprehensile manner. The object is manipulated to rock from side to side repeatedly; in the meantime, the force of gravity enables the object to roll along a zigzag path that is eventually heading forward. We call it ***rock-and-walk*** object manipulation.

Our work is motivated by an interesting question in archaeology, how the giant rock statues of Easter Island (known as “moai”) were transported several hundred years ago, and a recent [demonstration](https://www.youtube.com/watch?v=J5YR0uqPAI8&ab_channel=NationalGeographic) done by archaeologists that it is possible to “walk” the statue by repeated rocking. Our rock-and-walk object transport technique is implemented in multiple robotic settings: 1) one robot arm with an end-effector that can cage the object, 2) two robot arms to interact with the object via cables, and 3) an aerial robot with the caging end-effector.

![](https://github.com/HKUST-RML/rockwalk/blob/master/media/intro_photo_github_new-01.png)


[**Full Video Link**](https://drive.google.com/file/d/1Nx8kZgXvVKMN7lSgfyp2BvnqaPJYh2qx/view?usp=sharing)

**Published Papers**

A. Nazir and J. Seo, "[Passive Dynamic Object Locomotion by Rocking and Walking Manipulation](https://ieeexplore.ieee.org/document/8794163)," 2019 International Conference on Robotics and Automation (ICRA), Montreal, QC, Canada, 2019, pp. 7926-7932, doi: 10.1109/ICRA.2019.8794163.


## 2. Prerequistes

### 2.1 Hardware
* [Arduino Mega 2560](https://store.arduino.cc/usa/mega-2560-r3) and an [Arduino 9 Axis Motion Shield](https://store.arduino.cc/usa/9-axis-motion-shield)
* [Universal Robot UR10 Robot Arm](https://www.universal-robots.com/products/ur10-robot/)


### 2.2 Software
* [Matlab](https://www.mathworks.com/products/matlab.html) for object's passive dynamics simulation
* [ROS](https://www.ros.org/) and [python-urx](https://github.com/SintefManufacturing/python-urx) for robot control
* [rosserial](http://wiki.ros.org/rosserial) to acquire data from Arduino 9 Axis Motion Shield
* [teleop_twist_keyboard](https://github.com/ros-teleop/teleop_twist_keyboard) to perform teleoperated rock-and-walk on a treadmill

### 2.3 Build on ROS
Using [catkin_tools](https://catkin-tools.readthedocs.io/en/latest/installing.html) in your catkin workspace
```
cd ~/catkin_ws/src
git clone https://github.com/HKUST-RML/rockwalk.git
cd ..
catkin build
```

## 3. Usage


### 3.1 Passive Dynamics Simulation

Our Matlab implementation computes passive dynamics of the object, modeled as an oblique-cone that has a circular base and a vertical rod attached to it, as it rolls without slipping on a flat surface. The motion of the object can be visualized in [RViz](http://wiki.ros.org/rviz).

To first obtain and then solve the dynamic model in Matlab
```
>> cd simulation/
>> rolling_disk_eom.m
>> fixed_apex_sim.m
```
Parmeters for the oblique-cone model can be altered in the `simulation/cone_parameters.m` file. To visualize the simulation in RViz
```
roslaunch simulation_rviz fixed_apex.launch
```

<p align="center">
  <img width="40%" src="https://github.com/HKUST-RML/rockwalk/blob/master/media/rviz_simulation.gif">
</p>


### 3.2 Rock-and-Walk by Single- and Dual-Arm Manipulation

First, publish motion shield data in ROS using rosserial. Then calibrate the motion shield and use the output to compute object state:
```
rosrun rosserial_python serial_node.py _port:=/dev/ttyACM0 _baud:=115200

*calibrate motion sheild*

rosrun rockwalk_kinematics rockwalk_kinematics_node
```

Then run the following nodes to implement rock-and-walk in a single-arm setting with a caging end-effector, or, in a dual-arm setting with cables:

```
rosrun rockwalk_ur10_control single_arm_caging_labfloor_rockwalk
rosrun rockwalk_ur10_control dual_arm_cable_labfloor_rockwalk
```

<p align="center">
  <img height="200" src="https://github.com/HKUST-RML/rockwalk/blob/master/media/caging_rockwalk.gif">
  <img height="200" src="https://github.com/HKUST-RML/rockwalk/blob/master/media/cable_rockwalk.gif">
</p>


### 3.3 Rock-and-Walk by Aerial Manipulation

