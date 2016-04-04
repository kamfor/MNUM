% Obliczanie epsilona maszynowego 
  a=1.0;
  b=2.0; 
 
% epsilon maszynowy 
  while( b ~= 1)
      epsilon=a; 
      a=a/2; 
      b=1.0+a; 
  end
  fprintf('Obliczona wartosc epsilon:\n');
  disp(epsilon)
  fprintf('Stala epsilon zaimplementowana w Matlabie:\n');
  disp(eps)
  
  
% najmniejsza liczba rozna od 0
  a = 1.0;
  while(a ~= 0)
    dbl_eps = a; 
    a = a/3; 
  end
  fprintf('Obliczona najmniejsza liczba rozna od 0:\n');
  disp(dbl_eps)

