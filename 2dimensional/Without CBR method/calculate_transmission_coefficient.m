%% Calculate transmission coefficient

T11(i_E)=trace(Gamma_1*G_R*Gamma_1*ctranspose(G_R));
T12(i_E)=trace(Gamma_1*G_R*Gamma_2*ctranspose(G_R));
T21(i_E)=trace(Gamma_2*G_R*Gamma_1*ctranspose(G_R));
T22(i_E)=trace(Gamma_2*G_R*Gamma_2*ctranspose(G_R));