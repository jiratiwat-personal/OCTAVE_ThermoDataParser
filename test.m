file=fopen('Therm_N2O_NH3SCR-new.txt','r')
for i=1:5
    fgetl(file);
end
line_1=fgetl(file);
arr_1=strsplit(line_1,' ')
disp(arr_1)
disp(arr_1(7))
num1=str2double(arr_1(7))
anss=num1+1;
