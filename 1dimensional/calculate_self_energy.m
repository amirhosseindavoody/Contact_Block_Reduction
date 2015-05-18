%% Calculate contact self-energy matrix

Sigma=zeros(n_l,n_l);
t0=hbar^2/2/me/dx^2;

% wave-vector for lead #1
ka_1=acos(1-(EE(i_E)-E_lead_1)/2/t0);


% wave-vector for lead #2
ka_2=acos(1-(EE(i_E)-E_lead_2)/2/t0);

% non-zero elements of contact self-energy matrix
Sigma(1,1)=-t0*exp(1i*ka_1)+t0;
Sigma(2,2)=-t0*exp(1i*ka_2)+t0;

% broadening matrix
Gamma=1i*(Sigma-ctranspose(Sigma));


