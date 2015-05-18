%% Calculate transmission coefficient

Sigma_1=zeros(n_l,n_l);
Sigma_1(1,1)=Sigma(1,1);
Gamma_1=1i*(Sigma_1-ctranspose(Sigma_1));
Sigma_2=zeros(n_l,n_l);
Sigma_2(2,2)=Sigma(2,2);
Gamma_2=1i*(Sigma_2-ctranspose(Sigma_2));

T12(i_E)=trace(Gamma_1*G_R*Gamma_2*ctranspose(G_R));
% T12(i_E)=trace(A_c*ctranspose(A_c));
% T11(i_E)=trace(()*());