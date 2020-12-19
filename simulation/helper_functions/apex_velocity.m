function vel_apex_s = apex_velocity(q,dqdt, rot_sb, cone_params)


    %-------------------------------------
    radius = cone_params.radius;
    xA = cone_params.lateral_apex_offset;
    zA = cone_params.vertical_apex_offset;
    %-------------------------------------

    rot_bbprime = rot_z(q(6));

    angular_velocity_s_b = body_angular_velocity(q,dqdt,rot_sb);

    angular_velocity_b_bprime = spatial_angular_velocity(q,dqdt,rot_bbprime);


    
    velocity_d_s = [dqdt(1);dqdt(2);dqdt(3)]; % velocity of disk center in s frame

    vec_d_apex_bprime = [xA;0;zA]; %vector from disk center (d) to center of mass (cm) in body frame
    vec_d_apex_b = rot_bbprime*vec_d_apex_bprime; %same vector in b frame

    vel_d_apex_b = cross(angular_velocity_b_bprime,vec_d_apex_b);


    vel_apex_b = vel_d_apex_b + cross(angular_velocity_s_b,vec_d_apex_b);

    vel_apex_s = velocity_d_s + rot_sb*vel_apex_b;


    % substitute z velocity
    vel_z = radius*dqdt(5)*cos(q(5));
    vel_apex_s = subs(vel_apex_s, dqdt(3), vel_z);
    
    vel_apex_s = simplify(vel_apex_s);

end
