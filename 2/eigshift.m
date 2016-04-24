%funkcja zwracajaca diagonalna maciez z wartosciami wlasnymi metoda qr z przesunieciami 
%A macierz wejściowa , prec prezycja wyniku, it maksymalna liczba iteracji
%Na podstawie skryptu prof. Tatjewskiego
function [D,t,iteration,v] = eigshift (A, prec, it)

  n = size(A,1);
  D = diag(zeros(n));
  I = A; %macierz poczatkowa
  v = 1; 
  iteration = 0;
  time = tic;
  for k=n:-1:2
    K = I(1:k, 1:k); % macierz poczatkowa dla pojedynczej wart. wlasnej
    i=0; 
    while i <= it && max(abs(K(k,1:k-1))) > prec
      p = [1 -(K(k-1,k-1)+K(k,k)) K(k,k)*K(k-1,k-1)-K(k,k-1)*K(k-1,k)];
      ev = roots(p);
      % M = [a b,c d] rownanie dla M : 1*x^2 -(a+d)*x +a*d-c*b
      if abs(ev(1)-K(k,k)) < abs(ev(2)-K(k,k))
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
      v = 0; 
      break;
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
