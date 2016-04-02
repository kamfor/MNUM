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
    
    [void pos] = max(abs(LU(k:n,k))); %wybór elementu głównego
    pos=pos+k-1;
  
    if(pos~=k) % zamiana wierszy
      temp = LU(pos,:);
      LU(pos,:) = LU(k,:);
      LU(k,:) = temp;
        
      P(k,k) = 0; % zapis zmiany wierszy do maciezy transformacji
      P(pos,pos) = 0;
      P(k,pos) = 1;
      P(pos,k) = 1;
    endif
             
    for i = k+1:n % normalizacja podmacieży pod elementem głównym
    
      
      LU(i,k) = LU(i,k)/LU(k,k);
      LU(i,(k+1):n) = LU(i,(k+1):n) - LU(i,k)*LU(k,(k+1):n);
      
    end
    
  end
  
endfunction
