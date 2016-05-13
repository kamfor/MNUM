%funkcja obliczajaca zera funkcji metoda Newtona
function nzeropoint = newton(fun,l,iter)
%Dane wejsciowe:	l.r - lewai prawa sterona przedzialu poszukiwan
%			fun - funkcja 
%			iter - maksymalna liczba uteracji
%Dane wyjsciowe: 	zerospoints - wektor miejsc zerowych funkcji na danym przedziale
    
  x0 = l; 
  for k = 1:iter
    [fold, fpold] = feval(fun,x0);
    dx = fold / fpold;
    x0 = x0 - dx;
    fprintf('%3d %12.16f %12.16f %12.3e\n',k,x0,dx,fold);
    if(fold == 0)
        return
    end
  end
  if ( nargout == 1 )
   nzeropoint = x0;
  end
end
  