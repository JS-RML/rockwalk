function vec_O_apex_s = apex_position(q, rot_sb, rot_sbprime, cone_params)

    
    %-------------------------------------
    radius = cone_params.radius;
    xA = cone_params.lateral_apex_offset;
    zA = cone_params.vertical_apex_offset;
    %-------------------------------------

    vec_GD_s = rot_sb*[-radius;0;0]; % ground to center of disk vector in s frame
    
    vec_D_apex_s = rot_sbprime*[xA;0;zA]; % disk center to apex vector

    vec_O_D_s = [q(1); q(2); vec_GD_s(3)]; % coodinates of disk center. z coordinate is holonomically constrained  

    vec_O_apex_s = vec_O_D_s + vec_D_apex_s; %position of apex in spatial frame
end

