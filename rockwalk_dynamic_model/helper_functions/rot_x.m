function R_x = rot_x(ang)

    c = cos(ang);
    s = sin(ang);

    R_x = [1,0,0;...
           0,c,-s;...
           0,s,c];

end