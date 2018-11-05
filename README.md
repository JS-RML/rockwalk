# PRW-Manipulation
Passive Dynamic Object Locomotion by Rocking and Walking Manipulation

## Usage

- First execute `vector_fields.m` in `MATLAB` with dimensions of oblique cone of choice. This will generate three `.mat` files, namely, `vector_field_pos.mat`, `vector_field_neg.mat` and `params.mat`. The former two store the annular vector fields while the latter stores the associated parameters. These three files will be used by `integral_curves_concatenate` in the next step. `vector_fields.m` will also output a figure showing an annulus filled with (positive) vector field and an example streamline. The streamline denotes the path of the ground contact point on the basr rim of the cone. 

- Then run `integral_curves_concatenate.m`. This file outputs a sequence of oblique cone's apex positions (correspondingly, the end-effector positions of a robot manipulator attached to the cone's apex). If these sequence of waypoints are followed, a net straight line displacement of the cone is obtained through alternate rocking. In this script, total number of rocking steps (`total_rocking_steps`) and `rocking_angle` may be altered. A large value of `rocking_angle` means that the end-effector moves large displacement and can potentially make the system (robot+object_cone) unstable. A small value, on the other hand, would result in a small net forward displacement per rocking step.


## Deomonstration
To see how the parameters are defined and a demonstration of the manipulation, take a look at the following video.

<a href="https://drive.google.com/file/d/1rxQy9nd6O5Jt5PxMQcQ-WqnGz0_dPL5v/preview"><img src="https://drive.google.com/file/d/1rxQy9nd6O5Jt5PxMQcQ-WqnGz0_dPL5v/preview" style="width: 500px; max-width: 100%; height: auto" title="Click for the larger version." /></a>


<iframe src="https://drive.google.com/file/d/1rxQy9nd6O5Jt5PxMQcQ-WqnGz0_dPL5v/preview" width="640" height="480"></iframe>
