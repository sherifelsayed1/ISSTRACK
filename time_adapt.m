function time_st=time_adapt()


current=clock;
diff_utc=2;
if((current(4)-diff_utc)<10)
    if(current(4)-diff_utc==-1)
         h=num2str(11);
    else
         h=['0' num2str(current(4)-diff_utc)];
      
    end

else
    h=num2str(current(4)-diff_utc);
    
end

if((current(5))<10)
    m=['0' num2str(current(5))];

else
    m=num2str(current(5));
end


if((current(6))<10)
    s=['0' num2str(floor(current(6)))];

else
    s=num2str(floor(current(6)));
end


time_st=[h ':' m ':' s];

end