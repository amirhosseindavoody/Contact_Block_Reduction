%% Calculate transverse modes in the leads

%% Solve Schrodinger equation in cross-sectional plane for lead #1
pot_l=zeros(nl_1,1);
for i=1:nl_1
    pot_l(i)=pot(c_table(i,1));
end;
t0=hbar^2/2/me/dx^2;
H_l=zeros(nl_1,nl_1);

for i=1:nl_1
    H_l(i,i)=4*t0+pot_l(i);
end;

for i=1:nly_1*nlz_1-1
    H_l(i,i+1)=-t0;
    H_l(i+1,i)=-t0;
end;

for i=1:nly_1-1
    k=i*nlz_1;
    H_l(k,k+1)=0;
    H_l(k+1,k)=0;
end;

for i=1:(nly_1-1)*nlz_1
    H_l(i,i+nlz_1)=-t0;
    H_l(i+nlz_1,i)=-t0;
end;

[Xi_1,En]=eig(H_l);

%% write eigen-energies in a vector
E_1=zeros(1,nl_1);
for i=1:nl_1
    E_1(i)=En(i,i);
end;

%% normalize wavefunctions
for i=1:nl_1
    norm=sum(Xi_1(:,i).*Xi_1(:,i));
    Xi_1(:,i)=Xi_1(:,i)/sqrt(norm);
end;

%% Plot wavefunction
% fig=fig+1; figure(fig); hold off;
% for ii=1:n_alpha
%     Psi=zeros(nly_1,nlz_1);
%     l=1;
%     for i=1:nly_1
%         for j=1:nlz_1
%             Psi(i,j)=Xi_1(l,ii);
%             l=l+1;
%         end;
%     end;
%     surf(Psi); view(0,90);
%     pause;
% end;

%% Solve Schrodinger equation in cross-sectional plane for lead #2
pot_l=zeros(nl_2,1);
for i=1:nl_2
    pot_l(i)=pot(c_table(i,2));
end;
t0=hbar^2/2/me/dx^2;
H_l=zeros(nl_2,nl_2);

for i=1:nl_2
    H_l(i,i)=4*t0+pot_l(i);
end;

for i=1:nly_2*nlz_2-1
    H_l(i,i+1)=-t0;
    H_l(i+1,i)=-t0;
end;

for i=1:nly_2-1
    k=i*nlz_2;
    H_l(k,k+1)=0;
    H_l(k+1,k)=0;
end;

for i=1:(nly_2-1)*nlz_2
    H_l(i,i+nlz_2)=-t0;
    H_l(i+nlz_2,i)=-t0;
end;

[Xi_2,En]=eig(H_l);

%% write eigen-energies in a vector
E_2=zeros(1,nl_2);
for i=1:nl_2
    E_2(i)=En(i,i);
end;

%% normalize wavefunctions
for i=1:nl_2
    norm=sum(Xi_2(:,i).*Xi_2(:,i));
    Xi_2(:,i)=Xi_2(:,i)/sqrt(norm);
end;

%% Plot wavefunction
% fig=fig+1; figure(fig); hold off;
% for ii=1:n_alpha
%     Psi=zeros(nly_2,nlz_2);
%     l=1;
%     for i=1:nly_2
%         for j=1:nlz_2
%             Psi(i,j)=Xi_1(l,ii);
%             l=l+1;
%         end;
%     end;
%     surf(Psi); view(0,90);
%     pause;
% end;