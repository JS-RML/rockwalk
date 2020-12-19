function xinit = compute_initial_states(A, q, dqdt, init_states)

    % first solve for dependent (velocity) states
    constraint_matrix = subs(A,...
                            [q(4),q(5),q(6)],...
                            [init_states.psi, init_states.theta, init_states.phi]);
    
    velocity_vector = [dqdt(1);dqdt(2);dqdt(4);dqdt(5);init_states.phi_dot];
    
    init_rhs_vector = [0;0;init_states.apex_vel_x;init_states.apex_vel_y];
    
    constraint_eqns = constraint_matrix*velocity_vector-init_rhs_vector;
    
    sol_constraint_eqns = solve(constraint_eqns,[dqdt(1),dqdt(2),dqdt(4),dqdt(5)]);

    
    % now, setup initial states
    
    xinit = zeros(10,1);
    xinit(1) = init_states.x; % x
    xinit(2) = init_states.y; % y
    xinit(3) = init_states.psi; % psi
    xinit(4) = init_states.theta; %theta
    xinit(5) = init_states.phi; %phi
    
    xinit(6) = sol_constraint_eqns.dqdt1; % x_dot
    xinit(7) = sol_constraint_eqns.dqdt2; % y_dot
    xinit(8) = sol_constraint_eqns.dqdt4; % psi_dot
    xinit(9) = sol_constraint_eqns.dqdt5; % theta_dot
    
    xinit(10) = init_states.phi_dot; % phi_dot


end
