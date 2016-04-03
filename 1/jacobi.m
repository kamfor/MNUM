%Rowziązywanie ukladów równań metodą Jacobiego
function [x] = jacobi(A,b)
 
  n = size(A)(1,1); %wyznaczenie rozmiaru ukladu
   
  U = L = zeros(n); %macierze U i L poczatkowo rowne 0
  
  for i = 1:n % dekompozycja macierzy na U D L
    
      for j = 1:n
      
      if(i==j)
          D(i,j) = 1/A(i,j);% macierz D powstaje jako D'    
      endif
      
      if(i<j)
        U(i,j) = A(i,j);
      endif
      
      if (j<i)
        L(i,j) = A(i,j);
      endif
    
    end
  
  end
  
  M = -D*(L+U); % skrocenie zapisu
  
  x = zeros(n,1); % pierwotna wartosc rozwiazania
  
  err = norm(A*x -b,1); 
  
  while (1) % iteracja obliczjaca coraz dokladniejsze wartosci x
  
    err = norm(A*x -b,1);
  
    x = M*x + D*b;
   
    lerr = norm(A*x -b,1);
    
    if(lerr>err) % jezeli prezyzja maleje zakoncz iteracje
      break;
    endif
   
  end
  
endfunction