
function [deltaT]=calculateDifferenceCurrentTime_TLETime(epoch_data,currentTime)
%this functions computees the difference between currentTime and the TLE
%epoch
format long



currentTime_String=[num2str(currentTime(1)) '-' num2str(currentTime(2)) '-' num2str(currentTime(3)) '-' num2str(currentTime(4)) '-' num2str(currentTime(5)) '-' num2str(currentTime(6))];
currentTime_epoch=[num2str(epoch_data(1)) '-' num2str(epoch_data(2)) '-' num2str(epoch_data(3)) '-' num2str(epoch_data(4)) '-' num2str(epoch_data(5)) '-' num2str(round(epoch_data(6)))];
%old implementation was juliandate function and simply subtracting incoming date
deltaT=(julianday(currentTime_String)-julianday(currentTime_epoch))*24*3600;


