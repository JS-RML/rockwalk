function disk_center_velocity_s = disk_center_velocity(q,dqdt,rot_sb,rot_sbprime,disk_params)
    %Compute disk center velocity in spatial frame

    
    %-------------------------------------
    radius = disk_params.radius;
    %-------------------------------------

    angular_vel_s_bprime = spatial_angular_velocity(q,dqdt,rot_sbprime);
    
    vec_G_D_b = [-radius;0;0]; %vector from ground contact to disk center in b frame
    vec_G_D_s = rot_sb*vec_G_D_b; %same vector in spatial frame

    disk_center_velocity_s = simplify(cross(angular_vel_s_bprime, vec_G_D_s));


end

