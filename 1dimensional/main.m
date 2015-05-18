%% Implementation of Contact Block Reduction method for a 1D structure
%  implementation is based on: Ballaistic quantum transport using the
%  contact block reduction (CBR) method, J Comput Electron (2009) 8: 267-286
%  Code written by: Amirhossein Davoody  5/6/2013

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
n_alpha=floor(nT*100/100); %number of device eigen states used in calculation
pot=zeros(1,nT); %potential energy in the device region in Joules
n_center_1=50;
n_width_1=20;
v_1=0.1*eV;

pot(38:41)=v_1;
pot(61:64)=v_1;

E_lead_1=0*eV;
E_lead_2=0*eV;

%% Energy levels and wave functions of the device Hamiltonian (closed system)
calculate_closed_system

%% Projection of device eigenfunctions onto lead modes
wavefunction_projection_lead

%% Setup energy intervals
setup_energy_interval

for i_E=1:n_E
    %% Calculate contact self-energy matrix
    calculate_self_energy

    %% Green's functions of the closed device
    calculate_G0
    
    %% Retarded Green's functions of the open device
    calculate_GR
    
    %% Calculate transmission coefficient
    calculate_transmission_coefficient
end;

%% Plot final results
fig=fig+1; figure(fig); hold off;
plot(EE/eV,real(T12),'-b','LineWidth',2);
xlim([min(EE/eV),max(EE/eV)]);
xlabel('Energy (eV)');
ylabel('Tran. Coeff.');

%% Plot eigen energies of the closed system
% temp1=linspace(0,1,n_alpha);
% temp2=zeros(nT,n_alpha);
% for i=1:nT
%     temp2(i,:)=temp2(i,:)+E_c(i)/eV;
% end;
% figure(fig); hold on;
% for i=1:n_alpha
%     plot(temp2(i,:),temp1,'-r','LineWidth',2)
% end;
 
% fig=fig+1; figure(fig);
% plot(E_c/eV);
% 
% fig=fig+1; figure(fig);
% plot(pot/eV);