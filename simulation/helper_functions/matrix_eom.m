function matrix_eom = matrix_eom(dqdt,ddqdt,eom)
    %{Return equation of motions in matrix form. See pg. 

    %}

    mass_matrix = sym('m',[5,5]);
    intermediate_matrix = sym('m',[5,1]); % an intermediate matrix container
    coriolis_matrix = sym('m',[5,5]); % coriolis matrix can be obtained from this matrix
    gravity_vector = sym('m',[5,1]);

    for count = 1:numel(eom)
        
        % First, compute mass matrix

        coeffs_ddqdt1 = coeffs(eom(count),ddqdt(1));
        coeffs_ddqdt2 = coeffs(eom(count),ddqdt(2));
        coeffs_ddqdt4 = coeffs(eom(count),ddqdt(4));
        coeffs_ddqdt5 = coeffs(eom(count),ddqdt(5));
        coeffs_ddqdt6 = coeffs(eom(count),ddqdt(6));

        if numel(coeffs_ddqdt1)==1
            coeffs_ddqdt1(2) = 0;
        end

        if numel(coeffs_ddqdt2)==1
            coeffs_ddqdt2(2) = 0;
        end

        if numel(coeffs_ddqdt4)==1
            coeffs_ddqdt4(2) = 0;
        end
        if numel(coeffs_ddqdt5)==1
            coeffs_ddqdt5(2) = 0;
        end
        if numel(coeffs_ddqdt6)==1
            coeffs_ddqdt6(2) = 0;
        end

        second_derivative_coeffs = [...
                                    coeffs_ddqdt1(2),...
                                    coeffs_ddqdt2(2),...
                                    coeffs_ddqdt4(2),...
                                    coeffs_ddqdt5(2),...
                                    coeffs_ddqdt6(2)];

        mass_matrix(count,:) = second_derivative_coeffs;

        % Next, compute Coriolis matrix

        acceleration_vector = [ddqdt(1);ddqdt(2);ddqdt(4);ddqdt(5);ddqdt(6)];

        second_derivative_terms = second_derivative_coeffs*acceleration_vector;

        intermediate_matrix(count) = simplify(eom(count)-second_derivative_terms);

        coeffs_dqdt1 = coeffs(intermediate_matrix(count),dqdt(1));
        coeffs_dqdt2 = coeffs(intermediate_matrix(count),dqdt(2));
        coeffs_dqdt4 = coeffs(intermediate_matrix(count),dqdt(4));
        coeffs_dqdt5 = coeffs(intermediate_matrix(count),dqdt(5));
        coeffs_dqdt6 = coeffs(intermediate_matrix(count),dqdt(6));

        if numel(coeffs_dqdt1)==1
            coeffs_dqdt1(2) = 0;
            coeffs_dqdt1(3) = 0;
        end
        if numel(coeffs_dqdt2)==1
            coeffs_dqdt2(2) = 0;
            coeffs_dqdt2(3) = 0;
        end

        if numel(coeffs_dqdt4)==1
            coeffs_dqdt4(2) = 0;
            coeffs_dqdt4(3) = 0;
        end
        if numel(coeffs_dqdt5)==1
            coeffs_dqdt5(2) = 0;
            coeffs_dqdt5(3) = 0;
        end
        if numel(coeffs_dqdt6)==1
            coeffs_dqdt6(2) = 0;
            coeffs_dqdt6(3) = 0;
        end

        if numel(coeffs_dqdt1)==2
            coeffs_dqdt1(3) = 0;
        end
        if numel(coeffs_dqdt2)==2
            coeffs_dqdt2(3) = 0;
        end

        if numel(coeffs_dqdt4)==2
            coeffs_dqdt4(3) = 0;
        end
        if numel(coeffs_dqdt5)==2
            coeffs_dqdt5(3) = 0;
        end
        if numel(coeffs_dqdt6)==2
            coeffs_dqdt6(3) = 0;
        end

        velocity_coeffs = [0.5*coeffs_dqdt1(2)+dqdt(1)*coeffs_dqdt1(3),...
                           0.5*coeffs_dqdt2(2)+dqdt(2)*coeffs_dqdt2(3),...
                           0.5*coeffs_dqdt4(2)+dqdt(4)*coeffs_dqdt4(3),...
                           0.5*coeffs_dqdt5(2)+dqdt(5)*coeffs_dqdt5(3),...
                           0.5*coeffs_dqdt6(2)+dqdt(6)*coeffs_dqdt6(3)];

        coriolis_matrix(count,:) = velocity_coeffs;
        

        % Finally, compute the gravity vector
        
        velocity_vector = [dqdt(1);dqdt(2);dqdt(4);dqdt(5);dqdt(6)];

        velocity_terms = velocity_coeffs*velocity_vector;

        gravity_vector(count) = simplify(intermediate_matrix(count)-velocity_terms);
    end
    
    
    % store the matrices as struct
    matrix_eom.mass_matrix = simplify(mass_matrix);
    matrix_eom.coriolis_matrix = simplify(coriolis_matrix);
    matrix_eom.gravity_vector = simplify(gravity_vector);

end

 
 