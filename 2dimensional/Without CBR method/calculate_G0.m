%% Green's functions of the closed device

G_0=zeros(nl_1+nl_2,nl_1+nl_2);
for i=1:n_alpha
    G_0=G_0+1/(EE(i_E)-E_c(i))*Chi(:,i)*ctranspose(Chi(:,i));
end;


%% G_0 by using Hamiltonian matrix
