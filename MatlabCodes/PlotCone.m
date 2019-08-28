function cur_mat_frame=PlotCone(Var,glob_coor_xyz)
load('robot');

for it_sim=1:size(Var,1)
    

    plot3(glob_coor_xyz(:,1),glob_coor_xyz(:,2),glob_coor_xyz(:,3),'k');
    axis(2*[-AH 1*AH -1*AH 1*AH -0.1 1*AH]);
    xlabel('x(m)')
    ylabel('y(m)')
    zlabel('z(m)')
    hold on
    box on
    
    coor_O=[Var(it_sim,1);Var(it_sim,2);Var(it_sim,3)];
    MatR1z=[-sin(Var(it_sim,4)) -cos(Var(it_sim,4)) 0; cos(Var(it_sim,4)) -sin(Var(it_sim,4)) 0; 0 0 1;];
    MatR2y=[cos(Var(it_sim,5)) 0 sin(Var(it_sim,5)); 0 1 0; -sin(Var(it_sim,5)) 0 cos(Var(it_sim,5));];
    MatR3z=[cos(Var(it_sim,6)),-sin(Var(it_sim,6)),0;sin(Var(it_sim,6)),cos(Var(it_sim,6)),0;0,0,1];
    MatRp=MatR1z*MatR2y;
    MatR=MatRp*MatR3z;
    coor_A=coor_O+MatR*[OH;0;AH];
    plotcircle3d(r,coor_O,MatR(:,3));
    
    Coor_B=coor_O+MatR*[-r;0;0];
    Coor_C=coor_O+MatR*[r;0;0];
    Coor_D=coor_O+MatR*[0;-r;0];
    Coor_E=coor_O+MatR*[0;r;0];
    Coor_F=coor_O+MatR*r*[cos(pi/3);sin(pi/3);0];
    Coor_G=coor_O+MatR*r*[cos(pi+pi/3);sin(pi+pi/3);0];
    Coor_H=coor_O+MatR*r*[cos(pi/6);sin(pi/6);0];
    Coor_I=coor_O+MatR*r*[cos(pi+pi/6);sin(pi+pi/6);0];
    MatB=coor_O*ones(1,4)+MatR*MatB_local;
    
    plot3([coor_A(1),Coor_B(1)],[coor_A(2),Coor_B(2)],[coor_A(3),Coor_B(3)],'g','LineWidth',2);
    plot3([coor_A(1),Coor_C(1)],[coor_A(2),Coor_C(2)],[coor_A(3),Coor_C(3)],'g','LineWidth',2);
    plot3([coor_A(1),Coor_D(1)],[coor_A(2),Coor_D(2)],[coor_A(3),Coor_D(3)],'g','LineWidth',2);
    plot3([coor_A(1),Coor_E(1)],[coor_A(2),Coor_E(2)],[coor_A(3),Coor_E(3)],'g','LineWidth',2);
    plot3([coor_A(1),Coor_F(1)],[coor_A(2),Coor_F(2)],[coor_A(3),Coor_F(3)],'g','LineWidth',2);
    plot3([coor_A(1),Coor_G(1)],[coor_A(2),Coor_G(2)],[coor_A(3),Coor_G(3)],'g','LineWidth',2);
    plot3([coor_A(1),Coor_H(1)],[coor_A(2),Coor_H(2)],[coor_A(3),Coor_H(3)],'g','LineWidth',2);
    plot3([coor_A(1),Coor_I(1)],[coor_A(2),Coor_I(2)],[coor_A(3),Coor_I(3)],'g','LineWidth',2);
    
%     plot3([MatA(1,1),MatB(1,1)],[MatA(2,1),MatB(2,1)],[MatA(3,1),MatB(3,1)],'k','LineWidth',1);
%     plot3([MatA(1,2),MatB(1,2)],[MatA(2,2),MatB(2,2)],[MatA(3,2),MatB(3,2)],'k','LineWidth',1);
%     plot3([MatA(1,3),MatB(1,3)],[MatA(2,3),MatB(2,3)],[MatA(3,3),MatB(3,3)],'k','LineWidth',1);
%     plot3([MatA(1,4),MatB(1,4)],[MatA(2,4),MatB(2,4)],[MatA(3,4),MatB(3,4)],'k','LineWidth',1);
%     
%     plot3(MatA(1,1),MatA(2,1),MatA(3,1),'b^');
%     plot3(MatA(1,2),MatA(2,2),MatA(3,2),'b^');
%     plot3(MatA(1,3),MatA(2,3),MatA(3,3),'b^');
%     plot3(MatA(1,4),MatA(2,4),MatA(3,4),'b^');
%     
%     plot3(MatB(1,1),MatB(2,1),MatB(3,1),'bo');
%     plot3(MatB(1,2),MatB(2,2),MatB(3,2),'bo');
%     plot3(MatB(1,3),MatB(2,3),MatB(3,3),'bo');
%     plot3(MatB(1,4),MatB(2,4),MatB(3,4),'bo');

cur_mat_frame(it_sim)=getframe;
    hold off 
end


