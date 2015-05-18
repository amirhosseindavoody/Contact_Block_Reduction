%% A test program to generate plot 9.5.5 of Datta's book Atom to Transistor
% code by: Supriyo Datta
clear all;
clc;

%% Constants (all MKS, except energy which is in eV)
hbar=1.06e-34;
q=1.6e-19;
m=.25*9.1e-31;
IE=(q*q)/(2*pi*hbar);
Ef=0.1;
kT=.025;

%% inputs
a=3e-10;
t0=(hbar^2)/(2*m*(a^2)*q);
NS=15;
NC=30;
ND=15;
Np=NS+NC+ND;

%% Hamiltonian matrix
%NS=15; NC=20; ND=15; Np=NS+NC+ND; UB=0*ones(Np,1); %no barrier
%NS=23; NC=4;  ND=23; Np=NS+NC+ND;
    %UB=[zeros(NS,1); 0.4*ones(NC,1); zeros(ND,1);]; %tunneling barrier
NS=15;
NC=16;
ND=15;
Np=NS+NC+ND;
UB=[zeros(NS,1); 0.4*ones(4,1); zeros(NC-8,1); 0.4*ones(4,1);zeros(ND,1)]; %RT barrier
T=(2*t0*diag(ones(1,Np)))-(t0*diag(ones(1,Np-1),1))-(t0*diag(ones(1,Np-1),-1));
T=T+diag(UB);

%% Bias
V=0;
mu1=Ef+(V/2);
mu2=Ef-(V/2);
U1=V*[.5*ones(1,NS) linspace(0.5,-0.5,NC) -0.5*ones(1,ND)];
U1=U1'; %Applied potential profile

%% Energy grid for Green's function method
NE=501;
E=linspace(-.2,.8,NE);
zplus=1i*1e-12;
dE=E(2)-E(1);
f1=1./(1+exp((E-mu1)./kT));
f2=1./(1+exp((E-mu2)./kT));

%% Transmission
I=0; %Current
for k=1:NE
    sig1=zeros(Np);
    sig2=zeros(Np);
    sig3=zeros(Np); 
    ck=1-((E(k)+zplus-U1(1)-UB(1))/(2*t0));
    ka=acos(ck);
    sig1(1,1)=-t0*exp(1i*ka);
    gam1=1i*(sig1-sig1');
    ck=1-((E(k)+zplus-U1(Np)-UB(Np))/(2*t0));
    ka=acos(ck);
    sig2(Np,Np)=-t0*exp(1i*ka);
    gam2=1i*(sig2-sig2');
    G=inv(((E(k)+zplus)*eye(Np))-T-diag(U1)-sig1-sig2-sig3);
    TM(k)=real(trace(gam1*G*gam2*G'));
    I=I+(dE*IE*TM(k)*(f1(k)-f2(k)));
end
V,I

XX=a*1e9*[1:1:Np];
XS=XX([1:NS-4]);
XD=XX([NS+NC+5:Np]);

hold on
h=plot(TM,E,'b');
% h=plot(XX,U1+UB,'b');
% h=plot(XS,mu1*ones(1,NS-4),'b--');
% h=plot(XD,mu2*ones(1,ND-4),'b--');
axis([0 1.1 -.2 .8])
% axis([0 15 -.2 .8])
% set(h,'linewidth',[2.0]);
% set(gca,'Fontsize',[24]);
xlabel('Transmission ---> ')
% xlabel('z ( nm ) --->');
% ylabel('Energy ( eV ) ---> ');
grid on;