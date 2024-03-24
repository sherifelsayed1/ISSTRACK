function [postion,V_t]=Orbit_Transform(a,e,inc,Omega,omega,theta)

format long

p=a*(1-e^2);
r = p./(1 + e*cos(theta));

x = r.*cos(theta);
y = r.*sin(theta);

Omega =deg2rad(-Omega);
inc = deg2rad(-inc); 
omega = deg2rad(-omega); 

% Coordinate Transformations
Z = [cos(Omega) sin(Omega) 0;-sin(Omega) cos(Omega) 0;0 0 1];
X = [1 0 0;0 cos(inc) sin(inc);0 -sin(inc) cos(inc)];
Z2 = [cos(omega) sin(omega) 0;-sin(omega) cos(omega) 0;0 0 1];

postion = Z*X*Z2*[x;y;zeros(1,length(x))];

GM=398.6005e12;
k=sqrt(GM/(a*(1-e^2)));
V=k*[-sin(theta);e+cos(theta);zeros(1,length(x))];
V_t=Z*X*Z2*V;

