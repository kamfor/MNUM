%Rozwiązywanie układów równań metodą eliminacji Gaussa z częściowym wyborem elementu podstawowego. 

%generowanie Macieży o wymiarach mxm o założeniach podanych w zadaniu`

% w 2.2 źle uwarunkowane bo wychodza eelementty na diagonali bliskie 0 

%Ly = Pb, Ux = y PA = LU

clear

for i= 0:4

  for j= 1:3

  t = cputime; 

  [A,b] = create_matrix(10*2^i,j);

  [LU,P] = lucw(A);
  
  x = lufx(LU,P,b);
  
  

  res = A*x - b;
  norma = norm(res,1)  
  
  %res = A*grow(A,x,b,LU,P) - b;
  %normagrow = norm(res,1)

  time = cputime-t

  if (time>30) 
  break; 
  endif 

  endfor

  if (time>60) 
  break; 
  
  endif 

endfor

