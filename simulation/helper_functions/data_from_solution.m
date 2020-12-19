function data = data_from_solution(eqns,y)


    contact_position_fun = matlabFunction(eqns.contact_position.');
    cm_position_fun = matlabFunction(eqns.cm_position.');
    cm_velocity_fun = matlabFunction(eqns.cm_velocity.');
    apex_position_fun = matlabFunction(eqns.apex_position.');
    apex_velocity_fun = matlabFunction(eqns.apex_velocity.');

    ke_fun = matlabFunction(eqns.ke);
    pe_fun = matlabFunction(eqns.pe);
    %--------------------------------------------------------------------------  

    data.contact_position_values = contact_position_fun(y(:,1),y(:,2),y(:,3),y(:,4));

    data.cm_position_values = cm_position_fun(y(:,1), y(:,2), y(:,3), y(:,4), y(:,5));
    data.cm_velocity_values = cm_velocity_fun(y(:,6), y(:,7), y(:,8), y(:,9), y(:,10),...
                                      y(:,3), y(:,4), y(:,5));



    data.apex_position_values = apex_position_fun(y(:,1), y(:,2), y(:,3), y(:,4), y(:,5));
    data.apex_velocity_values = apex_velocity_fun(y(:,6), y(:,7), y(:,8), y(:,9), y(:,10),...
                                          y(:,3), y(:,4), y(:,5));



    data.ke_values = ke_fun(y(:,6), y(:,7), y(:,8), y(:,9), y(:,10), y(:,3), y(:,4), y(:,5));
    data.pe_values = pe_fun(y(:,4), y(:,5));
end

