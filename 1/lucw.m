% funkcja zwracajaca podział LU macierzy kwadratowej
function [LU,P] = lucw (A)

  n = size(A)(1,1);
  
  if n!=size(A)(1,2) 
    print("macierz nie jest kwadratowa");
  endif
  P = eye(n); %macierz transformacji
  LU = A; 
  
  for k = 1:n-1
      
    [void pos] = max(abs(LU(k:n,k))); %wybór elementu głownego
    pos=pos+k-1;
  
    if(pos~=k) % zamiana wierszy
      temp = LU(pos,:);
      LU(pos,:) = LU(k,:);
      LU(k,:) = temp;
        
      P(k,k) = 0; % zapis zmiany wierszy do macierzy transformacji
      P(pos,pos) = 0;
      P(k,pos) = 1;
      P(pos,k) = 1;
    endif
             
    for i = k+1:n % normalizacja podmacierzy pod elementem głównym
          
      LU(i,k) = LU(i,k)/LU(k,k); %wyznaczanie k-tej kolumny
      LU(i,(k+1):n) = LU(i,(k+1):n) - LU(i,k)*LU(k,(k+1):n);
      
    end
    
  end
  
endfunction
