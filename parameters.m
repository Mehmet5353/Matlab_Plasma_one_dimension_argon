beta=2e-13;
e=1.6e-19;
eps0=8.854e-12;
eps=eps0*10;
gamma=0.07;
L=0.01;
p=1;
mue=3e1/p;
mui=0.8/p;
Te=1;
Ti=0.025;
Ud=750;
De=mue*Te;
Di=mui*Ti;
C=1000;
w=50e3;

t=0;
N=100;
h=L/(N-1);
x=0:h:L;
y=h:h:L-h;
%Empty Lists

fe=zeros(1,N-3);
fi=zeros(1,N-3);
Aphi=zeros(1,N);
Bphi=zeros(1,N);
Cphi=zeros(1,N);
Fphi=zeros(1,N);

E=zeros(1,N-1);
EE=zeros(1,N-1);

ni=zeros(1,N-2);
ne=zeros(1,N-2);

Ai=zeros(1,N-2);
Bi=zeros(1,N-2);
Ci=zeros(1,N-2);
Fi=zeros(1,N-2);

Ae=zeros(1,N-2);
Be=zeros(1,N-2);
Ce=zeros(1,N-2);
Fe=zeros(1,N-2);

%Boundary conditions for E.Potential
 Bphi(1)=1;
 Cphi(1)=0;
 Fphi(1)=Ud*cos(w*t);
        
 Aphi(N)=0;
 Bphi(N)=1;
 Fphi(N)=0;
 
fluxe=zeros(1,N);
fluxi=zeros(1,N);

Pe=zeros(1,N);
Pi=zeros(1,N);

APe=zeros(1,N);
APi=zeros(1,N);

 for i=1:N-2
    ni(i)=-1e20*((x(i+1)-x(2))*(x(i+1)-x(99)));
 end

 for i=1:N-2
    ne(i)=-1e20*((x(i+1)-x(2))*(x(i+1)-x(99)));
end


