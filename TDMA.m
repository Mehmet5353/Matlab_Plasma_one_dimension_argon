
function x=TDMA(A,B,C,F)

n=length(F);

C(1)=C(1)/B(1);
F(1)=F(1)/B(1);

for i=2:n-1
    dummy=B(i)-A(i)*C(i-1);
    C(i)=C(i)/dummy;
    F(i)=(F(i)+A(i)*F(i-1))/dummy;
end
    
F(n)=(F(n)+A(n)*F(n-1))/(B(n)-A(n)*C(n-1));

x(n)=F(n);

for i=n-1:-1:1
    x(i)=F(i)+C(i)*x(i+1);
end
    



       