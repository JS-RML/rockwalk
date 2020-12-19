function right_matrix = right_augmented_vector(matrix_eom, A, b_dot, f_ext, q, dqdt)

    %b_dot is a 4x1 column vector that specifies velocity constraints on
    %due to rolling and applied on apex

    dA_dt = differentiate_constraint_matrix(A, q, dqdt);
    
    
    velocity_vector = [dqdt(1);dqdt(2);dqdt(4);dqdt(5);dqdt(6)];


    right_matrix = [dA_dt*velocity_vector - b_dot;...
                    -(matrix_eom.coriolis_matrix*velocity_vector + matrix_eom.gravity_vector) + f_ext];


end


function dA_dt = differentiate_constraint_matrix(A, q, dqdt)

    syms q4(t) q5(t) q6(t)

    A_t = subs(A, [q(4), q(5), q(6)], [q4(t), q5(t), q6(t)]);
    
    dA_dt_t = diff(A_t, t);
    
    dA_dt = subs(dA_dt_t, ...
                 [q4(t), q5(t), q6(t), diff(q4(t), t), diff(q5(t), t), diff(q6(t), t)],...
                 [q(4), q(5), q(6), dqdt(4), dqdt(5), dqdt(6)]);
    
end
