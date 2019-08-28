function plotcircle3d(r,coor_O,v_xx)

norm_v_xx=v_xx/norm(v_xx);
v_yy=[0;0;0];
nzrow=find(v_xx~=0);
v_yy(nzrow(1))=dot(norm_v_xx,coor_O)/norm_v_xx(nzrow(1));
v_yy=v_yy-coor_O;
norm_v_yy=v_yy/norm(v_yy);
norm_v_zz=cross(norm_v_xx,norm_v_yy);
phi_span=0:0.5*pi/180:2*pi;
circle_p_yy=(ones(3,1)*r*cos(phi_span)).*(norm_v_yy*ones(1,length(phi_span)));
circle_p_zz=(ones(3,1)*r*sin(phi_span)).*(norm_v_zz*ones(1,length(phi_span)));
circle_p=coor_O*ones(1,length(phi_span))+circle_p_yy+circle_p_zz;
plot3(circle_p(1,:),circle_p(2,:),circle_p(3,:),'g','LineWidth',2);




