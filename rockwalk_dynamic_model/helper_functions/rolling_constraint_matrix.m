function A_matrix = rolling_constraint_matrix(disk_center_vel, dqdt)

    % Returns rolling constraint matrix (2 by 5)

    coeff_velx_dqdt4 =  coeffs(disk_center_vel(1),dqdt(4));
    coeff_velx_dqdt5 =  coeffs(disk_center_vel(1),dqdt(5));
    coeff_velx_dqdt6 =  coeffs(disk_center_vel(1),dqdt(6));
    
    coeff_vely_dqdt4 =  coeffs(disk_center_vel(2),dqdt(4));
    coeff_vely_dqdt5 =  coeffs(disk_center_vel(2),dqdt(5));
    coeff_vely_dqdt6 =  coeffs(disk_center_vel(2),dqdt(6));

    a1 = [1,0,...
          -(coeff_velx_dqdt4(2)),...
          -(coeff_velx_dqdt5(2)),...
          -(coeff_velx_dqdt6(2))];
      
    a2 = [0,1,...
          -(coeff_vely_dqdt4(2)),...
          -(coeff_vely_dqdt5(2)),...
          -(coeff_vely_dqdt6(2))];

            
    A_matrix = simplify([a1;a2]);
end
