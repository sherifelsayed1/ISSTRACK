
format long
global n epoch_data satellite_number name
satellite_number=1;
if(satellite_number==1)
    [n,epoch_data]=Get_Orbital_epoch_data_ISS_Celestrack();
else
    [n,epoch_data]=Get_Orbital_epoch_data_global(2);
end

%%

save('data.mat', 'n','epoch_data');
%%m=msgbox([name ' Orbital Elements Updated to <' num2str(epoch_data(3)) '-' num2str(epoch_data(2)) '-' num2str(epoch_data(1)) ' >Epoche Data'],'Keplerian Elements Update','Help');
%%pause(0.5);
%%delete(m);