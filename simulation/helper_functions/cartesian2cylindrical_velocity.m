function circumferential_velocity = cartesian2cylindrical_velocity(cart_position, cart_velocity)

    x = cart_position(1);
    y = cart_position(2);
    xdot = cart_velocity(1);
    ydot = cart_velocity(2);
    
    circumferential_velocity = simplify((x*ydot-xdot*y)/(x^2+y^2));
    

end
