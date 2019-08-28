function [Mat_M,Vect_CG]=dynamiceqpar(q,d_q)

load('robot');
Ixx=Mat_I(1,1);Ixy=Mat_I(1,2);Ixz=Mat_I(1,3);
Iyy=Mat_I(2,2);Iyz=Mat_I(2,3);
Izz=Mat_I(3,3);
x_CM=r_CM_O(1);y_CM=r_CM_O(2);z_CM=r_CM_O(3);










Mat_M(1, 1) = m;
Mat_M(1, 2) = 0;
Mat_M(1, 3) = 0;
Mat_M(1, 4) = -m * (cos(q(5)) * cos(q(4)) * cos(q(6)) * x_CM + cos(q(4)) * sin(q(5)) * z_CM - sin(q(4)) * sin(q(6)) * x_CM);
Mat_M(1, 5) = -m * (-sin(q(4)) * sin(q(5)) * cos(q(6)) * x_CM + cos(q(5)) * sin(q(4)) * z_CM);
Mat_M(1, 6) = -m * (-cos(q(5)) * sin(q(4)) * sin(q(6)) * x_CM + cos(q(4)) * cos(q(6)) * x_CM);
Mat_M(2, 1) = 0;
Mat_M(2, 2) = m;
Mat_M(2, 3) = 0;
Mat_M(2, 4) = -(cos(q(4)) * sin(q(6)) * x_CM + sin(q(4)) * (cos(q(5)) * x_CM * cos(q(6)) + sin(q(5)) * z_CM)) * m;
Mat_M(2, 5) = cos(q(4)) * (-sin(q(5)) * cos(q(6)) * x_CM + cos(q(5)) * z_CM) * m;
Mat_M(2, 6) = -x_CM * (cos(q(4)) * cos(q(5)) * sin(q(6)) + sin(q(4)) * cos(q(6))) * m;
Mat_M(3, 1) = 0;
Mat_M(3, 2) = 0;
Mat_M(3, 3) = m;
Mat_M(3, 4) = 0;
Mat_M(3, 5) = m * (-cos(q(5)) * x_CM * cos(q(6)) - sin(q(5)) * z_CM);
Mat_M(3, 6) = m * sin(q(6)) * sin(q(5)) * x_CM;
Mat_M(4, 1) = -m * (cos(q(5)) * cos(q(4)) * cos(q(6)) * x_CM + cos(q(4)) * sin(q(5)) * z_CM - sin(q(4)) * sin(q(6)) * x_CM);
Mat_M(4, 2) = -m * (cos(q(5)) * sin(q(4)) * cos(q(6)) * x_CM + cos(q(4)) * sin(q(6)) * x_CM + sin(q(4)) * sin(q(5)) * z_CM);
Mat_M(4, 3) = 0;
Mat_M(4, 4) = (cos(q(5)) - 0.1e1) * (cos(q(5)) + 0.1e1) * (m * x_CM ^ 2 - Ixx + Iyy) * cos(q(6)) ^ 2 + 0.2e1 * cos(q(5)) * sin(q(5)) * (m * x_CM * z_CM - Ixz) * cos(q(6)) + (-m * z_CM ^ 2 - Iyy + Izz) * cos(q(5)) ^ 2 + (x_CM ^ 2 + z_CM ^ 2) * m + Iyy;
Mat_M(4, 5) = (sin(q(5)) * (m * x_CM ^ 2 - Ixx + Iyy) * cos(q(6)) - cos(q(5)) * (m * x_CM * z_CM - Ixz)) * sin(q(6));
Mat_M(4, 6) = sin(q(5)) * (m * x_CM * z_CM - Ixz) * cos(q(6)) + cos(q(5)) * (m * x_CM ^ 2 + Izz);
Mat_M(5, 1) = sin(q(4)) * m * (sin(q(5)) * cos(q(6)) * x_CM - cos(q(5)) * z_CM);
Mat_M(5, 2) = -cos(q(4)) * m * (sin(q(5)) * cos(q(6)) * x_CM - cos(q(5)) * z_CM);
Mat_M(5, 3) = -m * (cos(q(5)) * x_CM * cos(q(6)) + sin(q(5)) * z_CM);
Mat_M(5, 4) = (sin(q(5)) * (m * x_CM ^ 2 - Ixx + Iyy) * cos(q(6)) - cos(q(5)) * (m * x_CM * z_CM - Ixz)) * sin(q(6));
Mat_M(5, 5) = (m * x_CM ^ 2 - Ixx + Iyy) * cos(q(6)) ^ 2 + m * z_CM ^ 2 + Ixx;
Mat_M(5, 6) = -sin(q(6)) * (m * x_CM * z_CM - Ixz);
Mat_M(6, 1) = -m * x_CM * (-sin(q(4)) * cos(q(5)) * sin(q(6)) + cos(q(4)) * cos(q(6)));
Mat_M(6, 2) = -x_CM * (cos(q(4)) * cos(q(5)) * sin(q(6)) + sin(q(4)) * cos(q(6))) * m;
Mat_M(6, 3) = m * sin(q(6)) * sin(q(5)) * x_CM;
Mat_M(6, 4) = sin(q(5)) * (m * x_CM * z_CM - Ixz) * cos(q(6)) + cos(q(5)) * (m * x_CM ^ 2 + Izz);
Mat_M(6, 5) = -sin(q(6)) * (m * x_CM * z_CM - Ixz);
Mat_M(6, 6) = m * x_CM ^ 2 + Izz;


Vect_CG(1,1) = -0.2e1 * (((-cos(q(5)) * x_CM * cos(q(6)) / 0.2e1 - sin(q(5)) * z_CM / 0.2e1) * sin(q(4)) - cos(q(4)) * sin(q(6)) * x_CM / 0.2e1) * d_q(4) ^ 2 + (cos(q(4)) * (-sin(q(5)) * cos(q(6)) * x_CM + cos(q(5)) * z_CM) * d_q(5) - x_CM * (cos(q(4)) * cos(q(5)) * sin(q(6)) + sin(q(4)) * cos(q(6))) * d_q(6)) * d_q(4) - (cos(q(5)) * x_CM * cos(q(6)) + sin(q(5)) * z_CM) * sin(q(4)) * d_q(5) ^ 2 / 0.2e1 + d_q(5) * sin(q(4)) * sin(q(5)) * d_q(6) * sin(q(6)) * x_CM - d_q(6) ^ 2 * x_CM * (sin(q(4)) * cos(q(5)) * cos(q(6)) + cos(q(4)) * sin(q(6))) / 0.2e1) * m;
Vect_CG(2,1) = 0.2e1 * (((-cos(q(5)) * x_CM * cos(q(6)) / 0.2e1 - sin(q(5)) * z_CM / 0.2e1) * cos(q(4)) + sin(q(4)) * sin(q(6)) * x_CM / 0.2e1) * d_q(4) ^ 2 + (-sin(q(4)) * (-sin(q(5)) * cos(q(6)) * x_CM + cos(q(5)) * z_CM) * d_q(5) + x_CM * (sin(q(4)) * cos(q(5)) * sin(q(6)) - cos(q(4)) * cos(q(6))) * d_q(6)) * d_q(4) - cos(q(4)) * (cos(q(5)) * x_CM * cos(q(6)) + sin(q(5)) * z_CM) * d_q(5) ^ 2 / 0.2e1 + cos(q(4)) * d_q(5) * sin(q(5)) * d_q(6) * sin(q(6)) * x_CM + d_q(6) ^ 2 * x_CM * (-cos(q(4)) * cos(q(5)) * cos(q(6)) + sin(q(4)) * sin(q(6))) / 0.2e1) * m;
Vect_CG(3,1) = m * ((sin(q(5)) * cos(q(6)) * x_CM - cos(q(5)) * z_CM) * d_q(5) ^ 2 + 0.2e1 * sin(q(6)) * d_q(5) * cos(q(5)) * x_CM * d_q(6) + d_q(6) ^ 2 * cos(q(6)) * sin(q(5)) * x_CM + g);
Vect_CG(4,1) = (cos(q(5)) * (m * x_CM ^ 2 - Ixx + Iyy) * cos(q(6)) + sin(q(5)) * (m * x_CM * z_CM - Ixz)) * sin(q(6)) * d_q(5) ^ 2 + ((-0.2e1 * ((m * x_CM ^ 2 - Ixx + Iyy) * cos(q(6)) ^ 2 - m * z_CM ^ 2 - Iyy + Izz) * cos(q(5)) * sin(q(5)) + 0.4e1 * (cos(q(5)) ^ 2 - 0.1e1 / 0.2e1) * (m * x_CM * z_CM - Ixz) * cos(q(6))) * d_q(4) + 0.2e1 * d_q(6) * ((m * x_CM ^ 2 - Ixx + Iyy) * cos(q(6)) ^ 2 - m * x_CM ^ 2 + Ixx / 0.2e1 - Iyy / 0.2e1 - Izz / 0.2e1) * sin(q(5))) * d_q(5) - 0.2e1 * (((cos(q(5)) - 0.1e1) * (cos(q(5)) + 0.1e1) * (m * x_CM ^ 2 - Ixx + Iyy) * cos(q(6)) + cos(q(5)) * sin(q(5)) * (m * x_CM * z_CM - Ixz)) * d_q(4) + sin(q(5)) * d_q(6) * (m * x_CM * z_CM - Ixz) / 0.2e1) * d_q(6) * sin(q(6));
Vect_CG(5,1) = (cos(q(5)) * sin(q(5)) * (m * x_CM ^ 2 - Ixx + Iyy) * cos(q(6)) ^ 2 - 0.2e1 * (cos(q(5)) ^ 2 - 0.1e1 / 0.2e1) * (m * x_CM * z_CM - Ixz) * cos(q(6)) - cos(q(5)) * sin(q(5)) * (m * z_CM ^ 2 + Iyy - Izz)) * d_q(4) ^ 2 + 0.2e1 * (sin(q(5)) * (m * x_CM ^ 2 - Ixx + Iyy) * cos(q(6)) ^ 2 - cos(q(5)) * (m * x_CM * z_CM - Ixz) * cos(q(6)) + sin(q(5)) * (Ixx - Iyy + Izz) / 0.2e1) * d_q(6) * d_q(4) - d_q(6) ^ 2 * cos(q(6)) * (m * x_CM * z_CM - Ixz) - 0.2e1 * (m * x_CM ^ 2 - Ixx + Iyy) * cos(q(6)) * d_q(6) * sin(q(6)) * d_q(5) - g * m * (cos(q(5)) * x_CM * cos(q(6)) + sin(q(5)) * z_CM);
Vect_CG(6,1) = ((cos(q(5)) - 0.1e1) * (cos(q(5)) + 0.1e1) * (m * x_CM ^ 2 - Ixx + Iyy) * cos(q(6)) + cos(q(5)) * sin(q(5)) * (m * x_CM * z_CM - Ixz)) * sin(q(6)) * d_q(4) ^ 2 - 0.2e1 * d_q(5) * (sin(q(5)) * (m * x_CM ^ 2 - Ixx + Iyy) * cos(q(6)) ^ 2 - cos(q(5)) * (m * x_CM * z_CM - Ixz) * cos(q(6)) + sin(q(5)) * (Ixx - Iyy + Izz) / 0.2e1) * d_q(4) + (cos(q(6)) * (m * x_CM ^ 2 - Ixx + Iyy) * d_q(5) ^ 2 + g * m * sin(q(5)) * x_CM) * sin(q(6));

