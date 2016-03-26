%funkcja generująca macież spełniajcą założenia zadania 2 n - wymiar p - podpunkt w zadaniu

function [A,B] = create_matrix (n,p)


if (p==1)
  for i = 1:n
    for j = 1:n
      if (i==j)
        A(i,j) = 10
      endif
      if (i==j-1)
        A(i,j) = 5
      endif
      if (i==j+1)
        A(i,j) = 5
      endif
    end
      B(i) = 2 + 0.3*i
  end
endif

if (p==2)
for i = 1:n
    for j = 1:n
      if (i==j)
        A(i,j) = 1/6
      else
        A(i,j) = 2*(i-j) + 1
      endif
     
    end
      B(i) = 1 + 0.4*i
  end
endif

if (p==3)
for i = 1:n
    for j = 1:n
      A(i,j) = 8/(9*(i + j + 1))
    end
      if (mod(i, 2) == 0)
        B(i) = 4/(3*i)
      else
        B(i) = 0
      endif
  end
endif
  

endfunction