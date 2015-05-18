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

% fig=fig+1; figure(fig);
% plot((Psi_c(:,1)));
% fig=fig+1; figure(fig);
% plot((Psi_c(:,2)));
% fig=fig+1; figure(fig);
% plot((Psi_c(:,3)));

%% write eigen-energies in a vector
E_c=zeros(1,nT);
for i=1:nT
    E_c(i)=Ec(i,i);
end;

clear a A;