function [D] = f_x(x)
%Funkcja zwracająca pochodne trajektorii 
%  x - wektor argumentów 
%  D - wektor rozwiązań

D(1) = x(2) + x(1)*(0.2 -x(1)^2 -x(2)^2); 
D(2) = -x(1) + x(2)*(0.2 -x(1)^2 -x(2)^2);
end

