function [rot_sb, rot_sbprime] = coordinate_frames(q)

    % Frame definition relative to the spatial frame. Check our readme to see how
    % these frames are defined
    
    init_rot = floor(rot_z(pi/2));
    rot_sb = rot_z(q(4))*init_rot*rot_y(q(5)); % this frame that does not roll with the disk
    rot_sbprime = rot_z(q(4))*init_rot*rot_y(q(5))*rot_z(q(6)); % body frame

end

