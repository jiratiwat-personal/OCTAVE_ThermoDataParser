#Calculate forward rate constant for stick reaction
Stick=5e-2;
SDEN=6.9581E-6;
T=[300,900];
surf=0.5;
rT=1./T;
Wk=42.08;
R=8.314;
Pi=3.14;
kf=Stick*((2)/(SDEN^(3)))*sqrt((R*(1e3)*T)/(2*Pi*Wk));
lnkf=log(kf);
#plot (rT,lnkf)

#1. manually add the polynomial coeff into workspace and then transfer them into inputs variable
#to insert the value into the function that calculates thermodynamic parameters

###############################################
#          Parse thermodynmaic data           #
###############################################
#Calculate thermodynamic data using Poly const.
inputs=C3H5PD;
[Cp,H,S]=cal(inputs,T);
H_C3H5PD_=H;
S_C3H5PD_=S;
#This is from the parser from Hocks function
H_C3H5PD=[83070.39669791165,137749.1375419025];
S_C3H5PD=[129.7832920203479,222.912705180427];
###############################################
#Calculate thermodynamic data using Poly const.
inputs=C3H6;
[Cp,H,S]=cal(inputs,T);
H_C3H6_=H;
S_C3H6_=S;
#This is from the parser from Hocks function
H_C3H6=[20577.07040712358,83912.5749634643];
S_C3H6=[257.8135779997276,366.4063822490023];
###############################################
#Calculate thermodynamic data using Poly const.
inputs=OHPD;
tBreak=OHPD(17);
[Cp,H,S]=cal(inputs,T);
H_OHPD_=H;
S_OHPD_=S;
#This is from the parser from Hocks function
H_OHPD=[-212122.8283509915,-198308.2437364368];
S_OHPD=[1.503893933726481,23.78112551658972];
###############################################
#Calculate thermodynamic data using Poly const.
inputs=OPD;
tBreak=OPD(17);
[Cp,H,S]=cal(inputs,T);
H_OPD_=H;
S_OPD_=S;
#This is from the parser from Hocks function
H_OPD=[-109601.2608363003,-99174.09621270883];
S_OPD=[2.674530885792846,20.4372529460633];
###############################################
#Calculate thermodynamic data using Poly const.
inputs=PD;
tBreak=PD(17);
[Cp,H,S]=cal(inputs,T);
H_PD_=H;
S_PD_=S;
#This is from the parser from Hocks function
H_PD=[47.75218089416258,16547.34119229321];
S_PD=[41.72770742524292,71.60677491710311];
###############################################

###############################################
#          Calculate dH, dS and Cp            #
###############################################
#𝐶3𝐻6+𝑂𝑃𝐷+𝑃𝐷→𝐶3𝐻5𝑃𝐷+𝑂𝐻𝑃𝐷
#[J/(mol*K)]
dS_=(S_C3H5PD_+S_OHPD_)-(S_PD_+S_OPD_+S_C3H6_);#Manual Discretized
dS=(S_C3H5PD+S_OHPD)-(S_PD+S_OPD+S_C3H6);

#[J/mol]
dH_=(H_C3H5PD_+H_OHPD_)-(H_PD_+H_OPD_+H_C3H6_);#Manual Discretized
dH=(H_C3H5PD+H_OHPD)-(H_PD+H_OPD+H_C3H6);

#Thermodynamic term
dG_=T.*dS_-dH_
dG=T.*dS-dH
kp_=exp(dG_./(T*R))
kp=exp(dG./(T*R))
#Summation of stoichiometric coeff. of the reaction
NuetGas=-1;

#reverse rate constant
kc_gas_=kp_.*(101325 ./((8.31451 .*T*1.0e6))).^(NuetGas)#Manual Discretized
kc_gas=kp.*(101325 ./((8.31451 .*T*1.0e6))).^(NuetGas)

kc_=kc_gas_*surf#Manual Discretized
kc=kc_gas*surf

kr_=kf./kc_;#Manual Discretized
kr=kf./kc;

lnkr_=log(kr_);#Manual Discretized
lnkr=log(kr);

plot (rT,lnkr_,";Manual Original;","color","r")#Manual Discretized
hold on;
plot (rT,lnkr,";Manual Continuous;","color","b")
title ("Arrhenius plot","fontsize",15)
xlabel("1/T [1/K]","fontsize",15);
ylabel("lnKr","fontsize",15);
h = legend ("Original","Continuous");
legend (h,"fontsize",15)
