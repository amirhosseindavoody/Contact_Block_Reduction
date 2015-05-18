%% Calculate transverse modes in the leads

%% Solve Schrodinger equation in cross-sectional plane for lead #1
pot_l=zeros(nl_1,1);
t0=hbar^2/2/me/dx^2;
nn=size(pot_l,1);
H_l=zeros(nn,nn);

for i=1:nn-1
    H_l(i,i)=pot_l(i)+2*t0;
    H_l(i,i+1)=-t0;
    H_l(i+1,i)=-t0;
end;
H_l(nn,nn)=pot_l(nn)+2*t0;

[Xi_1,En]=eig(H_l);

%% write eigen-energies in a vector
E_1=zeros(1,nn);
for i=1:nl_1
    E_1(i)=En(i,i);
end;
E_2=E_1;

%% normalize wavefunctions
for i=1:nl_1-1
    norm=sum(Xi_1(:,i).*Xi_1(:,i));
    Xi_1(:,i)=Xi_1(:,i)/sqrt(norm);
end;

% for i=1:nl_1
%     norm=sum(Xi_1(i,:).*Xi_1(i,:));
%     Xi_1(i,:)=Xi_1(i,:)/sqrt(norm);
% end;

Xi_2=Xi_1;


%% Plot wavefunction and others
% fig=fig+1;
% figure(fig);
% plot(sort(E_1));
% hold on;
% 
% 
% for ii=1:nn
%     fig=fig+1; figure(fig); hold off;
%     plot(Xi_1(:,ii),'LineWidth',3); view(0,90);
% end;

%% Clear unnecessary variables

clear t0 H_l i ii ll k En norm;