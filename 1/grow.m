function [x] = grow (A,x,b,LU,P)

  r = A*x-b;
  while (norm(r)>2*eps)
    r = A*x-b;
    dx = lufx(LU,P,r);
    x = x-dx;
  endwhile

endfunction
