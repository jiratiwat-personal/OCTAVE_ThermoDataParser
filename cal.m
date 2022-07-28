function [Cp,H,S]=cal(inputs,T)

    c1=inputs(1);
    c2=inputs(2);
    c3=inputs(3);
    c4=inputs(4);
    c5=inputs(5);
    c6=inputs(6);
    c7=inputs(7);

    c8=inputs(8);
    c9=inputs(9);
    c10=inputs(10);
    c11=inputs(11);
    c12=inputs(12);
    c13=inputs(13);
    c14=inputs(14);

    temp_ll=inputs(15);
    temp_lm=inputs(16);
    temp_lh=inputs(17);
    #T=temp_ll:temp_lh;                                                          %using : between value will automatically generate the series with the step count of 1
    R = 8.314;       %J/mol·K

        Cp =(c1 + c2*T + c3*T.^2 + c4*T.^3 +c5*T.^4).*R;                        %.' is the arraywase operation. element by element priduct of the arrays A and B. A and B must have the same size, unless one of them is a scalar
        H(1) = (c1 + c2*(T(1)/2) + c3*(T(1)^2./3) + c4*(T(1)^3./4) + c5*(T(1)^4./5) +c6./T(1)).*(R*T(1));
        S(1) = (c1*log(T(1)) + c2*T(1) + c3*(T(1)^2./2) + c4*(T(1)^3./3) + c5*(T(1)^4./4) + c7).*R;

        Cp =(c8 + c9*T + c10*T.^2 + c11*T.^3 +c12*T.^4).*R;
        H(2) = (c8 + c9*(T(2)/2) + c10*(T(2)^2./3) + c11*(T(2)^3./4) + c12*(T(2)^4./5) +c13/T(2)).*(R*T(2));
        S(2) = (c8*log(T(2)) + c9*T(2) + c10*(T(2)^2./2) + c11*(T(2)^3./3) + c12*(T(2)^4./4) + c14).*R;
end
