%funkcja obliczajaca zera funkcji metoda Newtona
function nzeropoint = newton(fun,l,iter)
%Dane wejsciowe:	l prawa sterona przedzialu poszukiwan
%			fun - funkcja 
%			iter - maksymalna liczba uteracji
%Dane wyjsciowe: zerospoint - wyznaczone miejsce zerowe
    
  x0 = l; 
  for k = 1:iter
    [fold, fpold] = feval(fun,x0); 
    dx = fold / fpold; %wyznaczenie przyrostu funkcji
    x0 = x0 - dx;
    fprintf('%3d %12.16f %12.16f %12.3e\n',k,x0,dx,fold);
    if(fold == 0)
        return
    end
	if fold==0 %dodatkowy warunek zatrzumania
        nzeropoint = x0;
        break; 
     end
  end
end
  