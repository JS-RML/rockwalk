function cone_params = cone_parameters(isSymbolic)
    %{
    Define disk parameters

    %}

    if isSymbolic

        syms m g R xCM zCM xA zA

        cone_params.mass = m; 
        cone_params.gravity = g;
        cone_params.radius = R;
        cone_params.lateral_CM_offset = xCM; 
        cone_params.vertical_CM_offset = zCM;
        cone_params.lateral_apex_offset = xA;
        cone_params.vertical_apex_offset = zA;
      

    else

        cone_params.mass = sym(1);
        cone_params.gravity = sym(9.8);
        cone_params.radius = sym(0.35);
        cone_params.lateral_CM_offset = sym(0.15);
        cone_params.vertical_CM_offset = sym(0.30);
        cone_params.lateral_apex_offset = sym(0.35);
        cone_params.vertical_apex_offset = sym(1.50);
    end
    
end
