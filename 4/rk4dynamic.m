function [Y] = rk4dynamic(x,timelimit,stp)
%RK4 Rozwiazanie ukladu metoda Rungego-Kutty czwartego rzędu ze zmiennym
%krokiem
%x - stan poczatkowy
%timelimit - zakres czasu
%step - rozmiar kroku

    
    Y=zeros(10,3);
    x1 = x;
    x2 = x;
    
    time = 0; %zmienna przechowujaca aktualny przedzial czasu
    i=1; %iterator indeksu wektorow

    while(time<=timelimit)
        
        k1 = f_x(x1);
        k2 = f_x(x1+(stp/2)*k1);
        k3 = f_x(x1+(stp/2)*k2);
        k4 = f_x(x1+stp*k3); 
        x1=x1+(1/6)*stp*(k1+2*k2+2*k3+k4);

        k1 = f_x(x2);%obliczenie wartosci z polowicznym krokeim
        k2 = f_x(x2+(stp/4)*k1);
        k3 = f_x(x2+(stp/4)*k2);
        k4 = f_x(x2+(stp/2)*k3);
        x2=x2+(1/6)*(stp/2)*(k1+2*k2+2*k3+k4);
        k1 = f_x(x2);
        k2 = f_x(x2+(stp/4)*k1);
        k3 = f_x(x2+(stp/4)*k2);
        k4 = f_x(x2+(stp/2)*k3);
        x2=x2+(1/6)*(stp/2)*(k1+2*k2+2*k3+k4);  
        
        R = (x2-x1)/15;
        
        if(abs(min(R))<0.00001) %kryterium bledu wzglednego  
            stp = stp*1.1;
        else
            if(stp>0.05)
                stp = stp*0.9;
            end
        end
        Y(i,1:2) = x2;
        time = time+stp; 
        disp(stp); 
        Y(i,3) = time; %zapisanie czasu
        i = i+1; 
    end
end
