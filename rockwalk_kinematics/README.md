# Kinematics of Rocking and Walking

Based on the model for a falling rolling disk.

**INPUT**
Subscribes to topics from an IMU
1. Orientation @
2. Angular Velocity @

**OUTPU**

*TODO: Add video/gif for output*

## Pre-requisites

### Hardware:
* 9-axis motion shield affixed to Arduino Mega. But of course any other IMU is ok.
We only subscribe to orientation of the object (quaternion) and the angular velocity (in degrees).


### Software:
* `rosserial`


## Installation
Upload the code in `/arduino` to Arduino board equipped with a 9-axis motion shield.

Simply run the launch file

```
roslaunch rockwalk_kinematics rw_kinematics.launch
```
