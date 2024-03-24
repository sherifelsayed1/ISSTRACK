% %function [new_vector,epoch_data,temp_2]=Get_Orbital_epoch_data()
% 
% 
% format long
% str=urlread('http://www.heavens-above.com/orbit.aspx?satid=39026');
% c=regexp (str, '1_lbl', 'split');
% 
% c=c(4:13);
% temp=c;
% new_vector=zeros(1,6);
% count=[2 3 6 7 9 1];
% 
% for i=1:6
%     counter=count(i);
%     temp(counter)=regexp (temp(counter), '>', 'split');
%     f=temp{1,counter};
%     temp_2=char(f(2));
%     index=find(temp_2=='<');
%     temp_2=regexp (temp_2(1:index-1), '-', 'split');
%     temp_2=char(temp_2(1));
%     new_vector(i)=str2double(temp_2);
%  
% end
% 
% 
% c=regexp (temp_2, ' ', 'split');
% try
%    split_date=regexp (char(c(5)), ':', 'split');
%    current_day=regexp (char(c(3)), ',', 'split');
%    current_day=current_day{1};
% catch
%     split_date=regexp (char(c(4)), ':', 'split');
%     current_day=char(c(1));
% end
% epoch_time=[str2double(char(split_date{1})) str2double(char(split_date{2})) str2double(char(split_date{3}))];
% epoch_day=clock;
% epoch_data=[epoch_day(1:3)  epoch_time];
% 
% 
% epoch_data(3)=str2double(current_day);
% try
%     day_adjust=char(c(6))=='P';
%     if(day_adjust(1)==1)
%         epoch_data(4)=epoch_data(4)+12;
%     end
% catch
%     
% end
% 
% 
% 
