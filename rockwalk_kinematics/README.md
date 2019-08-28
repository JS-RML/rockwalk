# Kinematics of Rocking and Walking

Based on the model for a falling rolling disk.

*TODO: Add video/gif for output*

## Pre-requisites

### Hardware:
* 9-axis motion shield affixed to Arduino Mega. But of course any other IMU is ok.
We only subscribe to orientation of the object (quaternion) and the angular velocity (in degrees).


### Software:
* `rosserial`


## Installation

Simply run the launch file

```
roslaunch rockwalk_kinematics rw_kinematics.launch
```
