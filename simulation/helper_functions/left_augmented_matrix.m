function [left_matrix, augmented] = left_augmented_matrix(matrix_eom,...
                                                          A_rolling,...
                                                          apex_position,...
                                                          apex_velocity,...
                                                          cm_velocity, us, ...
                                                          q,dqdt)


    apex_circumferential_vel = cartesian2cylindrical_velocity(apex_position, apex_velocity);
    
    augmented = augmented_constraint_matrix(A_rolling, apex_velocity,...
                                            apex_circumferential_vel, cm_velocity, us, q, dqdt);


    left_matrix = [-augmented, zeros(4); matrix_eom.mass_matrix, -augmented.'];
end


function augmented_matrix = augmented_constraint_matrix(A_rolling, apex_velocity,...
                                                        apex_circumferential_vel,...
                                                        cm_velocity,...
                                                        us, q, dqdt)


    coeff_velx_dqdt4 =  coeffs(apex_velocity(1),dqdt(4));
    coeff_velx_dqdt5 =  coeffs(apex_velocity(1),dqdt(5));
    coeff_velx_dqdt6 =  coeffs(apex_velocity(1),dqdt(6));
    
    coeff_vely_dqdt4 =  coeffs(apex_velocity(2),dqdt(4));
    coeff_vely_dqdt5 =  coeffs(apex_velocity(2),dqdt(5));
    coeff_vely_dqdt6 =  coeffs(apex_velocity(2),dqdt(6));
    
    coeff_velz_dqdt4 =  coeffs(apex_velocity(3),dqdt(4));
    coeff_velz_dqdt5 =  coeffs(apex_velocity(3),dqdt(5));
    coeff_velz_dqdt6 =  coeffs(apex_velocity(3),dqdt(6));
    
    coeff_cm_velz_dqdt5 =  coeffs(cm_velocity(3),dqdt(5));
    coeff_cm_velz_dqdt6 =  coeffs(cm_velocity(3),dqdt(6));   
    
    coeff_velcircum_dqdt1 =  coeffs(apex_circumferential_vel,dqdt(1));
    coeff_velcircum_dqdt2 =  coeffs(apex_circumferential_vel,dqdt(2));
    coeff_velcircum_dqdt4 =  coeffs(apex_circumferential_vel,dqdt(4));
    coeff_velcircum_dqdt5 =  coeffs(apex_circumferential_vel,dqdt(5));
    coeff_velcircum_dqdt6 =  coeffs(apex_circumferential_vel,dqdt(6));


    a_x = [1,0,...
          (coeff_velx_dqdt4(2)),...
          (coeff_velx_dqdt5(2)),...
          (coeff_velx_dqdt6(2))];
      

    a_y = [0,1,...
          coeff_vely_dqdt4(2),...
          coeff_vely_dqdt5(2),...
          coeff_vely_dqdt6(2)];

%  
%     a_circum = [coeff_velcircum_dqdt1(2),...
%                 coeff_velcircum_dqdt2(2),...
%                 coeff_velcircum_dqdt4(2),...
%                 coeff_velcircum_dqdt5(2),...
%                 coeff_velcircum_dqdt6(2)];


            
    a_z = [0,0,...
          (0),...
          (coeff_velz_dqdt5(2)),...
          (coeff_velz_dqdt6(2))];



    A_apex = simplify([a_x; a_y]);

    augmented_matrix = [A_rolling; A_apex];
    
end



