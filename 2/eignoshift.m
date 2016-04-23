%funkcja wyznaczjaca wartosci wlasne metoda qr bez przesuniec
function [D,t,i,v] = eignoshift (A, prec, it)
  s = tic;
  v=0;
  n = size(A,1); 
  i = 1; 
  while i <= it & max(max(A-diag(diag(A)))) > prec
    [Q1,R1] = qrgsm(A);
    A = R1*Q1; 
    i=i+1;
  end
  if i > it 
    %error('przekrczono maksymalna liczbe iteracji');
    v=1;
  end
  D = diag(A);  
  t = toc(s);

end
