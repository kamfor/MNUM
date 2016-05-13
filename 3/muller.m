function [z] = muller(A,x,n)
%Funkcja zwracajaca wektor pierwiastkow rzeczywistych wielomianu czwartego 
%stopnia o wspolczynnikach jako wektor argumentów 
%A - wektor współczynników wielomianu
%x - punkt startowy
%n - ilosc iteracji
    z = (1:n); 
    for i = 1:n
        %obliczamy mianowniki punktow w celu ich porownania
        z1 = (df(x,2)+sqrt(df(x,1)^2-2*df(x,0)*df(x,2)));
        z2 = (df(x,2)-sqrt(df(x,1)^2-2*df(x,0)*df(x,2))); 
    
        if abs(z1) > abs(z2)
            zmin = -2*df(x,0)/z1; 
        else 
            zmin = -2*df(x,0)/z2;
        end 
        x = x+zmin; 
        z(i) = x;
    end
end
