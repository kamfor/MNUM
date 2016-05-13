%funkcja obliczajaca zera funkcji metoda siecznych
function szeropoint = secant(fun,l,r,iter)
%Dane wejsciowe:	l.r - lewai prawa sterona przedzialu poszukiwan
%			fun - funkcja 
%			iter - maksymalna liczba uteracji
%Dane wyjsciowe: 	zerospoints - wektor miejsc zerowych funkcji na danym przedziale
  a = l;
  b = r;
  fa = feval(fun,a);
  for k = 1:iter
    fb = feval(fun,b);
    dx = fb * (b-a) / (fb-fa);
    xm = b-dx;
    if(isnan(xm))
        return
    end
    a = b;
    b = xm;
    fa = fb;
    szeropoint = b;
    fprintf('%3d %12.16f %12.16f %12.16f %12.3e\n',k,a,xm,b,dx);
    if(fb == 0)
        return
    end
  end
end
