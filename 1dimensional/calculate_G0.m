%% Green's functions of the closed device

G_0=zeros(n_l,n_l);
for i=1:n_alpha
    G_0(1,1)=G_0(1,1)+1/(EE(i_E)-E_c(i))*Chi(1,i)*Chi(1,i);
    G_0(1,2)=G_0(1,2)+1/(EE(i_E)-E_c(i))*Chi(1,i)*Chi(2,i);
    G_0(2,1)=G_0(2,1)+1/(EE(i_E)-E_c(i))*Chi(2,i)*Chi(1,i);
    G_0(2,2)=G_0(2,2)+1/(EE(i_E)-E_c(i))*Chi(2,i)*Chi(2,i);
end;


% t0=hbar^2/2/me/dx^2;
% H=zeros(nT,nT);
% for i=1:nT-1
%     H(i,i)=pot(i)+2*t0;
%     H(i+1,i)=-t0;
%     H(i,i+1)=-t0;
% end;
% H(1,1)=pot(1)+2*t0;
% H(nT,nT)=pot(nT)+2*t0;
% 
% G=inv(EE(i_E)*eye(nT,nT)-H);
% G_0(1,1)=G(1,1);
% G_0(1,2)=G(1,nT);
% G_0(2,1)=G(nT,1);
% G_0(2,2)=G(nT,nT);