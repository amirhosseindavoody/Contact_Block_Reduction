%% This m-file calculates transmission through a 1-D structure using the
%  back tracing technique from the outgoing lead to the incoming lead.

clc;
clear all;
fig=1;

%% Set physical parameters
hbar=1.05457e-34; %Joules
eV=1.602e-19;  %Joules
m0=9.109e-31;  %kg

%% Set simulation parameters
me=0.067*m0;
dx=5e-10; %meters
nT=101; %number of mesh points in the device region including contact mesh points
x_axis=linspace(0,nT*dx,nT+1);
pot=zeros(1,nT+1); %potential energy in the device region in Joules
v_1=0.1*eV; %first barrier height
% pot(32:40)=v_1;
% pot(60:68)=v_1;

pot(37:41)=v_1;
pot(61:65)=v_1;

v_c=0.0*eV; %collector potential
v_e=0.0*eV; %emitter potential

%% Set the energy range
nE=400;
E=linspace(0.0*eV,0.3*eV,nE);
kxc=sqrt(2*me*(E-v_c)/hbar^2);

%% Set the wavefunctions and boundary condition.
Psi=zeros(nT+1,nE);
Psi(nT,:)=exp(1i*kxc*(nT-1)*dx);
Psi(nT+1,:)=exp(1i*kxc*nT*dx);

%% Back-trace the wavefunction to the injection point.
a=-hbar^2/2/me/dx^2;

for i=1:nT-1
    Psi(nT-i,:)=(2-pot(nT-i)/a+E/a).*Psi(nT-i+1,:)-Psi(nT-i+2,:);
end;

%% Calculate reflection and transmission coefficients
kxe=sqrt(2*me*(E-v_e)/hbar^2);
T1=2./(Psi(1,:)+(Psi(2,:)-Psi(1,:))./(1i*kxe*dx));
R1=T1.*(Psi(1,:)-(Psi(2,:)-Psi(1,:))./(1i*kxe*dx))/2

c1=1+exp(-1i*kxe*dx)./(1i*2*kxe*dx);
c2=1-exp(+1i*kxe*dx)./(1i*2*kxe*dx);
T2=(c1+c2)./(c2.*Psi(1,:)+Psi(2,:)./(1i*2*kxe*dx));
R2=Psi(1,:).*T2-1;

%% Plot transmission coefficient
fig=fig+1; figure(fig); hold off;
plot(E/eV,abs(T2),'LineWidth',2);
ylim([0,max(abs(T2))]);
hold on;
plot(E/eV,abs(T1),'--r','LineWidth',2);

return;

%% Plot wavefunctions
fig=fig+1;
for i=1:nE
    i
    figure(fig); hold off;
    plot(x_axis,pot/v_1,'-r','LineWidth',3); hold on;
    plot(x_axis,abs(Psi(:,i))/max(abs(Psi(:,i))),'-b','LineWidth',3);
%     pause;
end;
return;