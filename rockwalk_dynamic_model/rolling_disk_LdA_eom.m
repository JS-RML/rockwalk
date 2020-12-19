%{
Lagrange d'Alembert equations of motion for a falling rolling disk

Pre-requisite: run the script `rolling_disk_eom.m` to generate the file
`DynamicEquations.mat`.
%}

load DynamicEquations.mat

q = sym('q', [6,1]); % six generalized coordinates. Only 5 independent
dqdt = sym('dqdt',[6,1]); % generalized velocities
ddqdt = sym('ddqdt',[6,1]); % generalized accelerations

%------------------------------------------------------------------------%


% For L-dA equations, introduce two lagrange multipliers corresponding to
% two rolling constraints along x and y
syms lambda1 lambda2

% then, L-dA equations in terms of lambda,
L_dA_equations_lambda = simplify(EL_equations...
                                 -lambda1*rolling_constraint_matrix(1,:).'...
                                 -lambda2*rolling_constraint_matrix(2,:).');

                             
% solve for lagrange multipliers from x, y equations
[lambda1_val,lambda2_val] = lagrange_multipliers(L_dA_equations_lambda,...
                                                 q,dqdt,ddqdt,disk_center_velocity);
                    

% eliminate lagrange multipliers from the equations 
L_dA_equations = simplify(subs(L_dA_equations_lambda, [lambda1,lambda2],[lambda1_val,lambda2_val]));

                                
                                
%solve for acceleration vector

L_dA_equations_fun = matlabFunction(L_dA_equations);

vars = [ddqdt(1),ddqdt(2),ddqdt(4),ddqdt(5),ddqdt(6)];

sol_eqns = solve(L_dA_equations_fun, vars);


%------------------------------------------------------------------------%
%------------------------------------------------------------------------%

function [lambda1_val,lambda2_val] = lagrange_multipliers(L_dA_equations_lambda,...
                                                          q,dqdt,ddqdt,disk_center_velocity)

    
    syms q4(t) q5(t) q6(t)
    syms dqdt4(t) dqdt5(t) dqdt6(t) 
    syms lambda1 lambda2
    
    % Solve for lambda1
    
    lambda1_sol = solve(L_dA_equations_lambda(1),lambda1);
     
    
    dxdt_t = subs(disk_center_velocity(1),...
                  [q(4),q(5),q(6),dqdt(4),dqdt(5),dqdt(6)],...
                  [q4(t),q5(t),q6(t),dqdt4(t),dqdt5(t),dqdt6(t)]);

    ddxdt_t = diff(dxdt_t,t);
    
    ddxdt = subs(ddxdt_t,...
                [q4(t),q5(t),q6(t),...
                 diff(q4(t), t),diff(q5(t), t),diff(q6(t), t),...
                 dqdt4(t),dqdt5(t),dqdt6(t),...
                 diff(dqdt4(t), t), diff(dqdt5(t), t),diff(dqdt6(t), t)],...
                [q(4),q(5),q(6),...
                 dqdt(4),dqdt(5),dqdt(6),...
                 dqdt(4),dqdt(5),dqdt(6),...
                 ddqdt(4),ddqdt(5),ddqdt(6)]);
    
    lambda1_val = simplify(subs(lambda1_sol,ddqdt(1),ddxdt));
    
    
    
    % Solve for lambda2
    
    lambda2_sol = solve(L_dA_equations_lambda(2),lambda2);
    
    dydt_t = subs(disk_center_velocity(2),...
                  [q(4),q(5),q(6),dqdt(4),dqdt(5),dqdt(6)],...
                  [q4(t),q5(t),q6(t),dqdt4(t),dqdt5(t),dqdt6(t)]);
              
    ddydt_t = diff(dydt_t,t);
    
    ddydt = subs(ddydt_t,...
                [q4(t),q5(t),q6(t),...
                 diff(q4(t), t),diff(q5(t), t),diff(q6(t), t),...
                 dqdt4(t),dqdt5(t),dqdt6(t),...
                 diff(dqdt4(t), t), diff(dqdt5(t), t),diff(dqdt6(t), t)],...
                [q(4),q(5),q(6),...
                 dqdt(4),dqdt(5),dqdt(6),...
                 dqdt(4),dqdt(5),dqdt(6),...
                 ddqdt(4),ddqdt(5),ddqdt(6)]);
                
    lambda2_val = simplify(subs(lambda2_sol,ddqdt(2),ddydt));
    
    
end