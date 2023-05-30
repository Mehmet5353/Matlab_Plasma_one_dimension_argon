
n=3;

 Aphi(2)=-eps0/(h*h);
 Cphi(2)=-eps/(h*h);
 Bphi(2)=-(eps0+eps)/(h*h);
 Fphi(2)=-e*(ni(1)-ne(1));

for i=3:N-2
    Aphi(i)=-1/(h*h);
    Cphi(i)=-1/(h*h);
    Bphi(i)=-2/(h*h);
    Fphi(i)=-e/eps0*(ni(i-1)-ne(i-1));
        
end 

 Aphi(N-1)=-eps0/(h*h);
 Cphi(N-1)=-eps/(h*h);
 Bphi(N-1)=-(eps0+eps)/(h*h);
 Fphi(N-1)=-e*(ni(98)-ne(98));

phi=TDMA(Aphi,Bphi,Cphi,Fphi);


for i=2:N-1     
         EE(i)=(-phi(i+1)+phi(i-1))/(2*h);
end


     
for i=1:N-1
         E(i)=(-phi(i+1)+phi(i))/(h);
end

for i=1:N-2
    fe(i)=-mue*E(i+1);
end

for i=1:N-2
    fi(i)=mui*E(i+1);
end

for i=1:N-2
    Pe(i)=fe(i)*h/(De);
end

for i=1:N-2
    Pi(i)=fi(i)*h/(Di);
end

switch n
    case 1
        for i=1:N-2
            APe(i)=1-0.5*abs(Pe(i));
        end
        
    case 2 
        for i=1:N-2
            APe(i)=1;
        end
    case 3
        for i=1:N-2
            if abs(Pe(i))<10e-6
                APe(i)=1;
            else
                APe(i)=abs(Pe(i))/(exp(abs(Pe(i)))-1);
            end
        end
           
end

switch n
    case 1
        for i=1:N-2
            APi(i)=1-0.5*abs(Pi(i));
        end
        
    case 2 
        for i=1:N-2
            APi(i)=1;
        end
    case 3
        for i=1:N-2
            if abs(Pi(i))<10e-6
                APi(i)=1;
            else
                APi(i)=abs(Pi(i))/(exp(abs(Pi(i)))-1);
            end
        end
           
end


    for i=2:N-3
        fluxe(i)=-De*(ne(i+1)-ne(i))/h-ne(i)*EE(i)*mue;
    end
    a=sum(fluxe);
    for i=2:N-3
        fluxe(i)=a/(N-4);
    end
    for i=1:N-3
        fluxi(i)=-Di*(ni(i+1)-ni(i))/h+ni(i)*EE(i)*mui;
    end
    
        b=sum(fluxi);
    for i=1:N-3
        fluxi(i)=b/(N-3);
    end




     

 



