function [Mat_Q]=fun_Mat_Q_Force(q)

load('robot');

Mat_Q(1, 1) = 1;
Mat_Q(2, 1) = 0;
Mat_Q(3, 1) = 0;
Mat_Q(4, 1) = sin(q(6)) * sin(q(4)) * OH - cos(q(4)) * (cos(q(5)) * OH * cos(q(6)) + sin(q(5)) * AH);
Mat_Q(5, 1) = -sin(q(4)) * (-sin(q(5)) * cos(q(6)) * OH + cos(q(5)) * AH);
Mat_Q(6, 1) = OH * (sin(q(4)) * cos(q(5)) * sin(q(6)) - cos(q(4)) * cos(q(6)));
Mat_Q(1, 2) = 0;
Mat_Q(2, 2) = 1;
Mat_Q(3, 2) = 0;
Mat_Q(4, 2) = -sin(q(6)) * OH * cos(q(4)) - sin(q(4)) * (cos(q(5)) * OH * cos(q(6)) + sin(q(5)) * AH);
Mat_Q(5, 2) = cos(q(4)) * (-sin(q(5)) * cos(q(6)) * OH + cos(q(5)) * AH);
Mat_Q(6, 2) = -OH * (cos(q(4)) * cos(q(5)) * sin(q(6)) + sin(q(4)) * cos(q(6)));
Mat_Q(1, 3) = 0;
Mat_Q(2, 3) = 0;
Mat_Q(3, 3) = 1;
Mat_Q(4, 3) = 0;
Mat_Q(5, 3) = -cos(q(5)) * OH * cos(q(6)) - sin(q(5)) * AH;
Mat_Q(6, 3) = sin(q(5)) * sin(q(6)) * OH;












