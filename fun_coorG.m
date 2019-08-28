function [coor_G,coor_A]=fun_coorG(Var)

load('robot');

for it=1:size(Var,1)
    MatR1z=[-sin(Var(it,4)) -cos(Var(it,4)) 0; cos(Var(it,4)) -sin(Var(it,4)) 0; 0 0 1;];
    MatR2y = [cos(Var(it,5)) 0 sin(Var(it,5)); 0 1 0; -sin(Var(it,5)) 0 cos(Var(it,5));];
    MatR3z=[cos(Var(it,6)) -sin(Var(it,6)) 0; sin(Var(it,6)) cos(Var(it,6)) 0; 0 0 1;];
    coor_G(:,it)=[Var(it,1);Var(it,2);Var(it,3)]+MatR1z*MatR2y*[r;0;0];
    coor_A(:,it)=[Var(it,1);Var(it,2);Var(it,3)]+MatR1z*MatR2y*MatR3z*[OH;0;AH];
end


coor_G=coor_G';
coor_A=coor_A';