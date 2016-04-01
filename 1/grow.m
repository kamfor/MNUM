function [x] = grow (A,x,b)

  while (norm(x)<eps)
    r = A*x-b; 
    dx = lufx(LU,P,r);
    x = x-dx;
  endwhile

endfunction
