function [D] = f_xy(y,x)
%Funkcja zwracająca pochodne trajektorii 
%  x - wektor argumentów 
%  D - wektor rozwiązań
disp(y); 

D(1) = x(2) + x(1)*(0.2 -x(1)^2 -x(2)^2); 
D(2) = -x(1) + x(2)*(0.2 -x(1)^2 -x(2)^2);
D = transpose(D);

end

