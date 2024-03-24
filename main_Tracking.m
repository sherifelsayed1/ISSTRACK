

% h=figure('Name','International Space Station Real Time Tracker');
% set(0,'Units','pixels') 
% scnsize = get(0,'ScreenSize');
% set(h,'Position',[(scnsize(3)-950)/2 (scnsize(4)-580)/2 950 580]);

BackgroundImageFilePath = 'Earth_map.jpg';
BackgroundImage = imread(BackgroundImageFilePath);
imagesc([-180 180], [-90 90], flipdim(BackgroundImage,1));
set(gca,'ydir','normal');
hold on;

satellite=plot(0,0,'Marker','o',...   
    'MarkerFaceColor','c',...
    'MarkerSize',10);
hold on;

tit=title('');
xlabel('Longtiude [°]');
ylabel('Lattitude[°]');
set(tit,'color',[1 0 0.5],'Linewidth',2);
%%%%%%%%%%%%%%%%%%%%%%%%%
load data;
ang=0:0.01:2*pi; 
xp=20*cos(ang);
yp=20*sin(ang);
%%%%%%%%%%%%%%%%%%%%%%%%%
revolutions=4*93*60;
data_base=cell(revolutions,1);
data_base(1,1)=cellstr(['< Longtiude° >'  '< Lattiude° >'  ' <UTC Time>']);
%%%%%%%%%%%%%%%%%%%%%%%%%

for i=2:revolutions
 
    [data]=startTracking();
   
    
    long=data(2);
    lat=data(1);
   
    set(satellite,'XData',long);
    set(satellite,'YData',lat);
    
    if(mod(i,2)==1)
         c='r';
    else
         c='w';
    end
       
   
    circ=plot(long+xp,lat+yp,'color',c);
    hold on;
    plot(long,lat,'y','linewidth',2);
  
    tit=title(['< Longtiude : ' num2str(long) '° >' '< Lattiude  : ' num2str(lat)  '° >' '< Altitude  : ' num2str(data(3)/1000)   ' Km >' ' <UTC Time : ' time_adapt '>']);
    pause(0.95);

      try
        delete(circ);
      catch 
         m=msgbox('Tracking Terminated','Termination','help');
         pause(0.0001);
         delete(m);
         
         break;
         
      end 

 
   
   
    
end
Tracker;
% mcc -m main_Tracking.m
%deploytool