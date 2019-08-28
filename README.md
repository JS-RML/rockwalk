



# Simulation of kinematic/dynamic motion of rocking and walking objects.

This repository contains Matlab codes for simulation of the kinematic and dynamic of rocking and walking object locomotion.
Rocking and walking object locomotion is a novel robotic manipulation firstly introduced in [manuscript](http://junseo.people.ust.hk/papers/rnw.pdf).
This manipulation technique is for transporting objects on the ground in a passive dynamic, nonprehensile manner. 
The object is manipulated to rock from side to side repeatedly; in the meantime, the force of gravity enables the object to roll along a zigzag path that is eventually heading forward.
For simultion of this motion, the object is modeled as an oblique circular cone. Considering the circular base of a conic object, the mathematical equations governing the kinematic
 and dynamic of rolling falling disk is utilized for analysis of motion of the object. As such, the mathematical analysis of rolling and falling disk provided in [1] is exploited
 to develop the Matlab codes in this repository.


# Running the codes

The repository contains Matlab M-Files for each a brief description is provided as follows.

### MainCode.m:

The simulation may be started by opening the file "mainCode.m". In this file the properties of the conic object may be defined in the first part. 
Then four different scenarios for the simulation may be chosen as:
    
	1- Kinematic motion of the object when the apex point of the cone is fixed in space.
	
	2- Kinematic motion of the object when the apex point of the cone is not fixed in space.

    3- Dynamic motion of the object when the apex point of the cone is fixed in space. 

    4- Dynamic motion of the object when the apex point of the cone is not fixed in space.
	
For each scenario, the initial condition for the simulation is set. Then Matlab function ode45 is used to integrate a system of differential equations governing 
the kinematic and dynamic of the object. These systems of differential equations regarding to each scenario are defined by the function handle "SteadyStateFunction.m" 
which is called from the file "MainCode.m" by the ode45 Matlab function. 


### SteadyStateFunction.m:

The system of differential equations governing the kinematic and dynamic of conic object is defined in the file "SteadyStateFunction.m". The inputs of this file is 
the time span between initial and final time and the initial condition of the simulation. Other necessary parameters for the simulation are retrieved for the data files
 "robot.mat" and "sim_par.mat". The system of differential equations in this file are defined as the first order state space. For the kinematic simulation the dynamic of the
 object is not required to be considered and the differential equations are derived according to constraints on the generalized coordinate. These constraints correspond
 to non-holonomic velocity constraints of rolling condition and the constraints correspond to whether the fixed or free apex point. The matrix related to these velocity 
 constraints is obtained from the "fun_Mat_a_const.m" which is a function of the generalized coordinate of the object.
 On the other hand, in dynamic simulation the matrices regarding to the dynamic of the object namely the matrices of inertia, vector of coriolis and vector of gravity are also
 needed which can be obtained from the file "dynamiceqpar.m". The inputs of this file are the general coordinate and velocity.
 
 
### fun_Mat_a_const.m:

The matrix relating the velocity constraints of the general coordinate is defined by calling the the file "fun_Mat_a_const.m".
The constraints both correspond to the non-holonomic constraints of rolling object object on the ground and the constraints corresponding to the movement of the apex point.
The inputs of this function are the general coordinates and velocity and the output is the matrix coefficient of the velocity constraint equations and the 
time derivative of this matrix.

### dynamiceqpar.m:

The matrix of inertia, vector of coriolis and vector of gravity is defined in this file.
The inputs of this function are the general coordinates and velocity and the outputs are the above mentioned matrices.

### PlotCone.m:

This M-File contains the function for 3-d plot of the object. The inputs are the variable of the general coordinate of the object and the path followed by 
the object on the ground. These inputs are used to plot the object in the current configuration.

### plotcircle3d.m

This M-File is called from "PlotCone.m" whenever a 3-D circle is required to be plotted. The inputs are the radius of the circle the coordinate of its center and the
normal vector of the circle.

### fun_Mat_Q_Force.m 

This M-File contains the function to generate a matrix to relate the force applied on the apex point to the generalized force.
As discussed in the manuscript when the object is controlled by applying force on apex point a matrix to relate the force to the generalized force in required 
which is generated by this function. The input of this function is the general coordinate of the object.




  
 
 
	
## References
[1] Jerry H. Ginsberg, "Advanced engineering dynamics", Cambridge University Press, 1998.




