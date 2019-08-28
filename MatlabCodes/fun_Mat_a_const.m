function [Mat_a_const,Mat_d_a_const]=fun_Mat_a_const(q,d_q)
load('robot');


Mat_a_const(1, 1) = 1;
Mat_a_const(1, 2) = 0;
Mat_a_const(1, 3) = 0;
Mat_a_const(1, 4) = -cos(q(5)) * cos(q(4)) * r;
Mat_a_const(1, 5) = sin(q(4)) * sin(q(5)) * r;
Mat_a_const(1, 6) = -cos(q(4)) * r;
Mat_a_const(2, 1) = 0;
Mat_a_const(2, 2) = 1;
Mat_a_const(2, 3) = 0;
Mat_a_const(2, 4) = -cos(q(5)) * sin(q(4)) * r;
Mat_a_const(2, 5) = -cos(q(4)) * sin(q(5)) * r;
Mat_a_const(2, 6) = -sin(q(4)) * r;
Mat_a_const(3, 1) = 0;
Mat_a_const(3, 2) = 0;
Mat_a_const(3, 3) = 1;
Mat_a_const(3, 4) = 0;
Mat_a_const(3, 5) = -cos(q(5)) * r;
Mat_a_const(3, 6) = 0;
Mat_a_const(4, 1) = 1;
Mat_a_const(4, 2) = 0;
Mat_a_const(4, 3) = 0;
Mat_a_const(4, 4) = sin(q(6)) * sin(q(4)) * OH - cos(q(4)) * (cos(q(5)) * OH * cos(q(6)) + sin(q(5)) * AH);
Mat_a_const(4, 5) = -sin(q(4)) * (-sin(q(5)) * cos(q(6)) * OH + cos(q(5)) * AH);
Mat_a_const(4, 6) = OH * (sin(q(4)) * cos(q(5)) * sin(q(6)) - cos(q(4)) * cos(q(6)));
Mat_a_const(5, 1) = 0;
Mat_a_const(5, 2) = 1;
Mat_a_const(5, 3) = 0;
Mat_a_const(5, 4) = -sin(q(6)) * OH * cos(q(4)) - sin(q(4)) * (cos(q(5)) * OH * cos(q(6)) + sin(q(5)) * AH);
Mat_a_const(5, 5) = cos(q(4)) * (-sin(q(5)) * cos(q(6)) * OH + cos(q(5)) * AH);
Mat_a_const(5, 6) = -OH * (cos(q(4)) * cos(q(5)) * sin(q(6)) + sin(q(4)) * cos(q(6)));
Mat_a_const(6, 1) = 0;
Mat_a_const(6, 2) = 0;
Mat_a_const(6, 3) = 1;
Mat_a_const(6, 4) = 0;
Mat_a_const(6, 5) = -cos(q(5)) * OH * cos(q(6)) - sin(q(5)) * AH;
Mat_a_const(6, 6) = sin(q(5)) * sin(q(6)) * OH;





Mat_d_a_const(1, 1) = 0;
Mat_d_a_const(1, 2) = 0;
Mat_d_a_const(1, 3) = 0;
Mat_d_a_const(1, 4) = cos(q(4)) * d_q(5) * sin(q(5)) * r + d_q(4) * cos(q(5)) * sin(q(4)) * r;
Mat_d_a_const(1, 5) = d_q(4) * cos(q(4)) * sin(q(5)) * r + sin(q(4)) * d_q(5) * cos(q(5)) * r;
Mat_d_a_const(1, 6) = d_q(4) * sin(q(4)) * r;
Mat_d_a_const(2, 1) = 0;
Mat_d_a_const(2, 2) = 0;
Mat_d_a_const(2, 3) = 0;
Mat_d_a_const(2, 4) = d_q(5) * sin(q(4)) * sin(q(5)) * r - d_q(4) * cos(q(5)) * cos(q(4)) * r;
Mat_d_a_const(2, 5) = d_q(4) * sin(q(4)) * sin(q(5)) * r - cos(q(4)) * d_q(5) * cos(q(5)) * r;
Mat_d_a_const(2, 6) = -d_q(4) * cos(q(4)) * r;
Mat_d_a_const(3, 1) = 0;
Mat_d_a_const(3, 2) = 0;
Mat_d_a_const(3, 3) = 0;
Mat_d_a_const(3, 4) = 0;
Mat_d_a_const(3, 5) = d_q(5) * sin(q(5)) * r;
Mat_d_a_const(3, 6) = 0;
Mat_d_a_const(4, 1) = 0;
Mat_d_a_const(4, 2) = 0;
Mat_d_a_const(4, 3) = 0;
Mat_d_a_const(4, 4) = sin(q(4)) * d_q(6) * cos(q(6)) * OH + d_q(4) * cos(q(4)) * sin(q(6)) * OH + d_q(4) * sin(q(4)) * (cos(q(5)) * OH * cos(q(6)) + sin(q(5)) * AH) - cos(q(4)) * (-d_q(5) * sin(q(5)) * OH * cos(q(6)) - cos(q(5)) * OH * d_q(6) * sin(q(6)) + d_q(5) * cos(q(5)) * AH);
Mat_d_a_const(4, 5) = -d_q(4) * cos(q(4)) * (-sin(q(5)) * cos(q(6)) * OH + cos(q(5)) * AH) - sin(q(4)) * (-cos(q(5)) * d_q(5) * cos(q(6)) * OH + sin(q(5)) * d_q(6) * sin(q(6)) * OH - AH * d_q(5) * sin(q(5)));
Mat_d_a_const(4, 6) = OH * (d_q(4) * cos(q(4)) * cos(q(5)) * sin(q(6)) - sin(q(4)) * d_q(5) * sin(q(5)) * sin(q(6)) + sin(q(4)) * cos(q(5)) * d_q(6) * cos(q(6)) + d_q(4) * sin(q(4)) * cos(q(6)) + cos(q(4)) * d_q(6) * sin(q(6)));
Mat_d_a_const(5, 1) = 0;
Mat_d_a_const(5, 2) = 0;
Mat_d_a_const(5, 3) = 0;
Mat_d_a_const(5, 4) = -cos(q(4)) * d_q(6) * cos(q(6)) * OH + d_q(4) * sin(q(4)) * sin(q(6)) * OH - d_q(4) * cos(q(4)) * (cos(q(5)) * OH * cos(q(6)) + sin(q(5)) * AH) - sin(q(4)) * (-d_q(5) * sin(q(5)) * OH * cos(q(6)) - cos(q(5)) * OH * d_q(6) * sin(q(6)) + d_q(5) * cos(q(5)) * AH);
Mat_d_a_const(5, 5) = -d_q(4) * sin(q(4)) * (-sin(q(5)) * cos(q(6)) * OH + cos(q(5)) * AH) + cos(q(4)) * (-cos(q(5)) * d_q(5) * cos(q(6)) * OH + sin(q(5)) * d_q(6) * sin(q(6)) * OH - AH * d_q(5) * sin(q(5)));
Mat_d_a_const(5, 6) = -OH * (-d_q(4) * sin(q(4)) * cos(q(5)) * sin(q(6)) - cos(q(4)) * d_q(5) * sin(q(5)) * sin(q(6)) + cos(q(4)) * cos(q(5)) * d_q(6) * cos(q(6)) + d_q(4) * cos(q(4)) * cos(q(6)) - sin(q(4)) * d_q(6) * sin(q(6)));
Mat_d_a_const(6, 1) = 0;
Mat_d_a_const(6, 2) = 0;
Mat_d_a_const(6, 3) = 0;
Mat_d_a_const(6, 4) = 0;
Mat_d_a_const(6, 5) = d_q(5) * sin(q(5)) * OH * cos(q(6)) + cos(q(5)) * OH * d_q(6) * sin(q(6)) - d_q(5) * cos(q(5)) * AH;
Mat_d_a_const(6, 6) = d_q(5) * cos(q(5)) * sin(q(6)) * OH + sin(q(5)) * d_q(6) * cos(q(6)) * OH;










