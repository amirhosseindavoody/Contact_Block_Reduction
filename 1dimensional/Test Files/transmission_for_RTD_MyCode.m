%% This program calculates the transmission coefficient through a 1D RTD diode
% code by: Amirhossein Davoody
% 26/6/2013

clc;
clear all;
fig=0;

%% Set physical parameters
hbar=1.05457e-34; %Joules
eV=1.602e-19;  %Joules
m0=9.109e-31;  %kg

%% Set simulation parameters
me=0.25*m0;
dx=3e-10; %meters
n_l=2; %number of leads
nT=46; %number of mesh points in the device region including contact mesh points
n_alpha=ceil(nT*100/100); %number of device eigen states used in calculation
pot=zeros(1,nT); %potential energy in the device region in Joules
v_1=0.4*eV;

pot=[zeros(15,1); v_1*ones(4,1); zeros(8,1); v_1*ones(4,1);zeros(15,1)]; %RT barrier

E_lead_1=0*eV;
E_lead_2=0*eV;

nE=1000;
E=linspace(0,0.8*eV,nE);
TM=zeros(1,nE);

% zplus=1i*1e-5*eV;
zplus=0;


%% Create Hamiltonian matrix
t0=hbar^2/2/me/dx^2;
H=zeros(nT,nT);
for i=1:nT-1
    H(i,i)=pot(i)+2*t0;
    H(i+1,i)=-t0;
    H(i,i+1)=-t0;
end;
% H(1,1)=pot(1)+1*t0;
H(nT,nT)=pot(nT)+2*t0;

for iE=1:nE
%% Calculate closed device Green's function
    Sigma_1=zeros(nT,nT);
    Sigma_2=zeros(nT,nT);
    ka_1=acos(1-(E(iE)+zplus-E_lead_1)/2/t0);
    ka_2=acos(1-(E(iE)+zplus-E_lead_2)/2/t0);
    Sigma_1(1,1)=-t0*exp(1i*ka_1);
    Sigma_2(nT,nT)=-t0*exp(1i*ka_2);
    G=inv((E(iE)+zplus)*eye(nT,nT)-H-Sigma_1-Sigma_2);
    Gamma_1=1i*(Sigma_1-ctranspose(Sigma_1));
    Gamma_2=1i*(Sigma_2-ctranspose(Sigma_2));
    TM(iE)=trace(Gamma_1*G*Gamma_2*ctranspose(G));
end

%% Plot transmission coefficient
fig=fig+1; figure(fig); hold off;
h=plot(E/eV,TM,'b','LineWidth',2);
xlim([0 0.8]);
xlabel('Transmission');
grid on;
% h=plot(XX,U1+UB,'b');
% h=plot(XS,mu1*ones(1,NS-4),'b--');
% h=plot(XD,mu2*ones(1,ND-4),'b--');
% axis([0 15 -.2 .8])
% set(h,'linewidth',[2.0]);
% set(gca,'Fontsize',[24]);
% xlabel('z ( nm ) --->');
% ylabel('Energy ( eV ) ---> ');