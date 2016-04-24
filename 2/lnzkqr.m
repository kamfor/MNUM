%funkcja zwaracjaza rozwiazanie lnzk metoda QR
function [a] = lnzkqr (M,b)

  [Q,R] = qr(M);
  a = R\(Q'*b); %rozwiazanie ukladu rownan metoda QR

end