%funkcja obliczajaca zera funkcji metoda siecznych
function [zeropoint] = secant(fun,l,r,iter)
%Dane wejsciowe:	l.r - lewai prawa sterona przedzialu poszukiwan
%			fun - funkcja 
%			iter - maksymalna liczba uteracji
%Dane wyjsciowe: 	zerospoints - wektor miejsc zerowych funkcji na danym przedziale
  older = l;   old = r;
  folder = feval(fun,older);
  for i = 2 : iter
    fold = feval(fun,old);
    dx = fold * ( old - older ) / ( fold - folder );
    new = old - dx;
    if ( nargout == 0 )
      disp ( sprintf ( ’\t\t %3d \t %.15f \n’, i, new ) )
    end
    if ( abs(dx) < TOL )
    if ( nargout == 1 )
    zeropoint = new;
    end
    return
    else
    older = old;
    old = new;
    folder = fold;
    end
  end
  disp(’Osiagnieta maksymalna liczba iteracji’)
  if ( nargout == 1 ) zeropoint = new;
  end
