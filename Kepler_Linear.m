function [E]=Kepler_Linear(T,e,a,Mo)
%solve kepler equation by itairations
global n
format long
N=n(end)*((2*pi)/86400); %convert number of revolution per day to rad/sec


M=deg2rad(Mo)+N*T;



E_prev=M;
delta_E=(E_prev-M-e*sin(E_prev))./(1-e*cos(E_prev));
E=E_prev-delta_E;


while(abs(E-E_prev)>(10^-8))

E_prev=E;
delta_E=(E_prev-M-e*sin(E_prev))./(1-e*cos(E_prev));
E=E_prev-delta_E;


end
