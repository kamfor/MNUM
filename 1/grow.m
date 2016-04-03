% Funkcja realizująca iteracyjne poprawianie
function [x] = grow (A,x,b,LU,P)

  r = A*x-b;
  while (norm(r)>2*eps)
    o = r; 
    r = A*x-b;
    if(norm(r)<norm(o))
      break; 
    endif
    dx = lufx(LU,P,r);
    x = x-dx;
  endwhile

endfunction
