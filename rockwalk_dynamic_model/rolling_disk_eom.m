%{
September 9, 2019

Compute equations of motion of a "falling rolling disk" with an offset
center of mass (CM) relative to the disk center. Ignore moment of inertia

%}

close all
clear all

addpath('./helper_functions')

% true if parameters defined symbolically 
isSymbolic = true; %should be true here
cone_params = cone_parameters(isSymbolic);

q = sym('q', [6,1]); % six generalized coordinates. Only 5 independent
dqdt = sym('dqdt',[6,1]); % generalized velocities
ddqdt = sym('ddqdt',[6,1]); % generalized accelerations

[rot_sb, rot_sbprime] = coordinate_frames(q);


%------------------------------------------------------------------------%

% center of mass position, velocity. Disk center velocity, and rolling
% constraint matrix

cm_position = cm_position(q, rot_sb, rot_sbprime, cone_params);

cm_velocity = cm_velocity(q,dqdt, rot_sb, cone_params);

disk_center_velocity = disk_center_velocity(q, dqdt, rot_sb, rot_sbprime, cone_params);

rolling_constraint_matrix = rolling_constraint_matrix(disk_center_velocity, dqdt);

%------------------------------------------------------------------------%


% lagrangian, kinetic energy and potential energy
[lagrangian, ke, pe] = lagrangian_ke_pe(cm_position, cm_velocity, cone_params);


% vector of partial derivatives
dLdq = [diff(lagrangian,q(1));...
        diff(lagrangian,q(2));...
        diff(lagrangian,q(4));...
        diff(lagrangian,q(5));...
        diff(lagrangian,q(6))];

% vector of generalized momenta
dLdqdt = [diff(lagrangian,dqdt(1));...
          diff(lagrangian,dqdt(2));...
          diff(lagrangian,dqdt(4));...
          diff(lagrangian,dqdt(5));...
          diff(lagrangian,dqdt(6))];

%compute time of derivative of generalized momentum
d_dLdqdt_dt = differentiate_momentum(dLdqdt,q,dqdt,ddqdt);

% Compute Euler-Lagrange Equations. We use these equations for fixed point
% rolling
EL_equations = simplify(d_dLdqdt_dt-dLdq);


% EL equations in matrix form
matrix_eom = matrix_eom(dqdt,ddqdt,EL_equations);


%------------------------------------------------------------------------%

save('DynamicEquations.mat',...
     'EL_equations','matrix_eom',...
     'cone_params','q','dqdt','ddqdt',...
     'disk_center_velocity','cm_position','cm_velocity',...
     'rolling_constraint_matrix')









