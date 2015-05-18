%% Implementation of Contact Block Reduction method for a 2D structure
%  implementation is based on: Ballaistic quantum transport using the
%  contact block reduction (CBR) method, J Comput Electron (2009) 8: 267-286
%  Code by: Amirhossein Davoody  6/27/2013

clc;
clear all;
fig=0;

%% Set physical parameters
hbar=1.05457e-34; %Joules
eV=1.602e-19;  %Joules
m0=9.109e-31;  %kg

%% Set electron effective mass and number of leads
me=0.05*m0;
n_l=2; %number of leads

%% Set simulation spatial properties
nx=21; %number of mesh points along x axis
ny=41; %number of mesh points along y axis
nT=nx*ny; %number of total mesh points in the device region including contact mesh points
dx=5e-10;
dy=dx;
n_alpha=ceil(nT*100/100); %number of device eigen states used in calculation

nl_1=21; %width of the lead #1
nl_2=21; %width of the lead #2

%% Create potential function
v_1=0.1*eV;
pot=zeros(1,nT); %potential energy in the device region in Joules
% create_potential

%% Applied bias to leads
E_lead_1=0*eV;
E_lead_2=0*eV;

%% Calculate transverse modes in the leads
calculate_transverse_lead_mode

%% Energy levels and wave functions of the device Hamiltonian (closed system)
calculate_closed_system

%% Projection of device eigenfunctions onto lead modes
% wavefunction_projection_lead

%% Setup energy intervals
setup_energy_interval

for i_E=1:n_E
    i_E
    
    %% Calculate contact self-energy matrix
    calculate_self_energy

    %% Green's functions of the closed device
%    calculate_G0
    
    %% Retarded Green's functions of the open device
    calculate_GR
    
    %% Calculate transmission coefficient
    calculate_transmission_coefficient
end;

%% Plot final results
fig=fig+1; figure(fig); hold on;
plot(EE/eV,abs(T11),'-r','LineWidth',2);
plot(EE/eV,abs(T12),'-b','LineWidth',2);
plot(EE/eV,abs(T21),'-k','LineWidth',2);
plot(EE/eV,abs(T22),'-g','LineWidth',2);
xlim([min(EE/eV),max(EE/eV)]);

%% Plot eigen energies of the closed system
temp1=linspace(0,1,n_alpha);
temp2=zeros(nT,n_alpha);
for i=1:nT
    temp2(i,:)=temp2(i,:)+E_c(i)/eV;
end;
figure(fig); hold on;
for i=1:n_alpha
    plot(temp2(i,:),temp1,'-r','LineWidth',2)
end;
 
% fig=fig+1; figure(fig);
% plot(E_c/eV);
% 
% fig=fig+1; figure(fig);
% plot(pot/eV);