%funkcja generująca macierz 
function [A,B] = create_matrix (n,p)

  if (p==1)
   for i = 1:n
     for j = 1:n
       if (i==j)
         A(i,j) = 10;
       end
       if (i==j-1)
         A(i,j) = 5;
       end
       if (i==j+1)
         A(i,j) = 5;
       end
     end
     B(i,1) = 2 + 0.3*i;
   end
  end

  if (p==2) 
  for i = 1:n
    for j = 1:n
      if (i==j)
        A(i,j) = 1/6;
      else
        A(i,j) = 2*(i-j) + 1;
      end
    end
    B(i,1) = 1 + 0.4*i;
   end
  end

  if (p==3)
  for i = 1:n
    for j = 1:n
      A(i,j) = 8/(9*(i + j + 1));
    end
    if (mod(i, 2) == 0)
      B(i,1) = 4/(3*i);
    else
      B(i,1) = 0;
    end
   end
  end
  
end
