% Sktypt wyznaczajacy blad po poprawianu iteracyjnym
clear;

for i= 1:3 % iteracja po podpunktach
  
  [A,b] = create_matrix(10,i);

  [LU,P] = lucw(A);
  
  x = lufx(LU,P,b);
  
  res = A*x - b;
  error = norm(res,1); 
  
  fprintf('Blad dla zestawu: %d przed poprawianiem: %g,',i,error); 
   
  res1 = A*grow(A,x,b,LU,P) - b;% Poprawianie
  error1 = norm(res1,1);
  
  fprintf('Blad dla zestawu: %d po iteracyjnym poprawianiu: %g,\n',i,error1);
  
end
