clear all
close all
set(0,'defaultaxesfontsize',20);
set(0,'defaulttextfontsize',20);

addpath('./helper_functions')
%--------------------------------------------------------------------------
load('DynamicEquations.mat',...
     'matrix_eom','A_rolling','q','dqdt','ddqdt',...
     'disk_center_velocity','apex_position','apex_velocity', 'ke', 'pe')
 
eqns = load('DynamicEquations.mat');


%--------------------------------------------------------------------------

FPS = 50;
Duration = 10;
N = round(Duration*FPS);

%--------------------------------------------------------------------------
init_states.apex_vel_x = 0; 
init_states.apex_vel_y = 0; 

init_states.x = 0.0;
init_states.y = 0.0;
init_states.psi = 0;
init_states.theta = deg2rad(45);
init_states.phi = deg2rad(45);
init_states.phi_dot = 0;

%--------------------------------------------------------------------------
% for fixed apex case, these controls are zero.
us_exp = 0; 
ut_exp = 0;

%--------------------------------------------------------------------------

[left_matrix, A] = left_augmented_matrix(matrix_eom, A_rolling, apex_position,...
                                         apex_velocity, eqns.cm_velocity, us_exp, q, dqdt);

left_matrix_fun = matlabFunction(left_matrix);

%--------------------------------------------------------------------------
b_dot = constraint_input(us_exp, ut_exp);

f_ext = [0;0;0;0;0];

right_vector_sym = right_augmented_vector(matrix_eom, A, b_dot, f_ext, q, dqdt);

right_vector = subs(right_vector_sym,...
                    [dqdt(1), dqdt(2)],...
                    [disk_center_velocity(1),disk_center_velocity(2)]);


right_vector_fun = matlabFunction(subs(right_vector));

%-------------------------------------------------------------------------
xinit = compute_initial_states(A, q, dqdt, init_states);

cone_ode = @(t,x)state_dynamics(t, x, left_matrix_fun, right_vector_fun);

options = odeset('RelTol',1e-5,'AbsTol',1e-7);
[t,y] = ode45(cone_ode, linspace(0,Duration,N), xinit, options);



%--------------------------------------------------------------------------  
% Compute secondary data.
data = data_from_solution(eqns,y);
data.acc_values = compute_accelerations(t, y, left_matrix_fun, right_vector_fun);


cm_accel = cm_acceleration(eqns.cm_velocity,q,dqdt,ddqdt);
cm_accel_fun = matlabFunction(cm_accel.');
data.cm_accel_values = cm_accel_fun(data.acc_values(:,1),data.acc_values(:,2),...
                                    data.acc_values(:,3),data.acc_values(:,4),data.acc_values(:,5),...
                                    y(:,8), y(:,9), y(:,10), y(:,3), y(:,4), y(:,5));

[rot_sb, rot_sbprime] = coordinate_frames(q);
omega_spatial = spatial_angular_velocity(q,dqdt,rot_sbprime);
omega_spatial_fun = matlabFunction(omega_spatial.');
data.omega_spatial_values = omega_spatial_fun(y(:,8),y(:,9),y(:,10),y(:,3),y(:,4));


save('FixedApexSolutionAll', 't','y','data')

%--------------------------------------------------------------------------
% Plotting

plots_main(t,y,data)


figure()
subplot(5,1,1)
plot(t, y(:,1))
legend({'$x_{D}$(m)'},'Orientation', 'horizontal', 'Interpreter', 'latex')

subplot(5,1,2)
plot(t, y(:,2))
legend({'$y_{D}$(m)'},'Orientation', 'horizontal', 'Interpreter', 'latex')

subplot(5,1,3)
plot(t, y(:,3))
legend({'$\psi$'},'Orientation', 'horizontal', 'Interpreter', 'latex')

subplot(5,1,4)
plot(t, y(:,4))
legend({'$\theta$'},'Orientation', 'horizontal', 'Interpreter', 'latex')

subplot(5,1,5)
plot(t, y(:,5))
legend({'$\phi$'},'Orientation', 'horizontal', 'Interpreter', 'latex')

xlabel('Time(s)')


function dxdt = state_dynamics(t, x, left_matrix_fun, right_vector_fun)

    t
    
    q1 = x(1); 
    q2 = x(2); 
    q4 = x(3);
    q5 = x(4);
    q6 = x(5);

    dqdt1 = x(6);
    dqdt2 = x(7);
    dqdt4 = x(8);
    dqdt5 = x(9);
    dqdt6 = x(10);



    right_vector_val = right_vector_fun(dqdt4,dqdt5,dqdt6,q4,q5,q6);
                                    
    right_vector_double = double(right_vector_val);
    
    
    left_matrix_val = left_matrix_fun(q4,q5,q6);
    left_matrix_double = double(left_matrix_val);

    
    solution_vector = left_matrix_double\right_vector_double;
        
    ddqdt1 = solution_vector(1);
    ddqdt2 = solution_vector(2);
    ddqdt4 = solution_vector(3);
    ddqdt5 = solution_vector(4);
    ddqdt6 = solution_vector(5);


    dxdt = [dqdt1;dqdt2;dqdt4;dqdt5;dqdt6;...
            ddqdt1;ddqdt2;ddqdt4;ddqdt5;ddqdt6];
end


function acceleration_values = compute_accelerations(t, y, left_matrix_fun, right_vector_fun)

    acceleration_values = zeros(length(y),9); % 5 accelerations  + 4 constraints forces
    
    for k = 1:length(y)
        
        right_vector_val = right_vector_fun(y(k,8),y(k,9),y(k,10),...
                                            y(k,3),y(k,4),y(k,5));
        
        left_matrix_val = left_matrix_fun(y(k,3),y(k,4),y(k,5));

        acceleration_values(k,:) = (left_matrix_val\right_vector_val).';

    end 

end



