
#currentTime =clock;
#currentTime_String=[num2str(currentTime(1)) '-' num2str(currentTime(2)) '-' num2str(currentTime(3)) '-' num2str(currentTime(4)) '-' num2str(currentTime(5)) '-' num2str(currentTime(6))];
#jdn = julianday(currentTime_String); 
#jdn2 = julianday('2019-09-28-12-59-52'); 
#online ='2458755.04157';  
#display(currentTime);
#display(jdn);
#display(jdn2);
#display(online);
#[new_vector,epoch_data]=Get_Orbital_epoch_data_ISS_Celestrack();
global  semi_major_axis

semi_major_axis = 6794*1000;
get_data;
figure
BackgroundImageFilePath = 'Earth_map.jpg';
BackgroundImage = imread(BackgroundImageFilePath);
imagesc([-180 180], [-90 90], flip(BackgroundImage,1));
set(gca,'ydir','normal');
hold on;

satellite=plot(0,0,'Marker','o',...   
    'MarkerFaceColor','c',...
    'MarkerSize',10);
   
 
hold on;

tit=title('');
xlabel('Longtiude [°]');
ylabel('Lattitude[°]');
%zlabel('rewrewr');
set(tit,'color',[1 0 0.5],'Linewidth',2);
ang=0:0.01:2*pi; 
xp=20*cos(ang);
yp=20*sin(ang);
%%%%%%%%%%%%%%%%%%

for i=1:3000
  
  [data,new_postion,new_velocity,timeDifference]=startTracking();
  long=rad2deg(data(2))-360;
  lat=rad2deg(data(1))
  set(satellite,'XData',long);
  set(satellite,'YData',lat);
   %%set(satellite,'XData',new_postion(1));
   %%set(satellite,'YData',new_postion(2));
   %%set(satellite,'ZData',new_postion(3));
   if(mod(i,2)==1)
         c='r';
    else
         c='w';
    end
    
    circ=plot(long+xp,lat+yp,'color',c);
    %%circ=plot3(new_postion(1)+xp,new_postion(2)+yp,new_postion(3) ,'color',c);
    hold on;
    plot(long,lat,'r','linewidth',2);
    %%plot3(new_postion(1),new_postion(2),new_postion(3),'r','linewidth',2);
    tit=title(['< Longtiude : ' num2str(long) '° >' '< Lattiude  : ' num2str(lat)  '° >' '< Altitude  : ' num2str(data(3)/1000)   ' Km >' ' <UTC Time : ' time_adapt '>']);
    pause(2);

      try
       delete(circ);
      catch 
         m=msgbox('Tracking Terminated','Termination','help');
         pause(0.0001);
         delete(m);
         
         break;
         
      end 
      
  %display('lat:');
  %display(lat);
  %display('long:')
  %display(long);
  % display('altitude:')
  % display(data(3)/1000);
  % display('--------------------');
  
   

end