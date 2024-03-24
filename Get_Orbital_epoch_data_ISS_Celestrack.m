function [new_vector,epoch_data]=Get_Orbital_epoch_data_ISS_Celestrack()

format long
str=urlread('https://celestrak.com/NORAD/elements/stations.txt');
epoch=str(45:58);
%%epoch date
epoch_data=tletodate(str2double(epoch));
restofElements=str(107:160);
splittedElements=regexp(restofElements, ' ', 'split');
splittedElements=str2double(splittedElements);

nan_index= find(isnan(splittedElements));
if(length(nan_index) ~= 0)
clean_index=1;
for i=1:length(splittedElements)
  if(i ~= nan_index)
    clean_splittedElements(clean_index)=splittedElements(i);
    clean_index=clean_index+1;
   end
endfor
new_vector=[clean_splittedElements(3)/10000000 clean_splittedElements(1:2) clean_splittedElements(4:5)];
else
new_vector=[splittedElements(3)/10000000 splittedElements(1:2) splittedElements(4:5)];

endif
%%orbital elements vector [e i RA Argument_of_perigee Mo]

