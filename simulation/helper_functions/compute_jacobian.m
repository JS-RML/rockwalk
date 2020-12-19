function jacobian_matrix = compute_jacobian(apex_velocity, disk_center_velocity, dqdt)

 
    apex_velocity = subs(apex_velocity, [dqdt(1),dqdt(2)],...
                        [disk_center_velocity(1),disk_center_velocity(2)]);


    jacobian_matrix = sym('m',[3,3]);

    for count = 1:numel(apex_velocity)

%         coeffs_dqdt1 = coeffs(apex_velocity(count),dqdt(1));
%         coeffs_dqdt2 = coeffs(apex_velocity(count),dqdt(2));
        coeffs_dqdt4 = coeffs(apex_velocity(count),dqdt(4));
        coeffs_dqdt5 = coeffs(apex_velocity(count),dqdt(5));
        coeffs_dqdt6 = coeffs(apex_velocity(count),dqdt(6));
        

%         if numel(coeffs_dqdt1)==1
%             coeffs_dqdt1(2) = 0;
%         end
%         
%         if numel(coeffs_dqdt2)==1
%             coeffs_dqdt2(2) = 0;
%         end
        
        if numel(coeffs_dqdt4)==1
            coeffs_dqdt4(2) = 0;
        end

%         velocity_coeffs = [coeffs_dqdt1(2), coeffs_dqdt2(2),...
%                            coeffs_dqdt4(2), coeffs_dqdt5(2), coeffs_dqdt6(2)];

                       
        velocity_coeffs = [coeffs_dqdt4(2), coeffs_dqdt5(2), coeffs_dqdt6(2)];
        
        jacobian_matrix(count,:) = velocity_coeffs;
    end
    
    
end


