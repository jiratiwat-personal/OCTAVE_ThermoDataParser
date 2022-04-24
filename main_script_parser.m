%% ========================================================================
%---------------- File Parsing Main Script---------------------------------
clear all                                              % Clear command history
close all                                              % Closes all windows
clc                                                    %Clears command window
disp('--------------------------------------------------------------')
disp('----------------Thermodynamic data analyser-------------------')
disp('--------------------------------------------------------------')
file=fopen('Therm_N2O_NH3SCR-new.txt','r');             %fopen is to return the integer number as the file identifier "r" to define that this is for reading
fgetl(file);                                           %fgetl is to read only the first line of the file
temp_data=fgetl(file);               
%------------Global temperature--------------------------------------------
t=strsplit(temp_data,' ');                             %strsplit is to split.
temp_gl=str2double(t{2});                              %global low, medium and high are now extracted to array t and converted to double precision numbers using str2double function
temp_gm=str2double(t{3});
temp_gh=str2double(t{4});
%------------------avoiding next three lines-------------------------------
for i=1:3                                              %avoiding first 3 lines using for loop for n = 3
    fgetl(file);
end

m=ftell(file);                                         %return the position pointer in the specified file
c=0;
%-------------------Finding number of compounds in the file----------------
while ~feof(file)                                       %feof is to test and return the status of the end of file thus this while loop will read till the end of file
    tline = fgetl(file);
    x=tline(1:3);
    y='END';
    if x==y
        break
    end
%    if contains(tline,'!')                              %skip the line when find exclaimation mark
     if (tline == "!")                                   %this should be used instead 
        continue
    else
        %disp(tline)
        c=c+1;                                          %otherwise count the number of line and devide by 4 to get the number of compounds
    end
end
nos=(c)/4;
fseek(file,m,'bof');                                    %set the position of the read file to the beginning of m offset
%----------------taking input from the user--------------------------------
prompt=('Enter the species name: ');
x=input(prompt,'s');
%% ========================================================================
for i=1:nos

    [temp,coeff,compound,inputs,inputs_ex]=parser(file);          %calling function
    [Cp,H,H_up,H_down,S]=thermo_calculator(inputs,inputs_ex);                %calling function
    T=inputs(15):inputs(17);                            %temperature range

    if strcmpi(x,compound)                              %compare strings (case insensitive)
        [P,Q,R]= plots_parsed(Cp,S,H,H_down,H_up,T,compound);
    end

end

