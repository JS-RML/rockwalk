function omega_vec = body_angular_velocity(q,dqdt,R)

    %output body angular velocity vector

    syms q4(t) q5(t) q6(t)

    R_t = subs(R,[q(4),q(5),q(6)],[q4(t),q5(t),q6(t)]); %rotation matrix as a function of time

    dRdt = diff(R_t,t);

    omega_skew = transpose(R_t)*dRdt; %for body angular velocity

    omega_skew_mat = formula(omega_skew);

    omega_vec_t = [omega_skew_mat(3,2);omega_skew_mat(1,3);omega_skew_mat(2,1)];

    omega_vec = simplify(subs(omega_vec_t,...
                    [q4(t),q5(t),q6(t),...
                    diff(q4(t), t),diff(q5(t), t),diff(q6(t), t)],...
                    [q(4),q(5),q(6),...
                    dqdt(4),dqdt(5),dqdt(6)]));
end
