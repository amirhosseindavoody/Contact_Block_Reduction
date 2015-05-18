%% Energy levels and wave functions of the device Hamiltonian (closed system)

t0=hbar^2/2/me/dx^2;
H=zeros(nT,nT);

for i=1:nT
    H(i,i)=6*t0+pot(i);
end;

for i=1:nT-1
    H(i,i+1)=-t0;
    H(i+1,i)=-t0;
end;

for i=1:nx*ny-1
    k=i*nz;
    H(k,k+1)=0;
    H(k+1,k)=0;
end;

for i=1:(nx*ny-1)*nz
    H(i,i+nz)=-t0;
    H(i+nz,i)=-t0;
end;

for i=1:nx-1
    for j=1:nz
      k=(i-1)*ny*nz+(ny-1)*nz+j;
      H(k,k+nz)=0;
      H(k+nz,k)=0;
    end;
end;

for i=1:(ny*nz)*(nx-1)
    H(i,i+ny*nz)=-t0;
    H(i+ny*nz,i)=-t0;
end;

% enforce von Neumann boundary condition for contact #1
for i=1:nl_1
    H(c_table(i,1),c_table(i,1))=5*t0+pot(c_table(i,1));
end;
% enforce von Neumann boundary condition for contact #2
for i=1:nl_2
    H(c_table(i,2),c_table(i,2))=5*t0+pot(c_table(i,2));
end;

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
% plot(sort(E_c));
% 
% fig=fig+1; figure(fig); hold off;
% for ii=1:n_alpha
%     Psi=zeros(ny,nz);
%     l=1;
%     k=floor(nx/2);
%     for i=1:ny
%         for j=1:nz
%             Psi(i,j)=Psi_c(k*ny*nz+(i-1)*nz+j,ii);
%         end;
%     end;
%     surf(Psi); view(0,90);
%     ii
%     pause;
% end;
% 
% fig=fig+1; figure(fig); hold off;
% for ii=1:1
%     Psi=zeros(nx,ny);
%     l=1;
%     k=floor(nz/2);
%     for i=1:nx
%         for j=1:ny
%             Psi(i,j)=Psi_c((i-1)*ny*nz+(j-1)*nz+k,ii);
%         end;
%     end;
%     surf(Psi); view(0,90);
% %     ii
% %     pause;
% end;