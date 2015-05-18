%% Energy levels and wave functions of the device Hamiltonian (closed system)

t0=hbar^2/2/me/dx^2;
H=zeros(nT,nT);

for i=1:nx*ny
    H(i,i)=4*t0+pot(i);
end;

for i=1:nx*ny-1
    H(i,i+1)=-t0;
    H(i+1,i)=-t0;
end;

for i=1:nx-1
    k=i*ny;
    H(k,k+1)=0;
    H(k+1,k)=0;
end;

for i=1:(nx-1)*ny
    H(i,i+ny)=-t0;
    H(i+ny,i)=-t0;
end;

% enforce von Neumann boundary condition for contact #1
% for i=1:nl_1
%     H(c_table(i,1),c_table(i,1))=3*t0+pot(c_table(i,1));
% end;
% enforce von Neumann boundary condition for contact #2
% for i=1:nl_2
%     H(c_table(i,2),c_table(i,2))=3*t0+pot(c_table(i,2));
% end;

[Psi_c,Ec]=eig(H);

%% normalize wavefunctions
for i=1:nT
    norm=sum(Psi_c(:,i).*Psi_c(:,i));
    Psi_c(:,i)=Psi_c(:,i)/sqrt(norm);
end;

%% write eigen-energies in a vector
E_c=zeros(1,nT);
for i=1:nT
    E_c(i)=Ec(i,i);
end;

%% Plot wavefunction
% fig=fig+1; figure(fig); hold off;
% plot(sort(E_1));
% 
% 
% for ii=1:n_alpha
%     Psi=zeros(nx,ny);
%     l=1;
%     for i=1:nx
%         for j=1:ny
%             Psi(i,j)=Psi_c(l,ii);
%             l=l+1;
%         end;
%     end;
%     surf(Psi); view(0,90);
%     pause;
% %     norm=trapz(trapz(abs(Psi).^2));
% %     Psi_c(:,ii)=Psi_c(:,ii)/sqrt(norm);
% end;

%% Clear unnecessary variables

clear t0 i ii ll k Ec norm Psi;