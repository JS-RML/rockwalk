function R_z = rot_z(ang)

    c = cos(ang);
    s = sin(ang);

    R_z = [c,-s,0;...
           s,c,0;...
           0,0,1];

end