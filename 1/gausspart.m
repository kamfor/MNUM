%Skrypt generujący wyniki oraz wykresy
clear

F = fopen('results.txt','w'); %wynik zapisany do pliku

for i= 1:3 % iteracja po podpunktach

  for j= 0:7 % iteracja po liczbie rownan
  
  result(1,j+1) = 10*2^j; 
  
  t = cputime; 

  [A,b] = create_matrix(10*2^j,i);

  [LU,P] = lucw(A);
  
  x = lufx(LU,P,b);
  
  res = A*x - b;
  error = norm(res,1); 
  
  result(2,j+1) = error; 
    
  time = cputime-t; % obliczenie czasu wykonania
  
  fprintf(F, 'Podpunkt: %d ,Liczba rownan: %d , Blad: %g , Czas: %d sek. \n',i,result(1,j+1),result(2,j+1),time);

  endfor
  
  a = stem(result(1,:),result(2,:),"o","filled"); % utworzenie wykresu
  
  if(i==1)
    title('Plot 1');
    xlabel('number of eqations');
    ylabel('error');
    saveas(a, 'wykres1.png');
  
  elseif (i==2) 
    title('Plot 2');
    xlabel('number of eqations');
    ylabel('error');
    saveas(a, 'wykres2.png');
  else
    title('Plot 3');
    xlabel('number of eqations');
    ylabel('error');
    saveas(a, 'wykres3.png');
  endif
 

endfor

fclose(F);

