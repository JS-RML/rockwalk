function b_dot = constraint_input(us, ut)

    %{
    Returns constraint vector for apex acceleration. To be input into the 
    dynamic model. Output (4x1) vector. First two elements should be zero.
    Because these are rolling constraints. Not to be changed. Second two
    elements are derivative of velocity constraint for apex point.
    %}


    b_dot = sym(zeros(4,1)); 

    b_dot(3) = us; %apex_accel_s(1);
    b_dot(4) = ut; %apex_accel_s(2);

   
end





