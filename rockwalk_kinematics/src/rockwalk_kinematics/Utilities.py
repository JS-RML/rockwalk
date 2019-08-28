import math


def compute_rolling_euler(rot):
    """Euler angles for a falling rolling disk as described in:
    pg. 317 of Advanced Engineering Dynamics 2nd Edition, J.H. Ginsberg:
    http://mech.sharif.edu/~nejat/wp-content/uploads/2016/09/Jerry-H-Ginsberg-Advanced-engineering-dynamics-Cambridge-University-Press-1995.pdf
    """

    if rot[2,2]!= 1 or rot[2,2]!= 1:
        theta = math.atan2(math.sqrt(math.pow(rot[0,2],2) + math.pow(rot[1,2],2)),rot[2,2])
        phi = math.atan2(rot[2,1],-rot[2,0])
        psi = math.atan2(-rot[0,2],rot[1,2])

    elif rot[2,2]== -1:
        theta = math.pi/2
        phi = 0
        psi = math.atan2(rot[0,0], -rot[1,0])

    elif rot[2,2]== 1:
        theta = 0
        phi = 0
        psi = math.atan2(-rot[0,0],rot[1,0])

    return psi, theta, phi
