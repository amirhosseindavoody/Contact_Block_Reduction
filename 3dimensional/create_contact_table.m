%% Create table of contact nodes

c_table=zeros(max([nl_1,nl_2]),n_l);

ii=0;
for i=1:nly_1
    for j=1:nlz_1
        ii=ii+1;
        c_table(ii,1)=((ny-nly_1)/2+i-1)*nz+((nz-nlz_1)/2+j);
    end;
end;

ii=0;
for i=1:nly_2
    for j=1:nlz_2
        ii=ii+1;
        c_table(ii,2)=(nx-1)*ny*nz+((ny-nly_2)/2+i-1)*nz+((nz-nlz_2)/2+j);
    end;
end;


%% Plot mesh points and contact point

% plot all the mesh points
for i=1:nx
    for j=1:ny
        for k=1:nz
            xx((i-1)*ny*nz+(j-1)*nz+k)=(i-1)*dx;
            yy((i-1)*ny*nz+(j-1)*nz+k)=(j-1)*dy;
            zz((i-1)*ny*nz+(j-1)*nz+k)=(k-1)*dz;
        end;
    end;
end;

% fig=fig+1; figure(fig); hold off;
% plot3(xx,yy,zz,'*b'); 
% box on;
% xlim([0 (nx-1)*dx]);
% ylim([0 (ny-1)*dy]);
% zlim([0 (nz-1)*dz]);
% grid on;

% plot mesh points of contact #1
for i=1:nl_1
    xc_1(i)=xx(c_table(i,1));
    yc_1(i)=yy(c_table(i,1));
    zc_1(i)=zz(c_table(i,1));
end;
% figure(fig); hold on;
% plot3(xc_1,yc_1,zc_1,'*r');

% plot mesh points of contact #2
for i=1:nl_2
    xc_2(i)=xx(c_table(i,2));
    yc_2(i)=yy(c_table(i,2));
    zc_2(i)=zz(c_table(i,2));
end;
% figure(fig); hold on;
% plot3(xc_2,yc_2,zc_2,'*g'); 