%Skrypt generujący rozwiązania do zadania 3
clear; 

A = [14 -1 -3 5;1 -7 -4 -1;2 -4 -12 -1;1 -1 6 -16];
b = [1;0;-10;2];

x = jacobi(A,b);

res  = A*x - b; 
error = norm(res,1);
printf('Rozwiazanie ukladu z zadaina:\n');
printf('%g\n',x);
printf('Blad dla ukladu z zadaina: %g,\n',error); 

for i= 1:3 % iteracja po podpunktach z zadania 2

  for j= 0:7 % iteracja po liczbie rownan
  
  result(1,j+1) = 10*2^j; 
  
  t = cputime; 

  [A,b] = create_matrix(10*2^j,i);
  
  x = jacobi(A,b);
  
  res = A*x - b;
  error = norm(res,1); 
  
  result(2,j+1) = error; 
    
  time = cputime-t; % obliczenie czasu wykonania
  
  if(time>120) % dla czasu pow 2minut przerwanie wykonania
    break; 
  endif
  
  printf('Zastosowanie metody do ukladow z zadania 2,');
  printf('Podpunkt: %d ,Liczba rownan: %d , Blad: %g , Czas: %d sek. \n',i,result(1,j+1),result(2,j+1),time);

  endfor
  
endfor