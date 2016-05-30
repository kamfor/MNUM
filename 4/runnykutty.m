function [Y,time] = runnykutty(x,timelimit,step)
%RK4 Rozwiazanie ukladu metoda Rungego-Kutty czwartego rzędu
%x - stan poczatkowy
%time - horyzont czasu
%step - rozmiar kroku

    time = zeros(ceil(timelimit/step),1); 
    %wektor chwil czasu
    Y = zeros(ceil(timelimit/step),2); 
    %macierz stanów x1 i x2
    halfstep=step/2; 
    %połowa kroku
    for i = 1:(ceil(timelimit/step))
        time(i) = i*step; 
        %zapisanie czasu próbki
        k1 = xdot(x); 
        %pochodna w punkcie y(xn)
        k2 = xdot(x+halfstep*k1); 
        %pochodna w punkcie y(xn+step/2*k1)
        k3 = xdot(x+halfstep*k2); 
        %pochodna w punkcie y(xn+step/2*k2)
        k4 = xdot(x+step*k3); 
        %pochodna w punkcie y(xn+step*k3)
        x=x+(1/6)*step*(k1+2*k2+2*k3+k4); 
        %obliczenie następnego punktu
        Y(i,:) = x; 
        %zapisanie punktu do wektora
    end
end

