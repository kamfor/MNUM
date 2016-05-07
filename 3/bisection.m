%funkcja wyznaczajaca zera funkcji metoda bisekcji
function zeropoint = bisection(fun,l,r,iter)
%Dane wejsciowe:	l,r - lewai prawa sterona przedzialu poszukiwan
%			fun - funkcja 
%			iter - maksymalna liczba uteracji
%Dane wyjsciowe: 	zerospoints - wektor miejsc zerowych funkcji na danym przedziale
  a = l; 
  b = r;
  fa =feval(fun,a);     %  Wartosci poczatkowe f(a) i f(b)
  fb =feval(fun,b);
  for k=1:iter
    xm = a + 0.5*(b-a);      %  Poprawne obliczenie srodka przedzialu
    fm = feval(fun,xm);      %  f(x) w srodku przedzialu
    if sign(fm)==sign(fa)    %  Zero lezy w przedziale [xm,b], zamiana a
      a = xm;
      fa = fm;
    else                     %  Zero lezy w przedziale [a,xm], zamiana b
    b = xm;
    fb = fm;
    end
  end
  zeropoint = fm; 
end
	

		
