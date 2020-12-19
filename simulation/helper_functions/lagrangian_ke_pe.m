function [lagrangian,ke,pe] = lagrangian_ke_pe(cm_position, cm_velocity, disk_params)
    
    % Return lagrangian, kinetic energy, and potential energy

    %-------------------------------------
    mass = disk_params.mass;
    gravity = disk_params.gravity; 
    %-------------------------------------

    %compute kinetic energy
    ke = (1/2)*mass*transpose(cm_velocity)*cm_velocity;

    %compute potential energy
    pe = mass*gravity*cm_position(3);

    %compute lagrangian
    lagrangian = simplify(ke-pe);

end

