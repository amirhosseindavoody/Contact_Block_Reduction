%% Projection of device eigenfunctions onto lead modes

Chi=zeros(n_l,n_alpha);
for i=1:n_alpha
    Chi(1,i)=Psi_c(1,i);
    Chi(2,i)=Psi_c(nT,i);
end;