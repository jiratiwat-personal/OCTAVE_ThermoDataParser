clear all                                              % Clear command history
close all                                              % Closes all windows
clc                                                    %Clears command window
disp('--------------------------------------------------------------')
disp('-              Stand thermodynamic data parser               -')
disp('-           Auther: jiratiwat.sinchai@logesoft.com           -')
disp('-               Modification date: 27.04.2022                -')
disp('--------------------------------------------------------------')
disp('Functions available')
disp('(1) Thermodynamic data modification')
disp('(2) Backward calculation ')
prompt=('Enter number: ');
option=input(prompt,'s');
if strcmpi(option,'1')
      main_ThermMod;
else
      fprintf ('%s',option);
end
