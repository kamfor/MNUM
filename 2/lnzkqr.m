function [a] = lnzkqr (M,b)
  
  [Q,R] = qr(M); 
  a = R\(Q'*b);
  
endfunction
