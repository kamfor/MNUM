%funkcja wyznaczjaca wartosci wlasne metoda qr bez przesuniec
function [D] = eignoshift (A, prec, it)

  n = size(A,1); 
  i = 1; 
  while i <= imax & max(max(A-diag(diag(A)))) > prec
    [Q1,R1] = qrgsm(A);
    A = R1*Q1; 
  end
  if i > it 
    error('przekrczono maksymalna liczbe iteracji');
  end
  D = diag(a);  

end
