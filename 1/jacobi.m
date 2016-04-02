%Rowziązywanie ukladów równań metodą Jacobiego

function [x] = jacobi(A,b)

   
  n = size(A)(1,1);
  
  b=b
  
  U = L = zeros(n); 
  
  for i = 1:n
    
      for j = 1:n
      
      if(i==j) 
        
          D(i,j) = 1/A(i,j);
          
      endif
      
      if(i<j)
      
        U(i,j) = A(i,j);
        
      endif
      
      if (j<i)
      
        L(i,j) = A(i,j); 
        
      endif
    
    endfor
  
  endfor
  
  M = -D*(L+U);
  
  x = zeros(n,1);
  
  err = norm(A*x -b,1); 
  
  while (1)
  
    err = norm(A*x -b,1);
  
    x = M*x + D*b;
   
    lerr = norm(A*x -b,1);
    
    if(lerr>err)
    
      break;
      
    endif
   
  endwhile
  
endfunction