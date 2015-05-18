%% A test program to generate plot 8.4.1 of Datta's book Atom to Transistor

clc;
clear all;
fig=0;

%% Set physical parameters
hbar=1.05457e-34; %Joules
eV=1.602e-19;  %Joules
m0=9.109e-31;  %kg

%% Set simulation constants
eps=-0.25*eV;
eps1=0.25*eV;
tau=0.5*eV;
eta=0.0001*eV;
nE=10000;
E=linspace(-1*eV,1*eV,nE);

%% Calculate Green's function
H=[eps, tau; ctranspose(tau), eps1];
for i=1:nE
    G=inv(E(i)*eye(2,2)-H+1i*eta*eye(2,2));
    A=1i*(G-ctranspose(G));
    LDOS_1(i)=A(1,1);
    LDOS_2(i)=A(2,2);
end;

%% Plot resutls
fig=fig+1; figure(fig); hold on;
plot(LDOS_1,E/eV,'k','LineWidth',2);

fig=fig+1; figure(fig); hold on;
plot(LDOS_2,E/eV,'k','LineWidth',2);