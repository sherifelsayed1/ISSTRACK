function [A,EL] = az_el( new_postion )
%   Rw=(1000*[4075.53022 931.78130 4801.61819])'; wetzell
%%Rw=(1.0e+06*[4.177056267801927   0.854967699336653   4.728399552063656]');%munich
Rw=( 1.0e+06*[4.245089832464804   0.708862045839533   4.691932808843704]');%Friedrichshafen 

%Rw=(1.0e+06 *[4.718780787431490   2.874911286665755   3.177507195491118]');%cairo
%lla2ecef([30.06780 31.35181  1251])
    new_postion=new_postion-Rw;
    
    lam=atan2(Rw(2),Rw(1));
    xy=sqrt((Rw(2))^2+(Rw(1))^2);

    phi=(pi/2)-atan2(Rw(3),xy);
    Q=[-1 0 0;0 1 0;0 0 1];
    R3 = [cos(lam) sin(lam) 0;-sin(lam) cos(lam) 0;0 0 1];
    R2=[cos(phi) 0 -sin(phi) ;0 1 0;sin(phi) 0 cos(phi)];
    new_postion=Q*R2*R3*new_postion;
    x_n=new_postion(1);
    y_n=new_postion(2);
    z_n=new_postion(3);
    xyz=sqrt( (x_n)^2+(y_n)^2+(z_n)^2);
    A=atan2(y_n,x_n)*180/pi;
    EL=((pi/2)-(acos((z_n)/xyz)))*180/pi;

end

