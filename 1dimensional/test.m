%% This m-file is only a test function for solution of 1D shrodinger equation

clc;
clear all;
fig=0;

%% Set physical parameters
hbar=1.05457e-34; %Joules
eV=1.602e-19;  %Joules
m0=9.109e-31;  %kg

%% Set simulation parameters
me=0.067*m0;
dx=5e-10; %meters
n_l=2; %number of leads
nT=101; %number of mesh points in the device region including contact mesh points
n_alpha=ceil(nT*100/100); %number of device eigen states used in calculation
pot=zeros(1,nT); %potential energy in the device region in Joules
n_center_1=50;
n_width_1=20;
v_1=0.1*eV;
% pot((n_center_1-n_width_1):(n_center_1+n_width_1))=v_1;
pot(1:41)=v_1;
pot(61:101)=v_1;

%% Energy levels and wave functions of the device Hamiltonian (closed system)

a=-hbar^2/2/me/dx^2;
A=zeros(nT,nT);
for i=1:nT-1
    A(i,i)=pot(i)-2*a;
    A(i+1,i)=a;
    A(i,i+1)=a;
end;
A(1,1)=pot(1)-1*a;
A(nT,nT)=pot(nT)-1*a;

[Psi_c,Ec]=eig(A);

%% normalize wavefunctions
norm=sum(Psi_c.*conj(Psi_c),1);
for i=1:nT
    Psi_c(:,i)=Psi_c(:,i)/sqrt(norm(i));
end;

fig=fig+1; figure(fig);
plot(abs(Psi_c(:,1)));
fig=fig+1; figure(fig);
plot(abs(Psi_c(:,2)));
fig=fig+1; figure(fig);
plot(abs(Psi_c(:,3)));
fig=fig+1; figure(fig);
plot(abs(Psi_c(:,4)));

%% write eigen-energies in a vector
E_c=zeros(1,nT);
for i=1:nT
    E_c(i)=Ec(i,i);
end;

plot(E_c/eV);

E_c(1)/eV