function contact_position = contact_coordinates(q,rot_sb,cone_params)  
    
    ground_contact_vector = rot_sb*[cone_params.radius;0;0];
        
    contact_position(1) = q(1) + ground_contact_vector(1);
    contact_position(2) = q(2) + ground_contact_vector(2);

    contact_position = contact_position.';
    
end