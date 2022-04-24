function [temp,coeff,compound,inputs,inputs_ex]=parser(file)
%%
    p=fgetl(file);
    line_1=p;
    A100kJ=12027.236;
    %q=strsplit(line_1,'G');                                                     %split string by using "G" as the indicator
    %s=strsplit(q{1},' ');                                                       %using the space as a delimiter
    r=strsplit(line_1,' ');
    compound=(r{1});                                       %convert character vectors to character arrays

    %r=strsplit(q{2},' ');
    temp_ll=str2double(r{7});
    temp_lh=str2double(r{8});
    temp_lm=str2double(r{9});
    temp={temp_ll,temp_lm,temp_lh,'VariableNames'};           %print basic table for data display
    %%rows2vars(temp);                                                            %reorient temp as that the value contained in temp turns into variables
    %%
    c={};
    x=fgetl(file);
    line_2=x;
    a=strfind(line_2,'E');                                                      %strfind(str,pat) to find the number of occurances using E as the pattern
    c1=str2double(line_2(1:a(1)+3));                                            %a(1) + 3 is the position that includes the exponential part of the number
    c2=str2double(line_2(a(1)+4:a(2)+3));
    c3=str2double(line_2(a(2)+4:a(3)+3));
    c4=str2double(line_2(a(3)+4:a(4)+3));                                       %a(1) + 4 is to start the new value from the previous position of the previous value
    c5=str2double(line_2(a(4)+4:a(5)+3));
    %%
    x=fgetl(file);
    line_3=x;
    b=strfind(line_3,'E');
    c6=str2double(line_3(1:b(1)+3));
    c6_down=c6-A100kJ;
    c6_up=c6+A100kJ;
    c7=str2double(line_3(b(1)+4:b(2)+3));
    c8=str2double(line_3(b(2)+4:b(3)+3));
    c9=str2double(line_3(b(3)+4:b(4)+3));
    c10=str2double(line_3(b(4)+4:b(5)+3));
    %%
    x=fgetl(file);
    line_4=x;
    c=strfind(line_4,'E');
    c11=str2double(line_4(1:c(1)+3));
    c12=str2double(line_4(c(1)+4:c(2)+3));
    c13=str2double(line_4(c(2)+4:c(3)+3));
    c13_down=c13-A100kJ;
    c13_up=c13+A100kJ;
    c14=str2double(line_4(c(3)+4:c(4)+3));
    %%
    c={'c1' 'c2' 'c3' 'c4' 'c5' 'c6' 'c7'...                                    %curly brackets allow user to store various type of data, e.g. char, num,. In other words, cell array is the container of normal array and normal array requires the specific same type throughout the indexes
     'c8' 'c9' 'c10' 'c11' 'c12' 'c13' 'c14'};
    [coeff]=[c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14];                   %when assign to matlab, using ; between value will direct the vector to column, without it will be row
    %coeff_up=[c1 c2 c3 c4 c5 c6_up c7 c8 c9 c10 c11 c12 c13_up c14];
    %coeff_down=[c1 c2 c3 c4 c5 c6_down c7 c8 c9 c10 c11 c12 c13_down c14];
    T={c',coeff'};              %use a symbol ' to transpose
    inputs=[coeff,temp_ll,temp_lm,temp_lh];
    inputs_ex=[c6_down,c6_up,c13_down,c13_up];
end
