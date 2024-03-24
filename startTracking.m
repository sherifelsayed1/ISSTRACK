function [data,new_postion,new_velocity,timeDifference]=startTracking()

global n epoch_data semi_major_axis


currentTime=clock;
display('Current Local Time');
display(num2str(currentTime));
if(currentTime(4) == 0)
    currentTime(4)=24;
end
utcDifference=2;
currentTime(4)=currentTime(4)-utcDifference;

display('Current UTC Time');
display(num2str(currentTime));


M=Matrix_Load_exe(currentTime);%earth rotation matrix
timeDifference=calculateDifferenceCurrentTime_TLETime(epoch_data,currentTime);

a=semi_major_axis;
e=n(1);%eccentricty
angles=n(2:4);%orbital angles
[v]=kep2orb(timeDifference,e,a,n(5)); %true anomaly old was n(5)
[postion,V_t]=Orbit_Transform(a,e,angles(1),angles(2),angles(3),v); %position and velocity in space fixed frame

%position and velocity in earth fixed frame
new_postion=(M)*postion;
new_velocity=(M)*V_t;
%%[data] = ecef2lla(new_postion');

[lat, long, alt] = ecef2lla(new_postion(1),new_postion(2),new_postion(3));
data=[lat long alt];