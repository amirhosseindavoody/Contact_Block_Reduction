%% Projection of device eigenfunctions onto lead modes
Chi=zeros(nl_t,n_alpha);
for n=1:n_alpha
    for m=1:nl_1
        Psi_p=zeros(1,nl_1);
        for i=1:nl_1
            Psi_p(i)=Psi_c(c_table(i,1),n);
        end;
        Chi(m,n)=sum(Psi_p(:).*Xi_1(:,m));
    end;
end;

for n=1:n_alpha
    for m=1:nl_2
        Psi_p=zeros(1,nl_2);
        for i=1:nl_2
            Psi_p(i)=Psi_c(c_table(i,2),n);
        end;
        Chi(nl_1+m,n)=sum(Psi_p(:).*Xi_2(:,m));
    end;
end;

% for n=1:n_alpha
%     for m=1:nl_3
%         Psi_p=zeros(1,nl_3);
%         for i=1:nl_3
%             Psi_p(i)=Psi_c(c_table(i,3),n);
%         end;
%         Chi(nl_1+nl_2+m,n)=sum(Psi_p(:).*Xi_3(:,m));
%     end;
% end;