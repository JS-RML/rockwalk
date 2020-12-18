# *Rock-and-Walk*

## 1. Overview
This package is an implementation of a novel robotic manipulation capability for transporting an object on the ground in a dynamic and nonprehensile manner. The object is manipulated to rock from side to side repeatedly; in the meantime, the force of gravity enables the object to roll along a zigzag path that is eventually heading forward. We call it ***rock-and-walk*** object manipulation. Our work is motivated by an interesting question in archaeology, how the giant rock statues of Easter Island (known as “moai”) were transported several hundred years ago, and a recent demonstration done by archaeologists that it is possible to “walk” the statue by repeated rocking. Our rock-and-walk object transport technique is implemented in multiple robotic settings: 1) one robot arm with an end-effector that can cage the object, 2) two robot arms to interact with the object via cables, and 3) an aerial robot with the caging end-effector.

![](https://github.com/HKUST-RML/rockwalk/blob/master/media/intro_photo_github-01-01.png)


**Full Video Link**

[Rock-and-Walk video](https://drive.google.com/file/d/1Nx8kZgXvVKMN7lSgfyp2BvnqaPJYh2qx/view?usp=sharing)

**Published Papers**

A. Nazir and J. Seo, "[Passive Dynamic Object Locomotion by Rocking and Walking Manipulation](https://ieeexplore.ieee.org/document/8794163)," 2019 International Conference on Robotics and Automation (ICRA), Montreal, QC, Canada, 2019, pp. 7926-7932, doi: 10.1109/ICRA.2019.8794163.


## 2. Prerequistes

### 2.1 Hardware
* [Universal Robot UR10 Robot Arm](https://www.universal-robots.com/products/ur10-robot/)
* [Arduino Mega 2560](https://store.arduino.cc/usa/mega-2560-r3) and an [Arduino 9 Axis Motion Shield](https://store.arduino.cc/usa/9-axis-motion-shield)


### 2.2 Software
* [python-urx](https://github.com/SintefManufacturing/python-urx)
