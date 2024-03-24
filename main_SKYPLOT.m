load data;

for i=2:14000

    [data,new_postion,new_velocity,time]=startTracking();
    [A,EL] =az_el( new_postion);
    if(A>360)
       A=A-360; 
    end
    if(A<0)
       A=A+360; 
    end
    if(mod(i,2)==1)
      h=skyplot(A,EL,'+','b');
    else
      h=skyplot(A,EL,'o','r'); 
    end
    pause(0.95);
    if(i==2)
        measurement(i,1)=2;
    else
        measurement(i,1)=time-measurement(i-1,1);
    end
   
   measurement(i,2)=A;
   measurement(i,3)=EL;
   measurement(i,4:6)=new_postion;
   measurement(i,7:9)=new_velocity;
    try
        delete(h);
      catch 
         m=msgbox('Tracking Terminated','Termination','help');
         pause(0.7);
         delete(m);
         
         break;
         
     end 
    
    cla
    
end
Tracker;
