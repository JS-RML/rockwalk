%{
Dynamics of a rolling disk with one point fixed in space. Approach is to
augment the constraint matrix. Also check our manuscript.

%}

close all
clear all


load DynamicEquations.mat 


A = augmented_constraint_matrix(rolling_constraint_matrix, cone_params, cm_velocity, dqdt);

dA_dt = differentiate_constraint_matrix(A, q, dqdt);


left_augmented_matrix = [-A, zeros(4);...
                         matrix_eom.mass_matrix, -A.'];
                     

velocity_vector = [dqdt(1);dqdt(2);dqdt(4);dqdt(5);dqdt(6)];


right_augmented_matrix = [dA_dt*velocity_vector;...
                         -(matrix_eom.coriolis_matrix*velocity_vector + matrix_eom.gravity_vector)];


solution_vector = inv(left_augmented_matrix)*right_augmented_matrix;


solution_fun = solution_functions(solution_vector, A);



save('FixedApexFunctions.mat','solution_fun')




function solution_fun = solution_functions(sol_vector, constraint_marix)

    %---------------------------------------------------------------------%
    isSymbolic = false; %should be true 
    cone_params = cone_parameters(isSymbolic);
    
    m = cone_params.mass;
    g = cone_params.gravity;
    R = cone_params.radius;
    xCM = cone_params.lateral_CM_offset;
    zCM = cone_params.vertical_CM_offset;
    xA = cone_params.lateral_apex_offset;
    zA = cone_params.vertical_apex_offset;
    %---------------------------------------------------------------------%

    solution_fun.ddqdt1 = matlabFunction(subs(sol_vector(1)));
    solution_fun.ddqdt2 = matlabFunction(subs(sol_vector(2)));
    solution_fun.ddqdt4 = matlabFunction(subs(sol_vector(3)));
    solution_fun.ddqdt5 = matlabFunction(subs(sol_vector(4)));
    solution_fun.ddqdt6 = matlabFunction(subs(sol_vector(5)));
    solution_fun.lambda1 = matlabFunction(subs(sol_vector(6)));
    solution_fun.lambda2 = matlabFunction(subs(sol_vector(7)));
    solution_fun.lambda3 = matlabFunction(subs(sol_vector(8)));
    solution_fun.lambda4 = matlabFunction(subs(sol_vector(9)));
    
    solution_fun.constraint_marix = subs(constraint_marix);


end


function augmented_matrix = augmented_constraint_matrix(rolling_constraint_matrix,...
                                                        cone_params, cm_velocity, dqdt)


    coeff_velx_dqdt4 =  coeffs(cm_velocity(1),dqdt(4));
    coeff_velx_dqdt5 =  coeffs(cm_velocity(1),dqdt(5));
    coeff_velx_dqdt6 =  coeffs(cm_velocity(1),dqdt(6));
    
    coeff_vely_dqdt4 =  coeffs(cm_velocity(2),dqdt(4));
    coeff_vely_dqdt5 =  coeffs(cm_velocity(2),dqdt(5));
    coeff_vely_dqdt6 =  coeffs(cm_velocity(2),dqdt(6));

    a1 = [1,0,...
          (coeff_velx_dqdt4(2)),...
          (coeff_velx_dqdt5(2)),...
          (coeff_velx_dqdt6(2))];
      
    a2 = [0,1,...
          (coeff_vely_dqdt4(2)),...
          (coeff_vely_dqdt5(2)),...
          (coeff_vely_dqdt6(2))];

            
    cm_velocity_matrix = simplify([a1;a2]);
    
    
    % expression for apex velocity can be obtained from center of mass
    % veloicy, by simply replacing the coordinates of center of mass with
    % those of apex
    xCM = cone_params.lateral_CM_offset;
    zCM = cone_params.vertical_CM_offset;
    xA = cone_params.lateral_apex_offset;
    zA = cone_params.vertical_apex_offset;

    fixed_point_constraint_matrix = subs(cm_velocity_matrix, [xCM,zCM], [xA,zA]);

    augmented_matrix = [rolling_constraint_matrix;fixed_point_constraint_matrix];
    
end


function dA_dt = differentiate_constraint_matrix(A, q, dqdt)

    syms q4(t) q5(t) q6(t)

    A_t = subs(A, [q(4), q(5), q(6)], [q4(t), q5(t), q6(t)]);
    
    dA_dt_t = diff(A_t, t);
    
    dA_dt = subs(dA_dt_t, ...
                 [q4(t), q5(t), q6(t), diff(q4(t), t), diff(q5(t), t), diff(q6(t), t)],...
                 [q(4), q(5), q(6), dqdt(4), dqdt(5), dqdt(6)]);
    
end
