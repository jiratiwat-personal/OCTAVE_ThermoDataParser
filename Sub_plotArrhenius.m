#This is an easy calculation and plot for Arrhenius parameters.
prompt=('Enter A N and E for reaction1: ');
strReaction1=input(prompt,'s');
reaction1=str2double(strsplit(strReaction1));
prompt=('Enter A N and E for reaction2: ');
strReaction2=input(prompt,'s');
reaction2=str2double(strsplit(strReaction2));

#Constant
R=[8.31451e0];
P=[1.0133e5];

#Arrhenius paramters
#reaction1=[+1.284751E20, -1.026757E00, +1.785516E02];
#reaction2=[+1.848080E20, -1.074854E00, +1.787606E02];
A1=reaction1(1)
A2=reaction2(1)
N1=reaction1(2)
N2=reaction2(2)
E1=reaction1(3)
E2=reaction2(3)

#Initialization
Tstart = 50;
dT = 50;
Tend = 3000;
N=Tend/50;
T = Tstart + (0:N-1)*dT;
TRecip=T;
TRecip=1./TRecip*1000;
k1=(0:59)*0;
k2=(0:59)*0;

#Arrhenius temperature dependence rate constant
for i=1:60
  k1(i)=A1*power(T(i),N1)*exp(-E1/(R*T(i)));
  k2(i)=A2*power(T(i),N2)*exp(-E2/(R*T(i)));
end
k1ln=log(k1);
k2ln=log(k2);

answer=power(2,2)

#Plotting value
x1=k1ln;
x2=k2ln;
semilogx (T,x1,";reaction1;",T,x2,";reaction2;");
legend ("location", "northeast");
title ("Arrhenius plot","fontsize",15)
xlabel("Temperature [K]","fontsize",15);
ylabel("Kln","fontsize",15);
grid on;
