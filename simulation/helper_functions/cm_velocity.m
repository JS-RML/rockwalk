function vel_cm_s = cm_velocity(q,dqdt, rot_sb, cone_params)
    %Compute center of mass velocity in spatial frame


    %-------------------------------------
    radius = cone_params.radius;
    x_cm = cone_params.lateral_CM_offset;
    z_cm = cone_params.vertical_CM_offset;
    %-------------------------------------

    rot_bbprime = rot_z(q(6));

    angular_velocity_s_b = body_angular_velocity(q,dqdt,rot_sb);

    angular_velocity_b_bprime = spatial_angular_velocity(q,dqdt,rot_bbprime);

    velocity_d_s = [dqdt(1);dqdt(2);dqdt(3)]; % velocity of disk center in s frame

    vec_d_cm_bprime = [x_cm;0;z_cm]; %vector from disk center (d) to center of mass (cm) in body frame
    vec_d_cm_b = rot_bbprime*vec_d_cm_bprime; %same vector in b frame

    vel_d_cm_b = cross(angular_velocity_b_bprime,vec_d_cm_b);


    vel_cm_b = vel_d_cm_b + cross(angular_velocity_s_b,vec_d_cm_b);

    vel_cm_s = velocity_d_s + rot_sb*vel_cm_b;


    % substitute z velocity
    vel_z = radius*dqdt(5)*cos(q(5));
    vel_cm_s = subs(vel_cm_s, dqdt(3), vel_z);
    
    vel_cm_s = simplify(vel_cm_s);

end

