%funkcja obliczajaca zera funkcji metoda Newtona
function zeropoint = newton(fun,l,iter)
%Dane wejsciowe:	l.r - lewai prawa sterona przedzialu poszukiwan
%			fun - funkcja 
%			iter - maksymalna liczba uteracji
%Dane wyjsciowe: 	zerospoints - wektor miejsc zerowych funkcji na danym przedziale

  for i = 1 : iter
    [fold, fpold] = feval(fun,l);
    dx = fold / fpold;
    l = l - dx;
    if ( nargout == 1 )
    zeropoint = x0;
    return
    end
  end
  if ( nargout == 1 )
   zeropoint = x0;
  end
end
  