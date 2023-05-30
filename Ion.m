Bi(1)=1;
Ci(1)=0;
Fi(1)=0;

Ai(N-2)=1;
Bi(N-2)=1;
Fi(N-2)=0;
tau=2e-15;

    for i=2:N-3
        Ai(i)=Di*APi(i-1)/h+max(fi(i-1),0);
        Ci(i)=Di*APi(i)/h+max(-fi(i),0);
        Bi(i)=Ai(i)+Ci(i)+(fi(i)-fi(i-1))+h/tau;
        Fi(i)=abs(fluxe(i))*1200*p*exp(-18000*p/abs(EE(i)))*h-beta*ni(i)*ne(i)*h+ni(i)*h/tau;
    end
    solni=TDMA(Ai,Bi,Ci,Fi);
    
      c=0;
     for i=2:N-3
         c=c+sqrt((1/(N))*abs((solni(i)-ni(i))^2))/abs(ni(i));
     end
     