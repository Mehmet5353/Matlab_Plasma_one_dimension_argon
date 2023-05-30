clear all
clc
close all
parameters;

c=3;
iter=0;
t=0;



% figure
while c>1e-5; 
    iter=iter+1;
    
    PHI;
    Ion;
    Electron;
    ni=solni;
    ne=solne;
    tau=C*h/abs(max(mue.*EE));
%     if (rem(iter,1000)==0)
% %         subplot(211)
% %         plot(x,ne,'b',x,ni,'r'); hold on
% %         subplot(212)
%         plot(t,(Ud*cos(w*t)),'b'); hold on
%         pause(1e-6)
% %         iter
% %         c
%     end   
    t=t+tau;
    O=Ud*cos(w*t);
    
    
end


figure;
plot(y,ni,'b',y,ne,'r')

    for i=1:N-1
        fluxele(i)=-e*((-De*(ne(i+1)-ne(i))/h-ne(i)*EE(i)*mue));
    end
    
    for i=1:N-1
        fluxion(i)=e*((-Di*(ni(i+1)-ni(i))/h+ni(i)*EE(i)*mui));
    end

