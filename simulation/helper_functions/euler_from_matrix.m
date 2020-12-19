function [psi,theta,phi] = euler_from_matrix(rot)

    if (rot(3,3)~= 1) || (rot(3,3)~= 1)
        theta = atan2(...
                    sqrt(rot(1,3)^2 + rot(2,3)^2),...
                    rot(3,3));

        phi = atan2(...
                    rot(3,2),-rot(3,1));

        psi = atan2(-rot(1,3),rot(2,3));

    elseif (rot(3,3)== -1)

        theta = pi/2;

        phi = 0;

        psi = atan2(rot(1,1), -rot(2,1));

    elseif (rot(3,3)== 1)

        theta = 0;

        phi = 0;

        psi = atan2(-rot(1,1),rot(2,1));


    end
end