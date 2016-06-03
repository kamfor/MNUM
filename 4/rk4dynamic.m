function [Y] = rk4dynamic(x,timelimit,stp)
%RK4 Rozwiazanie ukladu metoda Rungego-Kutty czwartego rzędu ze zmiennym
%krokiem
%x - stan poczatkowy
%timelimit - zakres czasu
%step - rozmiar kroku

    Y = zeros(ceil(timelimit/stp),3); %macierz stanów x1, x2 i czasu
    hstp=stp/2; %połowa kroku
    for i = 1:(ceil(timelimit/stp))
        Y(i,3) = i*stp; %zapisanie czasu próbki
        k1 = f_x(x); %pochodna w punkcie y(xn)
        k2 = f_x(x+hstp*k1); %pochodna w punkcie y(xn+step/2*k1)
        k3 = f_x(x+hstp*k2); %pochodna w punkcie y(xn+step/2*k2)
        k4 = f_x(x+stp*k3); %pochodna w punkcie y(xn+step*k3)
        x=x+(1/6)*stp*(k1+2*k2+2*k3+k4); %obliczenie następnego punktu
        Y(i,1:2) = x; %zapisanie punktu do wektora
        
    end
end
