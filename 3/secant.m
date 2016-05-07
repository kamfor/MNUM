%funkcja obliczajaca zera funkcji metoda siecznych
function zeropoint = secant(fun,l,r,iter)
%Dane wejsciowe:	l.r - lewai prawa sterona przedzialu poszukiwan
%			fun - funkcja 
%			iter - maksymalna liczba uteracji
%Dane wyjsciowe: 	zerospoints - wektor miejsc zerowych funkcji na danym przedziale
  a = l;   b = r;
  fa = feval(fun,a);
  for i = 2 : iter
    fb = feval(fun,b);
    dx = fb * (b-a) / (fb-fa);
    new = b-dx;
    if ( nargout == 1 )
    zeropoint = new;
    end
    a = b;
    b = new;
    fa = fb;
  end
end
