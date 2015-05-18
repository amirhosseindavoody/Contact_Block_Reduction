%% Create potential vector
pot=zeros(1,nT);
% u0=1.0*eV;
% aa=5e-9;
% 
% for i=1:nT
%     pot(i)=u0*exp(-((xx(i)-xx(841))^2+(yy(i)-yy(841))^2)/aa^2);
% end;
% 
% for i=15:16
%     for j=21:41
%         if ((pot((i-1)*ny+j))<(0.4*eV))
%             pot((i-1)*ny+j)=0.4*eV;
%         end;
%     end;
% end;
% 
% for i=23:24
%     for j=21:41
%         if ((pot((i-1)*ny+j))<(0.4*eV))
%             pot((i-1)*ny+j)=0.4*eV;
%         end;
%     end;
% end;


%% Plot potential
% for i=1:nx
%     for j=1:ny
%         pot_xy(i,j)=pot((i-1)*ny+j);
%     end;
% end;

% fig=fig+1; figure(fig); hold off;
% surf(pot_xy); 
% xlim([1 nx]);
% ylim([1 ny]);
% grid on;