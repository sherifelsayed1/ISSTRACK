function epoch_data=tletodate(tle)
    c=num2str(tle);
    y=str2double(c(1:2));


    dx=tle-floor(tle);
    doy=floor(tle)-y*1000;
    y=y+2000; 
    k=(mod(y,4)==0&&mod(y,100)~=0||mod(y,400)==0);
    if(k==0)
        k=2;
    end
    mm=floor(9*(k+doy)/(275+0.98))+1;
    if(doy < 32)
          mm = 1;
    end
    dd = doy - floor(275 * mm / 9) + k*floor((mm / 12 + .75)) + 30;
    hr = floor(dx * 24);
    dx = dx * 24 - hr;                    
    mn = floor(dx * 60);
    dx = dx * 60 - mn;                    
    ss = dx * 60;                        

    epoch_data=[y mm dd  hr mn ss];
