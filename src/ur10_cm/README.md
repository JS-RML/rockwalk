# UR10-CM
UR10s Cooperative Manipulation


## Brief comments on model urdf

1. Current dependency on universal_robot and robotiq gripper package. Will move the required urdfs into the current repository later.

2. The main model urdf for dual arm is "dual_arm_hong_kong_joint_limited.urdf.xacro". Note that "hong" and "kong" are the names of the arms.

3. The model consists of ur10 robot "hong", ur10 robot "kong", a two fingered robotiq gripper on "kong", a three fingered robotiq gripper on "hong" and a table to which both arms are mounted. the configuration reflects that of our lab. Changes can be made accordingly in the same file (above)

4. Also note that a cylindrical coupler was used to connect the two grippers to their respective arms to serve as the force torque sensor, due to the latters inavailability. Changes in dimension can be be made in the same model file.

4. Note that the tree is as follows (form parent to child): world -> table -> (1) hong_base_link -> ..., (2) kong_base_link -> ...

5. The other two files in the model folder are to be deleted at a later point.

6. The model can be visualized by launching the "model_display.launch" and by selecting an appropriate fixed frame.


##  TO D0:
1. Add the gripper controller support



## NOTES:
1. To use the `robotiq_joint_state_publisher`, I added a prefix `three_fingered_` in `s_model_joint_states.cpp` to comply with the prefix already added in `dual_arm_hong_kong_joint_limited.urdf.xacro`. Note that this change is in the package `robotiq/robotiq_joint_state_publisher`. `catkin_make` after making this Changes
