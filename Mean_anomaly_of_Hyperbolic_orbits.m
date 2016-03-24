%% Coded by
% Mohamed Mohamed El-Sayed Atyya
% mohamed.atyya94@eng-st.cu.edu.eg




% Mean anomaly of Hyperbolic orbits
close all; clear all; clc;
%% inputs
theta=linspace(0,pi,100); % True anomaly
F=linspace(0,6,100); % Eccentric anomaly
e=1.1:0.5:4; % eccentricity
%% calculations
for n=1:length(e)
    Mh1(n,1:length(theta))=e(n)*sqrt(e(n)^2-1)*sin(theta)./(1+e(n)*cos(theta))-log((sqrt(e(n)+1)+sqrt(e(n)-1)*tan(theta/2))./(sqrt(e(n)+1)-sqrt(e(n)-1)*tan(theta/2)));
    Mh2(n,1:length(F))=e(n)*sinh(F)-F;
end
%% plotting
%---------------------------------------------------------------------------------------------------------------------------------------------------------
figure(1);
hold all;
set(gcf,'color','w');
for n=1:length(e)
    [a,b]=max(Mh1(n,:));
    plot(theta(1:b-1),log(Mh1(n,1:b-1)),'linewidth',2);
    legendInfo1{n} = ['e = ' num2str(e(n))]; 
end
grid on;
xlim([0,pi]);
% ylim([0,1e4]);
xlabel('\theta','fontsize',18);
ylabel('ln(M_h)','fontsize',18);
title('Mean anomaly vs True anomaly','fontsize',18);
legend(legendInfo1,'location','northwest')
%---------------------------------------------------------------------------------------------------------------------------------------------------------
figure(2);
hold all;
set(gcf,'color','w');
for n=1:length(e)
    plot(F,log(Mh2(n,:)),'linewidth',2);
    legendInfo{n} = ['e = ' num2str(e(n))]; 
end
grid on;
xlim([0,6]);
% ylim([0,1e4]);
xlabel('F','fontsize',18);
ylabel('ln(M_h)','fontsize',18);
title('Mean anomaly vs Eccentric anomaly','fontsize',18);
legend(legendInfo,'location','northwest')



