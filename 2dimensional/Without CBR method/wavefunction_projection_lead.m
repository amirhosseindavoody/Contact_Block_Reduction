%% Projection of device eigenfunctions onto lead modes
% Chi=zeros(nl_1+nl_2,n_alpha);
% norm=1;
% for n=1:n_alpha
%     Psi_p=Psi_c((ny-nl_1)/2+1:(ny-nl_1)/2+nl_1,n);
% %     norm=sum(Psi_p.*conj(Psi_p));
%     Chi(1:nl_1,n)=Psi_c((ny-nl_1)/2+1:(ny-nl_1)/2+nl_1,n)/sqrt(norm);
%     Psi_p=Psi_c(ny*(nx-1)+(ny-nl_2)/2+1:ny*(nx-1)+(ny-nl_2)/2+nl_2,n);
% %     norm=sum(Psi_p.*conj(Psi_p));
%     Chi(nl_1+1:nl_1+nl_2,n)=Psi_c(ny*(nx-1)+(ny-nl_2)/2+1:ny*(nx-1)+(ny-nl_2)/2+nl_2,n)/sqrt(norm);
% end;



%% Using the mode space reduction
Chi=zeros(nl_1+nl_2,n_alpha);
for n=1:n_alpha
    for m=1:nl_1
        Psi_p=Psi_c((ny-nl_1)/2+1:(ny-nl_1)/2+nl_1,n);
        Chi(m,n)=sum(Psi_p(:).*Xi_1(:,m));
    end;
end;

for n=1:n_alpha
    for m=1:nl_2
        Psi_p=Psi_c(ny*(nx-1)+(ny-nl_2)/2+1:ny*(nx-1)+(ny-nl_2)/2+nl_2,n);
        Chi(nl_1+m,n)=sum(Psi_p(:).*Xi_2(:,m));
    end;
end;