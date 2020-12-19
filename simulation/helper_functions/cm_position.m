function vec_O_CM_s = cm_position(q, rot_sb, rot_sbprime, cone_params)

    %-------------------------------------
    radius = cone_params.radius;
    x_cm = cone_params.lateral_CM_offset;
    z_cm = cone_params.vertical_CM_offset;
    %-------------------------------------

    vec_GD_s = rot_sb*[-radius;0;0]; % ground to center of disk vector in s frame
    
    vec_D_CM_s = rot_sbprime*[x_cm;0;z_cm]; % disk center to center of mass

    vec_O_D_s = [q(1); q(2); vec_GD_s(3)]; % coodinates of disk center. z coordinate is holonomically constrained  

    vec_O_CM_s = vec_O_D_s + vec_D_CM_s; %position of center of mass in spatial frame

end
