%% Energy levels and wave functions of the device Hamiltonian (closed system)

t0=hbar^2/2/me/dx^2;
H_c=zeros(nT,nT);

for i=1:nx*ny
    H_c(i,i)=4*t0+pot(i);
end;

for i=1:nx*ny-1
    H_c(i,i+1)=-t0;
    H_c(i+1,i)=-t0;
end;

for ll=1:nx-1
    k=ll*ny;
    H_c(k,k+1)=0;
    H_c(k+1,k)=0;
end;

for ll=1:(nx-1)*ny
    H_c(ll,ll+ny)=-t0;
    H_c(ll+ny,ll)=-t0;
end;

[Psi_c,Ec]=eig(H_c);

%% normalize wavefunctions
for i=1:nT
    norm=sum(Psi_c(:,i).*Psi_c(:,i));
    Psi_c(:,i)=Psi_c(:,i)/sqrt(norm);
end;

% for i=1:nT
%     norm=sum(Psi_c(i,:).*Psi_c(i,:));
%     Psi_c(i,:)=Psi_c(i,:)/sqrt(norm);
% end;

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
% %     surf(Psi); view(0,90);
% %     pause;
%     norm=trapz(trapz(abs(Psi).^2));
%     Psi_c(:,ii)=Psi_c(:,ii)/sqrt(norm);
% end;

%% Clear unnecessary variables

clear t0 i ii ll k Ec norm Psi;