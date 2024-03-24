function [v]=kep2orb(T,e,a,Mo)
format long

[E]=Kepler_Linear(T,e,a,Mo);
v=atan2(sqrt(1-e^2)*sin(E),(cos(E)-e));

