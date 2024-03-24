function jdn = julianday(date)
%Enter date in yyyy-mm-dd--hh--mm--ss format
%minus between day month and year is important
%%display('begin in impot funtion ');
%%display(date);
date_str = strsplit(date, '-');
year = str2double(char(date_str(1)));
month = str2double(char(date_str(2)));
day = str2double(char(date_str(3)));
hour = str2double(char(date_str(4)));
minute = str2double(char(date_str(5)));
second = str2double(char(date_str(6)));

%%display('After extraction');
%%display(date_str);
a = floor((14 - month)/12);
y = year + 4800 - a;
m = month + 12*a - 3;

jdn = day + floor((153*m + 2)/5) + 365*y + floor(y/4) - floor(y/100) + ...
      floor(y/400) - 32045;
      

jdn =jdn+(((hour-12)/24)+minute/(24*60)+second/(86400));     