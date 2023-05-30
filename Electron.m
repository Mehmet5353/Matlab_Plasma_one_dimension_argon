Be(1)=1;
Ce(1)=1;
Fe(1)=0;

Ae(N-2)=0;
Be(N-2)=1;
Fe(N-2)=(ni(98)*gamma*mui)/mue;

    for i=2:N-3
        Ae(i)=De*APe(i-1)/h+max(fe(i-1),0);
        Ce(i)=De*APe(i)/h+max(-fe(i),0);
        Be(i)=Ae(i)+Ce(i)+(fe(i)-fe(i-1))+h/tau;
        Fe(i)=abs(fluxe(i))*1200*p*exp(-18000*p/abs(EE(i)))*h-beta*ni(i)*ne(i)*h+ne(i)*h/tau;
    end
    
    solne=TDMA(Ae,Be,Ce,Fe);