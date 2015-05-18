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
me=0.3*m0;
n_l=2; %number of leads

%% Set simulation spatial properties
nx=21; %number of mesh points along x axis
ny=21; %number of mesh points along y axis
nz=21; %number of mesh points along y axis
nT=nx*ny*nz; %number of total mesh points in the device region including contact mesh points
dx=5e-10;
dy=dx;
dz=dx;
n_alpha=floor(nT*10/100); %number of device eigen states used in calculation

nly_1=ny; %width of the lead #1 along axis x
nlz_1=nz; %width of the lead #1 along axis y
nl_1=nly_1*nlz_1;
nly_2=ny; %width of the lead #2 along axis x
nlz_2=nz; %width of the lead #2 along axis y
nl_2=nly_2*nlz_2;

nl_t=nl_1+nl_2;

%% Create table of contact nodes
create_contact_table

%% Create potential function
create_potential

%% Applied bias to leads
E_lead_1=0*eV;
E_lead_2=0*eV;

%% Calculate transverse modes in the leads
calculate_transverse_lead_mode
disp('Lead wavefunctions calculated.');

%% Energy levels and wave functions of the device Hamiltonian (closed system)
calculate_closed_system
disp('Closed system wavefunctions calculated.');

%% Projection of device eigenfunctions onto lead modes
wavefunction_projection_lead

%% Setup energy intervals
setup_energy_interval

for i_E=1:n_E
    i_E
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
plot(EE/eV,abs(T12),'-k','LineWidth',2);
xlim([min(EE/eV),max(EE/eV)]);

% fig=fig+1; figure(fig); hold on;
% plot(EE/eV,abs(T13),'-b','LineWidth',2);
% xlim([min(EE/eV),max(EE/eV)]);

% plot(EE/eV,abs(T23),'-r','LineWidth',2);


%% Plot eigen energies of the closed system
temp1=linspace(0,1,nl_1);
temp2=zeros(nl_1,nl_1);
for i=1:nl_1
    temp2(i,:)=temp2(i,:)+E_1(i)/eV;
end;
figure(fig); hold on;
for i=1:nl_1
    plot(temp2(i,:),temp1,'-r','LineWidth',2)
end;
 
% fig=fig+1; figure(fig);
% plot(E_c/eV);
% 
% fig=fig+1; figure(fig);
% plot(pot/eV);

%% Plot final results
fig=fig+1; figure(fig); hold off;
plot(EE/eV,abs(S11),'-k','LineWidth',2);
xlim([min(EE/eV),max(EE/eV)]);