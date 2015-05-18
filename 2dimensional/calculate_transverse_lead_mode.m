%% Calculate transverse modes in the leads

%% Solve Schrodinger equation in cross-sectional plane for lead #1
pot_l=zeros(nl_1,1);
for i=1:nl_1
    pot_l(i)=pot(c_table(i,1));
end;
t0=hbar^2/2/me/dx^2;
nn=size(pot_l,1);
H=zeros(nn,nn);

for i=1:nn-1
    H(i,i)=pot_l(i)+2*t0;
    H(i,i+1)=-t0;
    H(i+1,i)=-t0;
end;
H(nn,nn)=pot_l(nn)+2*t0;

[Xi_1,En]=eig(H);

%% write eigen-energies in a vector
E_1=zeros(1,nn);
for i=1:nl_1
    E_1(i)=En(i,i);
end;
E_3=E_1;

%% normalize wavefunctions
for i=1:nl_1-1
    norm=sum(Xi_1(:,i).*Xi_1(:,i));
    Xi_1(:,i)=Xi_1(:,i)/sqrt(norm);
end;

%% Plot wavefunction and others
% fig=fig+1; figure(fig);
% plot(sort(E_1));

% fig=fig+1; figure(fig); hold off;
% for ii=1:nn
%     plot(yc_1,(Xi_1(:,ii)).^2,'LineWidth',3);
%     pause;
% end;

%% Solve Schrodinger equation in cross-sectional plane for lead #2
pot_l=zeros(nl_2,1);
for i=1:nl_2
    pot_l(i)=pot(c_table(i,2));
end;
t0=hbar^2/2/me/dx^2;
nn=size(pot_l,1);
H=zeros(nn,nn);

for i=1:nn-1
    H(i,i)=pot_l(i)+2*t0;
    H(i,i+1)=-t0;
    H(i+1,i)=-t0;
end;
H(nn,nn)=pot_l(nn)+2*t0;

[Xi_2,En]=eig(H);

%% write eigen-energies in a vector
E_2=zeros(1,nn);
for i=1:nl_2
    E_2(i)=En(i,i);
end;

%% normalize wavefunctions
for i=1:nl_2-1
    norm=sum(Xi_2(:,i).*Xi_2(:,i));
    Xi_2(:,i)=Xi_2(:,i)/sqrt(norm);
end;


%% Plot wavefunction and others
% fig=fig+1;
% figure(fig);
% plot(sort(E_2));
% hold on;
% 
% 
% for ii=1:nn
%     fig=fig+1; figure(fig); hold off;
%     plot(Xi_2(:,ii),'LineWidth',3); view(0,90);
% end;