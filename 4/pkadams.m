function[Y,time,Err] = pkadams(x,timelimit,step)

    %PC rozwiazanie metoda predyktor-korektor
    time = zeros(timelimit/step,1); 
    %wektor chwil czasu
    Y = zeros(timelimit/step,2); 
    %macierz stanów x1 i x2
    Err = zeros(timelimit/step,2); 
    %wektorbłędów
    halfstep=step/2; 
    %połowa kroku 
    % generacja trzech pierwszy punktow metoda kd4
    for i = 1:3
        %display (x);
        time(i) = i*step; 
        %zapisanie czasu próbki
        k1 = xdot(x); 
        %pochodna w punkcie y(xn)
        %display (k1);
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
    for i = 4:(timelimit/step)
        time(i) = i*step;  
        %zapisanie czasu próbki
        % predykcja (z ewaluacja)
        temp = x + step/24*(55*xdot(x) - 59*xdot(Y(i-1,:)) + 37*xdot(Y(i-2,:)) - 9*xdot(Y(i-3,:)));
        % korekcja (z ewaluacja)
        x = x + step/24*(9*xdot(temp) + 19*xdot(x) - 5*xdot(Y(i-1,:)) + xdot(Y(i-2,:)));
        Y(i,:) = x; 
        %zapis wyniku
        Err(i,:) = abs((19/270)*(temp-x)); 
        %szacowanie błędu
    end
end

