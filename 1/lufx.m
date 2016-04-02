function [x] = lufx (LU,P,b)

n = size(b)(1,1);

b = (P')*b;

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

endfunction
