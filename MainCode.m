

clc
clear all
close all


%Generating two data files "robot" and "sim_par" to save geometric/dynamic parameters
% of the object and the parameters for simulation

workdir1=pwd;
conresdir=exist('sim_par.mat');
if conresdir~=0
    delete 'sim_par.mat'
end
conresdir=exist('robot.mat');
if conresdir~=0
    delete 'robot.mat'
end


% The parameters of the robot is defined here:

% the length from apex point A to the point C on the rim of the disk
AC=sqrt(1.5^2+(0.35+0.35)^2);

% the length from apex point A to the point B on the rim of the disk
AB=sqrt(1.5^2+(0.35-0.35)^2);

% radius of the base circle
r=0.35;

%depending variable to compute the length from apex point A to its
%projection on the base
AH=sqrt(-(1/16)*(AC^4-2*AC^2*AB^2-8*AC^2*r^2+AB^4-8*AB^2*r^2+16*r^4)/r^2);

%the length from the center of the circular base to projection of apex
%point A
OH=(1/4)*(AC^2-AB^2)/r;

% matA is the matrix of coordinates of cable attachement points in space
MatA=[0,2,3;0,-2,3;3,3,0;3,-3,0]';

%MatB_local is the coordinates of the cable attachment points on the object
%with respect to the frame attached to the object when the rolling
%orientation is zero as explaine in the manuscript
MatB_local=[-AH,0,-OH;-AH,0,-OH;0,r*cos(45*pi/180),r*sin(45*pi/180);0,r*cos(135*pi/180),r*sin(135*pi/180)]';

% coordinate of the center of mass in the frame attached to the object
r_CM_O=[0.15;0;0.29];

%matrix of moment of inertia
% Mat_I=[0,-1,0;-1,0,0;0,0,-1]*([0.21,0,0;0,0.2,0.05;0,0.05,0.09]*[0,-1,0;-1,0,0;0,0,-1]');
Mat_I=zeros(3,3);

% mass of the object
m=1.04;

% Gravitational acceleration
g=9.81;


% All the parameters of the object is saved in robot.mat which is called
% whnever required
save('robot','AC','AB','r','AH','OH','MatA','MatB_local','r_CM_O','Mat_I','m','g');

%This code solve the differential equations in state space. in general the
%pose of the object is defined by 6 general coordinate namely the
%coordinate of the center of the circular disk and the euler angles. As
%such, 12 state space first order variables q_1,q_2,...,q_12 may be defined as:

%q_1: x_O
%q_2: y_O
%q_3: z_O
%q_4: psi
%q_5: theta
%q_6: phi
%q_7: d_x_O
%q_8: d_y_O
%q_9: d_z_O
%q_10: d_psi
%q_11: d_theta
%q_12: d_phi


% Different scenarios for the simulation are considered and each are chosen
% by changing the value of the variable "sim_num" as:
% sim_num=1---->> kinematic simulation with fixed apex point
% sim_num=2---->> kinematic simulation with non-fixed apex point
% sim_num=3---->> dynamic simulation with fixed apex point
% sim_num=4---->> dynamic simulation with non-fixed apex point

sim_num=3;

%------------------------------------------------------
%kinematic fixed apex point
if sim_num==1
    
    % the initial condition for the case the apex point is fixed is defined here
    % the initial value of the euler angles
    Init_psi=0*pi/180;
    Init_theta=45*pi/180;
    Init_phi=0*pi/180;
    
    %with respect to initial values of the euler angles the initial values
    %of the coordinate of center of the disk is computed here by assuming
    %that the apex point is fixed as the cefernce point of the frame fixed
    %in space
    alpha_min=atan(AH/(r-OH));
    if alpha_min<0
        alpha_min=alpha_min+pi;
    end
    min_radi=AB*cos(pi-Init_theta-alpha_min); %for the case of fixed apex point
    
    MatR1z=[-sin(Init_psi) -cos(Init_psi) 0; cos(Init_psi) -sin(Init_psi) 0; 0 0 1;];
    MatR2y = [cos(Init_theta) 0 sin(Init_theta); 0 1 0; -sin(Init_theta) 0 cos(Init_theta);];
    Init_r_O=[0;-min_radi;0]+MatR1z*MatR2y*[-r;0;0];
    
    Init_x_O=Init_r_O(1,1);
    Init_y_O=Init_r_O(2,1);
    Init_z_O=Init_r_O(3,1);
    
    % the initial rolling angular velucity is defined here
    Init_d_phi=1*pi/6;
    
    % the adjustment for the event functions in ode45.
    %refer to the ode45 help for event function
    isterminal = 0;  % Halt integration
    direction = 0;   % The zero can be approached from either direction
    save('eventopt','isterminal','direction');
    save('sim_par','sim_num','Init_d_phi');
    opts = odeset('Events',@EventsFcn);
    
    %The initial velocity shoud satisfy the constraint equations.
    %here there is only one free variable and the other 5 variables are
    %computed with respect to the constraints of rolling without slippage
    %and fixed apex point
    [Mat_a_const,Mat_d_a_const]=fun_Mat_a_const([Init_x_O;Init_y_O;Init_z_O;Init_psi;Init_theta;Init_phi],zeros(6,1));
    depend_vel_var=-inv(Mat_a_const(1:5,1:5))*Mat_a_const(1:5,6)*Init_d_phi;
    Init_d_x_O=depend_vel_var(1,1);Init_d_y_O=depend_vel_var(2,1);Init_d_z_O=depend_vel_var(3,1);Init_d_psi=depend_vel_var(4,1);Init_d_theta=depend_vel_var(5,1);
    
    
    % setting the time span and calling the ode45 for integrating the
    % differential equations
    t_end=100;
    t_span=0:t_end/500:t_end;
    initial_cond=[Init_x_O;Init_y_O;Init_z_O;Init_psi;Init_theta;Init_phi;Init_d_x_O;Init_d_y_O;Init_d_z_O;Init_d_psi;Init_d_theta;Init_d_phi]; %
    [vect_t,Var,vect_te,Vare,ie]=ode45(@SteadyStateFunction,t_span,initial_cond,opts);
    
    % here the path tracked by the object on the ground is computed with
    % respect to the result of the integration from ode45
    [glob_coor_xyz,glob_coor_A]=fun_coorG(Var);
    
    % This part is for inner/outer circles and trajectory with fixed apex point
    for it=1:length(t_span)
        radi(it)=norm(glob_coor_xyz(it,1:2));
    end
    figure
    plot(glob_coor_xyz(:,1),glob_coor_xyz(:,2),'k')
    hold on
    angspan=0:2*pi/100:2*pi;
    plot(max(radi)*cos(angspan),max(radi)*sin(angspan),'r');
    plot(min(radi)*cos(angspan),min(radi)*sin(angspan),'b');
    
    
    %----------------------------------------------------------
    %kinematic non-fixe apex point
elseif sim_num==2
    % in this part it is assumed that the apex point is not fixed anymore
    % each of the euler angles are supposed to follow a priodic
    % trjectory
    period_psi=2.3;
    period_theta=2.3;
    period_phi=2.3;
    omega_psi=2*pi/period_psi;
    omega_theta=2*pi/period_theta;
    omega_phi=2*pi/period_phi;
    max_amplitude_phi=60*pi/180;
    coeff_t_phi=max_amplitude_phi/(5*period_phi);
    amplitut_psi=30*pi/180;
    amplitut_theta=0*pi/180;
    diff_phase_psi=pi/2;
    diff_phase_theta=0;
    diff_phase_phi=0;
    save('sim_par','sim_num','period_psi','period_theta','period_phi','amplitut_psi','amplitut_theta','max_amplitude_phi','diff_phase_psi','diff_phase_theta','diff_phase_phi');
    
    
    % setting the initial conditions
    Init_psi=amplitut_psi;
    Init_theta=45*pi/180;
    Init_phi=0*pi/180;
    
    MatR1z=[cos(Init_psi) -sin(Init_psi) 0; sin(Init_psi) cos(Init_psi) 0; 0 0 1;];
    MatR2y = [cos(Init_theta) 0 sin(Init_theta); 0 1 0; -sin(Init_theta) 0 cos(Init_theta);];
    Init_r_O=[0;0;0]+MatR1z*MatR2y*[-r;0;0];
    
    Init_x_O=Init_r_O(1,1);
    Init_y_O=Init_r_O(2,1);
    Init_z_O=Init_r_O(3,1);
    
    
    
    % Setting the initial velocity of the euler angles
    Init_d_psi=amplitut_psi*omega_psi*cos(omega_psi*0+diff_phase_psi);
    Init_d_theta=amplitut_theta*omega_theta*cos(omega_theta*0+diff_phase_theta);
    Init_d_phi=(coeff_t_phi*0)*omega_phi*cos(omega_phi*0+diff_phase_phi);
    
    %The initial velocity shoud satisfy the constraint equations
    %here the euler angles are free variables and the other variables are
    %computed with respect to the constraints of rolling without slippage
    [Mat_a_const,Mat_d_a_const]=fun_Mat_a_const([Init_x_O,Init_y_O,Init_z_O,Init_psi,Init_theta,Init_phi],zeros(6,1));
    depend_vel_var=-inv(Mat_a_const(1:3,1:3))*Mat_a_const(1:3,4:6)*[Init_d_psi;Init_d_theta;Init_d_phi];
    Init_d_x_O=depend_vel_var(1,1);Init_d_y_O=depend_vel_var(2,1);Init_d_z_O=depend_vel_var(3,1);
    
    % setting the time span and calling the ode45
    t_end=12;
    t_span=0:t_end/500:t_end;
    initial_cond=[Init_x_O;Init_y_O;Init_z_O;Init_psi;Init_theta;Init_phi;Init_d_x_O;Init_d_y_O;Init_d_z_O;Init_d_psi;Init_d_theta;Init_d_phi]; %
    
    isterminal = 0;  % Halt integration
    direction = 0;   % The zero can be approached from either direction
    save('eventopt','isterminal','direction');
    opts = odeset('Events',@EventsFcn);
    [vect_t,Var,vect_te,Vare,ie]=ode45(@SteadyStateFunction,t_span,initial_cond,opts);
    
    
    %--------------------------------------------------
    %dynamic fixed apex point
elseif sim_num==3
    save('sim_par','sim_num');
    
    % setting the initial conditions
    Init_psi=0*pi/180;
    Init_theta=45*pi/180;
    Init_phi=45*pi/180;
    
    
    alpha_min=atan(AH/(r-OH));
    if alpha_min<0
        alpha_min=alpha_min+pi;
    end
    min_radi=AB*cos(pi-Init_theta-alpha_min); %for the case of fixed apex point
    
    MatR1z=[-sin(Init_psi) -cos(Init_psi) 0; cos(Init_psi) -sin(Init_psi) 0; 0 0 1;];
    MatR2y = [cos(Init_theta) 0 sin(Init_theta); 0 1 0; -sin(Init_theta) 0 cos(Init_theta);];
    Init_r_O=[0;-min_radi;0]+MatR1z*MatR2y*[-r;0;0];
    Init_r_O(2)=0;
    
    Init_x_O=Init_r_O(1,1);
    Init_y_O=Init_r_O(2,1);
    Init_z_O=Init_r_O(3,1);
    
    %The initial velocity shoud satisfy the constraint equations
    %here there is only one free variable and the other 5 variables are
    %computed with respect to the constraints of rolling without slippage
    %and fixed apex point
    
    [Mat_a_const,Mat_d_a_const]=fun_Mat_a_const([Init_x_O,Init_y_O,Init_z_O,Init_psi,Init_theta,Init_phi],zeros(1,6));
    Init_d_phi=0*pi/180;
    depend_vel_var=-inv(Mat_a_const(1:5,1:5))*Mat_a_const(1:5,6)*Init_d_phi;
    Init_d_x_O=depend_vel_var(1,1);Init_d_y_O=depend_vel_var(2,1);Init_d_z_O=depend_vel_var(3,1);Init_d_psi=depend_vel_var(4,1);Init_d_theta=depend_vel_var(5,1);
    isterminal = 0;  % Halt integration
    direction = 0;   % The zero can be approached from either direction
    save('eventopt','isterminal','direction');
    opts = odeset('Events',@EventsFcn);
    t_end=10;
    t_span=0:t_end/500:t_end;
    initial_cond=[Init_x_O;Init_y_O;Init_z_O;Init_psi;Init_theta;Init_phi;Init_d_x_O;Init_d_y_O;Init_d_z_O;Init_d_psi;Init_d_theta;Init_d_phi]; %
    [Mat_a_const,Mat_d_a_const]=fun_Mat_a_const(initial_cond(1:6,1),initial_cond(7:12,1));
    Mat_a_const*initial_cond(7:12,1)
    
    [vect_t,Var,vect_te,Vare,ie]=ode45(@SteadyStateFunction,t_span,initial_cond,opts);
    
    
    
    %---------------------------------------------
    %dynamic with Euler-Angles-Velocity-constrained
elseif sim_num==4
    
    
    period_psi=1.3184;
    period_theta=1.3184;
    omega_psi=2*pi/period_psi;
    omega_theta=2*pi/period_theta;
    amplitut_psi=10*pi/180;
    amplitut_theta=0*pi/180;
    diff_phase_psi=0;
    diff_phase_theta=0;
    save('sim_par','sim_num','period_psi','period_theta','amplitut_psi','amplitut_theta','diff_phase_psi','diff_phase_theta');
    
    % setting the initial conditions
    Init_psi=0*pi/180;
    Init_theta=60*pi/180;
    Init_phi=0*pi/180;
    
    MatR1z=[-sin(Init_psi) -cos(Init_psi) 0; cos(Init_psi) -sin(Init_psi) 0; 0 0 1;];
    MatR2y = [cos(Init_theta) 0 sin(Init_theta); 0 1 0; -sin(Init_theta) 0 cos(Init_theta);];
    Init_r_O=[0;0;0]+MatR1z*MatR2y*[-r;0;0];
    
    Init_x_O=Init_r_O(1,1);
    Init_y_O=Init_r_O(2,1);
    Init_z_O=Init_r_O(3,1);
    
    % setting the initial velocity of euler angles
    Init_d_psi=amplitut_psi*omega_psi*cos(omega_psi*0+diff_phase_psi);
    Init_d_theta=amplitut_theta*omega_theta*cos(omega_theta*0+diff_phase_theta);
    Init_d_phi=0;%150*pi/180;
    
    %The initial velocity shoud satisfy the constraint equations
    %here the euler angles are free variables and the other variables are
    %computed with respect to the constraints of rolling without slippage
    [Mat_a_const,Mat_d_a_const]=fun_Mat_a_const([Init_x_O,Init_y_O,Init_z_O,Init_psi,Init_theta,Init_phi],zeros(1,6));
    
    depend_vel_var=-inv(Mat_a_const(1:3,1:3))*Mat_a_const(1:3,4:6)*[Init_d_psi;Init_d_theta;Init_d_phi];
    Init_d_x_O=depend_vel_var(1,1);Init_d_y_O=depend_vel_var(2,1);Init_d_z_O=depend_vel_var(3,1);
    isterminal = 0;  % Halt integration
    direction = 0;   % The zero can be approached from either direction
    save('eventopt','isterminal','direction');
    opts = odeset('Events',@EventsFcn);
    t_end=5;
    t_span=0:t_end/500:t_end;
    initial_cond=[Init_x_O;Init_y_O;Init_z_O;Init_psi;Init_theta;Init_phi;Init_d_x_O;Init_d_y_O;Init_d_z_O;Init_d_psi;Init_d_theta;Init_d_phi]; %
    [vect_t,Var,vect_te,Vare,ie]=ode45(@SteadyStateFunction,t_span,initial_cond,opts);
    
end



[glob_coor_xyz,glob_coor_A]=fun_coorG(Var);


% % This part is to plot A_theta*sin(omega_theta*t)
% figure
% plot(vect_t,Var(:,6),'-b')
% freq(1)=vect_te(length(vect_te))-vect_te(length(vect_te)-2);
% freq(2)=vect_te(length(vect_te)-2)-vect_te(length(vect_te)-4);
% freq(3)=vect_te(length(vect_te)-4)-vect_te(length(vect_te)-6);
% vect_freq=2*pi/mean(freq);
% vect_max_phi=max(Var(:,6));
% hold on
% plot(vect_t,vect_max_phi*sin(vect_freq*vect_t),'r')



% %%This part is to plot the trajectory and the points with phi=0
% figure
% plot(glob_coor_xyz(:,1),glob_coor_xyz(:,2),'k');
% xlabel('x(m)')
% ylabel('y(m)')
% axis([4 6 -1 1])
% hold on
% [glob_coor_xyz_e,glob_coor_A_e]=fun_coorG(Vare);
% for itie=1:length(ie)
%     plot(glob_coor_xyz_e(itie,1),glob_coor_xyz_e(itie,2),'bo');
% end
% plot(glob_coor_xyz_e(:,1),glob_coor_xyz_e(:,2),'b-.')
%


figure
plot(vect_t(:,1),Var(:,6),'b')

figure
plot(vect_t(:,1),Var(:,4),'b')
hold on
plot(vect_t(:,1),Var(:,5),'r')
plot(vect_t(:,1),Var(:,6),'g')
axis([0 20 -1.5 3])
% xlabel('t')
% ylabel('rad')
% legend('\psi','\theta','\phi')




figure
plot(glob_coor_A(:,1),glob_coor_A(:,2))
figure
mat_frame=PlotCone(Var,glob_coor_xyz);



v_cone = VideoWriter('TrajZigzagCone.avi');
v_cone.FrameRate=round(length(vect_t)/vect_t(end,1));
open(v_cone);
writeVideo(v_cone,mat_frame);
close(v_cone);
% movie(mat_frame,1,round(length(vect_t)/vect_t(end,1)))





