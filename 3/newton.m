%funkcja obliczajaca zera funkcji metoda Newtona
function [zeropoints] = newton(fun,l,iter)
%Dane wejsciowe:	l.r - lewai prawa sterona przedzialu poszukiwan
%			fun - funkcja 
%			iter - maksymalna liczba uteracji
%Dane wyjsciowe: 	zerospoints - wektor miejsc zerowych funkcji na danym przedziale

  for i = 1 : iter
    [fold, fpold] = feval(fun,l);
    dx = fold / fpold;
    l = l - dx;
    if ( nargout == 0 )
      disp ( sprintf ( '(p. Newtona)  \t\t %3d \t %.10f ', i, l ) )
    end
    if ( nargout == 1 )
    y = x0;
    return
    end
  end
  disp(’Osiagnieta maksymalna liczba iteracji’)
  if ( nargout == 1 )
   zeropoint = x0;
  end
end
  