%% Plot of electronic thermal conductivity versus doping density

% at 1000 K

figure(1);
hold off;
eKappa = [0.0503, 0.1486, 0.24424, 0.338, 0.4308, 0.47738, 0.9212, 1.345, 1.74938, 3.8577916];
dop = [1e18, 3e18, 5e18, 7e18, 9e18, 1e19, 2e19, 3e19, 4e19, 1e20];
dopi = 1e18:1e17:1e20;
yi = pchip(dop, eKappa, dopi);
semilogx(dopi,yi,'Linewidth',3,'linestyle','-','color','b');
% title('Electron mobility versus doping density','FontSize',20);
xlabel('Doping density [cm^{-3}]','FontSize',20);
ylabel('Elec. Ther. Cond. [W/m.K]','FontSize',20)
set(gca,'fontsize',16)
box on;
hold on;

% at 300 K

figure(1)
eKappa = [0.0692, 0.193, 0.3123, 0.42662, 0.533, 0.582, 0.997594, 1.3639251, 1.6913992, 2.7765613];
dop = [1e18, 3e18, 5e18, 7e18, 9e18, 1e19, 2e19, 3e19, 4e19, 1e20];
dopi = 1e18:1e17:1e20;
yi = pchip(dop, eKappa, dopi);
semilogx(dopi,yi,'Linewidth',3,'linestyle','--','color','r');
% title('Electron mobility versus doping density','FontSize',20);
xlabel('Doping density [cm^{-3}]','FontSize',20);
ylabel('Elec. Ther. Cond. [W/m.K]','FontSize',20)
set(gca,'fontsize',16)
box on;
hold on;

%% Trying inset figure

x1 = linspace(0,1);
x2 = linspace(3/4,1);
y1 = sin(2*pi*x1);
y2 = sin(2*pi*x2);
figure(1)
% plot on large axes
plot(x1,y1)
% create smaller axes in top right, and plot on it
axes('Position',[.7 .7 .2 .2])
box on
plot(x2,y2)