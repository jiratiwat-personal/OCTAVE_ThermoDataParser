#This is an easy calculation and plot for Arrhenius parameters.
prompt=('Enter A N and E for reaction1: ');
strReaction1=input(prompt,'s');
reaction1=str2double(strsplit(strReaction1));
#prompt=('Enter A N and E for reaction2: ');
#strReaction2=input(prompt,'s');
#reaction2=str2double(strsplit(strReaction2));

#Constant
R=[8.31451e0];
P=[1.0133e5];

#Arrhenius paramters
#reaction1=[+3.757212E09  +3.970763E00  +2.926868E01];
A1=reaction1(1)
A2=reaction2(1)
N1=reaction1(2)
N2=reaction2(2)
E1=reaction1(3)
E2=reaction2(3)

#Initialization
Tstart = 300;
N = 50;
Tend = 900;
dT=(Tend-Tstart)/50;
T = Tstart + (0:N-1)*dT;
TRecip=T;
TRecip=1./TRecip;
k1=(0:N-1)*0;
k2=(0:N-1)*0;

#Arrhenius temperature dependence rate constant
for i=1:N
  k1(i)=A1*power(T(i),N1)*exp(-E1/(R*(1e-3)*T(i)));
  k2(i)=A2*power(T(i),N2)*exp(-E2/(R*(1e-3)*T(i)));
end
lnk1=log(k1);
lnk2=log(k2);

#Manual calculation
Stick=5e-2;
SDEN=6.9581E-10;
T=[300,900];
rT=1./T;
Wk=42.08;
R=8.314;
Pi=3.14;
kf=Stick*((2)/(SDEN^(3)))*sqrt((R*(1e-3)*T)/(2*Pi*Wk));
lnkr=log(kr);

#Plotting value
x1=lnk1;
x2=lnk2;
plot (TRecip,x1,";Parser;","color","k")#black
hold on;
plot (rT,lnkr,";Manual Continuous;","color","b")#blue
hold on;
plot (rT,lnkr_,";Manual Original;","color","r")#red
%plot (TRecip,x1,";SIM;",TRecip,x2,";reaction2;",rT,lnkf,";CAL;");
%legend ("location", "northeast");
title ("Arrhenius plot","fontsize",15)
xlabel("1/T [1/K]","fontsize",15);
ylabel("lnKr","fontsize",15);
grid on;
