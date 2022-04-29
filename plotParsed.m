function [P,Q,R]= plotParsed(Cp,S,H,H_down,H_up,T,compound)
 name_compound=strrep(compound,'_','-');
 figure('Name',sprintf('Thermodynamic Plots',1),'Position', [100, 100, 1024, 1200]);

 subplot(1,3,1);
 P=plot(T,Cp,'linewidth',2,'color','blue');
 grid on
 xlabel('Temperature [K]');
 ylabel('Specific Heat [J/(mol*K)]');
 title(sprintf('Specific heat vs Temperature of %s ',name_compound));

 subplot(1,3,2);
 Q=plot(T,S,'linewidth',2,'color','green');
 grid on
 xlabel('Temperature');
 ylabel('Entropy [J/mol]');
 title(sprintf('Entropy vs Temperature of %s ',name_compound));


 subplot(1,3,3);
 R=plot(T,H,'linewidth',2,'color','black');
 grid on
 xlabel('Temperature');
 ylabel('Enthalpy [J/(mol*K)]');
 title(sprintf('Enthalpy vs Temperature of %s ',name_compound));
 hold on

 plot(T,H_down,'linewidth',2,'color','blue');
 plot(T,H_up,'linewidth',2,'color','red');

 h=legend("Original","Decrement","Increment");
 legend (h, "location", "northeast");
 hold off

 %% ================creating folder and saving plots======================
 E=pwd;
 mkdir ('Plots');
 cd('Plots')
 figure_name = sprintf('%s.jpg', compound);
 saveas(figure(1),figure_name);
 cd(E)



end
