%% Calculate contact self-energy matrix
Sigma=zeros(nl_t,nl_t);
Sigma_1=zeros(nl_t,nl_t);
Sigma_2=zeros(nl_t,nl_t);

t0=hbar^2/2/me/dx^2;

for i=1:nl_1
    % wave-vector for lead #1
    ka_1=acos(+(1-(EE(i_E)-E_1(i))/2/t0));
    Sigma(i,i)=-t0*exp(1i*ka_1); %+t0;
    Sigma_1(i,i)=-t0*exp(1i*ka_1); %+t0;
end;

for i=1:nl_2
    % wave-vector for lead #2
    ka_2=acos(+(1-(EE(i_E)-E_2(i))/2/t0));
    Sigma(nl_1+i,nl_1+i)=-t0*exp(1i*ka_2); %+t0;
    Sigma_2(nl_1+i,nl_1+i)=-t0*exp(1i*ka_2); %+t0;
end;

% broadening matrix
Gamma=1i*(Sigma-ctranspose(Sigma));
Gamma_1=1i*(Sigma_1-ctranspose(Sigma_1));
Gamma_2=1i*(Sigma_2-ctranspose(Sigma_2));