% funkcja zwracająca podział LU macieży kwadratowej oraz macierz transformacji po wyborze elementu głównego macież LU zistaje zapisana w jednej maciezy w celu oszczędności p
function [LU,P] = lucw (A)
  n = size(A)(1,1);
  
  if n!=size(A)(1,2) 
    print("macierz nie jest kwadratowa");
  endif
  P = eye(n); %macierz transformacji
  LU = A; %macież LU powstaje poprzez bezposrednie operacje na elementach maciezy wejsciowej
  
  for k = 1:n-1
  
    %{
    if(LU(k,k)<eps)
      printf("macierz osobliwa");
    endif
    %}
    
  
    
    elem = k; % początkowa pozycja elementu głownego
    for m = k:n %wybór elementu głównego
      
      if(abs(LU(m,k))>abs(LU(elem,k)))
        elem = m;
      endif
      
      if(elem!=k) % zamiana wierszy
        temp = LU(elem,:);
        LU(elem,:) = LU(k,:);
        LU(k,:) = temp;
        
        P(k,k) = 0; % zapis zmiany wierszy do maciezy transformacji
        P(elem,elem) = 0;
        P(k,elem) = 1;
        P(elem,k) = 1;
      endif
          
    end
    
    
  
    
    
    %{
    for i = k+1:n % normalizacja kolumny pod elementem głównym
      LU(i,k) = LU(i,k)/LU(k,k);
    end
    %}
    
    for i = k+1:n % normalizacja podmacieży pod elementem głównym
    
      LU(i,k) = LU(i,k)/LU(k,k);
      
      for j = k+1:n
          LU(i,j) = LU(i,j) - LU(i,k) * LU(k,j);
      end
      
    end
    %M = LU
  end
endfunction
