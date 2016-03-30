%Rozwiązywanie układów równań metodą eliminacji Gaussa z częściowym wyborem elementu podstawowego. 

%generowanie Macieży o wymiarach mxm o założeniach podanych w zadaniu`

% w 2.2 źle uwarunkowane bo wychodza eelementty na diagonali bliskie 0 

%Ly = Pb, Ux = y PA = LU

clear

t = cputime; 

[A,b] = create_matrix(100,3); 

[LU,P] = lucw(A);

n = size(b)(1,1)

b = P*b;

%macierz trójkątna dolna Ly = Pb

y(1,1) = b(1,1);

for i = 2:n

  s = b(i,1);
  
  for j = 1:i-1
    s = s - LU(i,j)*y(j,1);
  endfor
  
  y(i,1) = s;
  
endfor
%macierz trójkątna górna Ux = y


x(n,1) = y(n,1)/LU(n,n);

for i = n-1:-1:1

  p = y(i,1);
  
  for j = i+1:n
    p = p - LU(i,j)*x(j,1);
  endfor
  
  x(i,1) = p/LU(i,i);
  
endfor

m = cputime-t