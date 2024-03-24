function M=matrix_calc()



format long


%str=urlread('http://monroy.sytes.net/gemini.php');
str=urlread('http://devegypt.com/omar/matrix_load.php');

c=regexp (str, ' ', 'split');
c=str2double(c);
M=reshape(c,3,3);



