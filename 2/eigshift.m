%funkcja zwracajaca diagonalna maciez z wartosciami wlasnymi metoda qr z przesunieciami 
%A macierz wejściowa , prec prezycja wyniku, it maksymalna liczba iteracji
function [D,t,iteration,v] = eigshift (A, prec, it)

  n = size(A,1);
  D = diag(zeros(n));
  I = A; %macierz poczatkowa
  v = 0; 
  iteration = 0;
  time = tic;
  for k=n:-1:2
    K = I; % macierz poczatkowa dla pojedyncze wart. wlasnej
    i=0; 
    while i <= it && max(abs(K(k,1:k-1))) > prec
      DD = K(k-1:k,k-1:k); %podmacierz 2x2 z dolnego rogu
      p = [1 -(DD(1,1)+DD(2,2)) DD(2,2)*DD(1,1)-DD(1,1)*DD(1,2)];
      ev = roots(p);
      % M = [a b,c d] rownanie dla M : 1*x^2 -(a+d)*x +a*d-c*b
      if abs(ev(1)-DD(2,2)) < abs(ev(2)-DD(2,2))
        shift = ev(1); %bajblizsza wartosc wlasna podmacierzy DD
      else
        shift = ev(2); 
      end
      K = K-eye(k)*shift; %przesuniecie macierzy
      [Q,R] = qrgsm(K); 
      K = R*Q+eye(k)*shift; % przeksztaucenie macierzy
      i = i+1;
      iteration = iteration +1;
    end
    if i>it
      %error('przekroczono maksymalna liczbe iteracji');
      v = 1; 
    end
    D(k) = K(k,k);
    if k>2
      I = K(1:k-1,1:k-1); %deflacja macierzy
    else
      D(1) = K(1,1); %ostatnia wartosc wlasna
    end
  end
  t = toc(time);
end
