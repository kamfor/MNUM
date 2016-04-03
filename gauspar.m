%Rozwiązywanie układów równań metodą eliminacji Gaussa z częściowym wyborem elementu podstawowego. 

%generowanie Macieży o wymiarach mxm o założeniach podanych w zadaniu`

% w 2.2 źle uwarunkowane bo wychodza eelementty na diagonali bliskie 0 

%Ly = Pb, Ux = y PA = LU

clear

F = fopen('results.txt','w');

for i= 1:3

  for j= 0:7
  
  result(1,j+1) = 10*2^j; 
  
  t = cputime; 

  [A,b] = create_matrix(10*2^j,i);

  [LU,P] = lucw(A);
  
  x = lufx(LU,P,b);
  
  res = A*x - b;
  error = norm(res,1); 
  
  result(2,j+1) = error; 
    
  time = cputime-t
  
  fprintf(F, 'Podpunkt: %d ,Liczba rownan: %d , Blad: %g , Czas: %d sek. \n',i,result(1,j+1),result(2,j+1),time);

  endfor
  
  a = stem(result(1,:),result(2,:),"o","filled"); 
  
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

