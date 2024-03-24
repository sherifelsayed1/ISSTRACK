function M=Matrix_Load_exe(currentTime)
format long

currentTime_String=[num2str(currentTime(1)) ' ' num2str(currentTime(2)) ' ' num2str(currentTime(3)) ' ' num2str(currentTime(4)) ' ' num2str(currentTime(5)) ' ' num2str(currentTime(6))];
[~,str]=system(['MatriceEOP ' currentTime_String ' 1 1 1 1 ']);

splitted_matrix_form=regexp (str, ' ', 'split');
numbers_form=str2double(splitted_matrix_form(1:9));
M=reshape(numbers_form,3,3);
%%M=M';

