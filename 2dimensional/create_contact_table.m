%% Create table of contact nodes

c_table=zeros(max([nl_1,nl_2]),n_l);

for i=1:nl_1
    c_table(i,1)=(ny-nl_1)/2+i;
end;

for i=1:nl_2
    c_table(i,2)=(nx-1)*ny+(ny-nl_2)/2+i;
end;

% for i=1:nl_3
%     c_table(i,2)=(nx-1)*ny+(ny-nl_3)/2+i;
% end;


%% Plot mesh points and contact point

% plot all the mesh points
for i=1:nx
    for j=1:ny
        xx((i-1)*ny+j)=(i-1)*dx;
        yy((i-1)*ny+j)=(j-1)*dy;
    end;
end;

% fig=fig+1; figure(fig); hold off;
% plot(xx,yy,'*b'); 
% box on;
% xlim([0 nx*dx]);
% ylim([0 ny*dy]);
% grid on;

% plot mesh points of contact #1
for i=1:nl_1
    xc_1(i)=xx(c_table(i,1));
    yc_1(i)=yy(c_table(i,1));
end;
% figure(fig); hold on;
% plot(xc_1,yc_1,'*r');

% plot mesh points of contact #2
for i=1:nl_2
    xc_2(i)=xx(c_table(i,2));
    yc_2(i)=yy(c_table(i,2));
end;
% figure(fig); hold on;
% plot(xc_2,yc_2,'*g'); 

% plot mesh points of contact #3
% for i=1:nl_3
%     xc_3(i)=xx(c_table(i,3));
%     yc_3(i)=yy(c_table(i,3));
% end;
% figure(fig); hold on;
% plot(xc_3,yc_3,'*r'); 