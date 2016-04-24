%funkcja tworzaca macierze i wektory rozwiazan podane w zadaniu 2
function [A1,A2,b1,b2] = ctmx (n)

A1 = zeros(2*n,n);

  for i=1:2*n
    for j=1:n
      A1(i,j) = 2*(i-j)+1; 
      A1(j,j) = 1/6; 
      A2(i,j) = 8/(9*(i+j+1));
    end; 
    b1(i,1) = 1 + 0.4*i;
    if (mod(i, 2) == 0)
    b2(i,1) = 4/(3*i); 
    end
  end  

end
