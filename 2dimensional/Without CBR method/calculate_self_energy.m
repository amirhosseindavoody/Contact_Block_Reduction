%% Calculate contact self-energy matrix
Sigma=zeros(nT,nT);
Sigma_1=zeros(nT,nT);
Sigma_2=zeros(nT,nT);

t0=hbar^2/2/me/dx^2;

for i=(ny-nl_1)/2+1:(ny-nl_1)/2+nl_1
    for j=(ny-nl_1)/2+1:(ny-nl_1)/2+nl_1
        for m=1:nl_1
            ii=i-(ny-nl_1)/2;
            jj=j-(ny-nl_1)/2;
            ka_1=acos(-(1-(EE(i_E)-E_1(m))/2/t0));
            Sigma(i,j)=Sigma(i,j)-t0*Xi_1(ii,m)*Xi_1(jj,m)*exp(1i*ka_1);
            Sigma_1(i,j)=Sigma_1(i,j)-t0*Xi_1(ii,m)*Xi_1(jj,m)*exp(1i*ka_1);
        end;
    end;
end;

for i=ny*(nx-1)+(ny-nl_2)/2+1:ny*(nx-1)+(ny-nl_2)/2+nl_2
    for j=ny*(nx-1)+(ny-nl_2)/2+1:ny*(nx-1)+(ny-nl_2)/2+nl_2
        for m=1:nl_2
            ii=i-(ny*(nx-1)+(ny-nl_2)/2);
            jj=j-(ny*(nx-1)+(ny-nl_2)/2);
            ka_2=acos(-(1-(EE(i_E)-E_2(m))/2/t0));
            Sigma(i,j)=Sigma(i,j)-t0*Xi_2(ii,m)*Xi_2(jj,m)*exp(1i*ka_2);
            Sigma_2(i,j)=Sigma_2(i,j)-t0*Xi_2(ii,m)*Xi_2(jj,m)*exp(1i*ka_2);
        end;
    end;
end;

% broadening matrix
Gamma=1i*(Sigma-ctranspose(Sigma));
Gamma_1=1i*(Sigma_1-ctranspose(Sigma_1));
Gamma_2=1i*(Sigma_2-ctranspose(Sigma_2));