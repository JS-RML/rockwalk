function [swingup] = continuous_energy_control(q,dqdt,apex_velocity)

    swingup.us = 1*(dqdt(6)*cos(q(6))) - 1.50*apex_velocity(1);

    swingup.ut = -4.5*(q(5)-deg2rad(30)) - 0.9*dqdt(5);
end

