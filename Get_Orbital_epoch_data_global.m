function [new_vector,epoch_data]=Get_Orbital_epoch_data_global(satellite_number)



format long
if(satellite_number==1)
  str=urlread('http://www.heavens-above.com/orbit.aspx?satid=25544');
end
if(satellite_number==2)
  str=urlread('http://heavens-above.com/orbit.aspx?satid=41604');
end
c=regexp (str, '1_lbl', 'split');
line1= regexp(str,'<span id="ctl00_cph1_lblLine1">','split');

line1=regexp(line1{2},' ','split');
date=str2double(line1{6});
c=c(4:13);
temp=c;
new_vector=zeros(1,6);
count=[2 3 6 7 9 1 8];

for i=1:7
    counter=count(i);
    temp(counter)=regexp (temp(counter), '>', 'split');
    f=temp{1,counter};
    temp_2=char(f(2));
    index=find(temp_2=='<');
    temp_2=regexp (temp_2(1:index-1), '-', 'split');
    temp_2=char(temp_2(1));
    new_vector(i)=str2double(temp_2);
 
end
epoch_data=tletodate(date);







