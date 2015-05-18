%% Calculate transmission coefficient

T12(i_E)=trace(Gamma_1*G_R*Gamma_2*ctranspose(G_R));

%% Calculate S-matrix
nu_1=acos(+(1-(EE(i_E)-E_1(1))/2/t0));
nu_2=acos(+(1-(EE(i_E)-E_2(1))/2/t0));
S11(i_E)=2*t0*sqrt(sin(nu_1)*sin(nu_2))*G_R(1,nl_1+1);
