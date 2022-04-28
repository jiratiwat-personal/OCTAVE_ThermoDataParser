clear all                                              % Clear command history
close all                                              % Closes all windows
clc                                                    %Clears command window
disp('--------------------------------------------------------------')
disp('-                        Plot Arrhenius                      -')
disp('-                Modification date : 27.04.2022              -')
disp('--------------------------------------------------------------')
prompt=('Enter InputRedKinMec file name: ');
inputRedKinMecFile=input(prompt,'s');
%------------------parse everyline of the file to cell A---------------------
fileRec=fopen(inputRedKinMecFile,'r');
countL=1;
tlineL=fgetl(fileRec);
A{countL} = tlineL;
while ischar(tlineL)
   countL=countL+1;
   tlineL=fgetl(fileRec);
   A{countL}=tlineL;                                          %otherwise count the number of line and devide by 4 to get the number of compounds
end
fclose(fileRec);
