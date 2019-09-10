clear all
close all


load('DynamicEquations.mat', 'q', 'dqdt')


FPS = 30;
Duration = 10;
N = round(Duration*FPS);


init_psi = 0;
init_theta = pi/4;
init_phi = pi/2;
init_phi_dot = 0;

xinit = compute_initial_states(q, dqdt, init_psi, init_theta, init_phi, init_phi_dot);

cone_ode = @(t,x)state_dynamics(x);

[t,y] = ode45(cone_ode, linspace(0,Duration,N), xinit);


plots(t,y)

% z coordinate (and corresponding velocity) can be computed from y
% note, z = R*sin(theta); z_dot = R*cos(theta)*theta_dot
% here, theta = y(:,4) and theta_dot = y(:,9)

save('FixedApexSolution', 'y')


function dxdt = state_dynamics(x)

    load FixedApexFunctions.mat

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

    ddqdt1 = solution_fun.ddqdt1(dqdt4,dqdt5,dqdt6,q4,q5,q6);
    ddqdt2 = solution_fun.ddqdt2(dqdt4,dqdt5,dqdt6,q4,q5,q6);
    ddqdt4 = solution_fun.ddqdt4(dqdt4,dqdt5,dqdt6,q4,q5,q6);
    ddqdt5 = solution_fun.ddqdt5(dqdt4,dqdt5,dqdt6,q4,q5,q6);
    ddqdt6 = solution_fun.ddqdt6(dqdt4,dqdt5,dqdt6,q4,q5,q6);


    dxdt = [dqdt1;dqdt2;dqdt4;dqdt5;dqdt6;...
            ddqdt1;ddqdt2;ddqdt4;ddqdt5;ddqdt6];
end


function xinit = compute_initial_states(q, dqdt, init_psi, init_theta, init_phi, init_phi_dot)


    load FixedApexFunctions.mat

    % first solve for dependent (velocity) states
    constraint_matrix = subs(solution_fun.constraint_marix,...
                            [q(4),q(5),q(6)],...
                            [init_psi, init_theta, init_phi]);
    
    velocity_vector = [dqdt(1);dqdt(2);dqdt(4);dqdt(5);init_phi_dot];
    
    constraint_eqns = constraint_matrix*velocity_vector;
    
    sol_constraint_eqns = solve(constraint_eqns,[dqdt(1),dqdt(2),dqdt(4),dqdt(5)]);
    
    % now, setup initial states
    
    xinit = zeros(10,1);
    xinit(1) = 0; % x
    xinit(2) = 0; % y
    xinit(3) = init_psi; % psi
    xinit(4) = init_theta; %theta
    xinit(5) = init_phi; %phi
    
    xinit(6) = sol_constraint_eqns.dqdt1; % x_dot
    xinit(7) = sol_constraint_eqns.dqdt2; % y_dot
    xinit(8) = sol_constraint_eqns.dqdt4; % psi_dot
    xinit(9) = sol_constraint_eqns.dqdt5; % theta_dot
    
    xinit(10) = init_phi_dot; % phi_dot



end


function plots(t,y)


    subplot(3,2,1)
    plot(t,y(:,1))
    % hold on
    % plot(t, y(:,6))
    title('x')

    subplot(3,2,2)
    plot(t,y(:,2))
    % hold on
    % plot(t, y(:,7))
    title('y')


    subplot(3,2,3)
    plot(t,y(:,3))
    % hold on
    % plot(t, y(:,8))
    title('\psi')

    subplot(3,2,4)
    plot(t,y(:,4))
    % hold on
    % plot(t, y(:,9))
    title('\theta')

    subplot(3,2,5)
    plot(t,y(:,5))
    % hold on
    % plot(t, y(:,10))
    title('\phi')

end


