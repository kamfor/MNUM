%funkcja wyznaczajaca zera funkcji metoda bisekcji
function [zeropoints] = bisection(fun,l,r,iter)
%Dane wejsciowe:	l.r - lewai prawa sterona przedzialu poszukiwan
%			fun - funkcja 
%			iter - maksymalna liczba uteracji
%Dane wyjsciowe: 	zerospoints - wektor miejsc zerowych funkcji na danym przedziale
  if iter<4
   n=15;
  end    %  Ustawienie domyslnej liczby iteracji
  a = l;   b = r;
  fa =feval(fun,a)% a - a^(1/3) - 2;      %  Wartosci poczatkowe f(a) i f(b)
  fb =feval(fun,b)% b - b^(1/3) - 2;
  fprintf('  k       a            xmid          b      f(xmid)\n');
  for k=1:n
    xm = a + 0.5*(b-a);      %  Poprawne obliczenie srodka przedzialu
    fm = feval(fun,xm);      %  f(x) w srodku przedzialu
    fprintf('%3d  %12.8f  %12.8f  %12.8f  %12.3e\n',k,a,xm,b,fm);
    if sign(fm)==sign(fa)    %  Zero lezy w przedziale [xm,b], zamiana a
      a = xm;
      fa = fm;
    else                     %  Zero lezy w przedziale [a,xm], zamiana b
    b = xm;
    fb = fm;
    end
  end
end
	

		
