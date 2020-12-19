function R_y = rot_y(ang)

    c = cos(ang);
    s = sin(ang);

    R_y = [c,0,s;...
           0,1,0;...
           -s,0,c];

end