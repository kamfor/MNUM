%Skrypt generujący rozwiązania do zadania 3
clear; 

A = [14 -1 -3 5;1 -7 -4 -1;2 -4 -12 -1;1 -1 6 -16]; %macierz z zadania
b = [1;0;-10;2]; %wektor rozwiazan

x = jacobi(A,b); %obloicznie x wczesniej napisna funkcja

res  = A*x - b; 
error = norm(res,1); %blad jako norma residuum
printf('Rozwiazanie ukladu z zadaina:\n');
printf('%g\n',x);
printf('Blad dla ukladu z zadaina: %g,\n',error); 

for i= 1:3 % iteracja po podpunktach z zadania 2

  for j= 0:7 % iteracja po liczbie rownan
  
  result(1,j+1) = 10*2^j; % liczby rownan
  
  t = cputime; 

  [A,b] = create_matrix(10*2^j,i); %utworzenie macierzy
  
  x = jacobi(A,b); % obliczanie rozwiazania
  
  res = A*x - b;
  error = norm(res,1); %blad jako norma residuum
  
  result(2,j+1) = error; %zapis wynikow
    
  time = cputime-t; % obliczenie czasu wykonania
  
  if(time>120) % dla czasu pow 2minut przerwanie wykonania
    break; 
  end
  
  printf('Zastosowanie metody do ukladow z zadania 2,'); 
  printf('Podpunkt: %d ,Liczba rownan: %d , Blad: %g , Czas: %d sek. \n',i,result(1,j+1),result(2,j+1),time);

  end
  
end
