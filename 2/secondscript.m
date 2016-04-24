%skrypt rozwiazujacy zadanie numer 2
clear; 

for i=0:8
  [A1,A2,b1,b2] = ctmx(10*(2^i)); %generowanie macierzy podanych w zadaniu
  rn1 = lznkn(A1,b1); %obliczanie wynikow dla obu podpunktow i metod
  rq1 = lnzkqr(A1,b1);
  rn2 = lznkn(A2,b2); 
  rq2 = lnzkqr(A2,b2);
  
  error1(1,i+1) = norm(A1*rn1 - b1); %obliczenie normy residuum 

  error1(2,i+1) = norm(A1*rq1 - b1);
  
  error1(3,i+1) = 10*(2^i); % uzupelnienie wektora rozwiazan o liczbe rownan

  error2(1,i+1) = norm(A2*rn2 - b2);

  error2(2,i+1) = norm(A2*rq2 - b2);  
  
  error2(3,i+1) = 10*(2^i);
end


plot(error2(3,:),error1(1,:),"or;uklad rownan normalnych;",
error2(3,:),error1(2,:),"og;metoda QR;" ) % utworzenie wykresu 1 
h1 = gcf ();
saveas(h1, "figure1.png");
clf ();

plot(error2(3,:),error2(1,:),"or;uklad rownan normalnych;",
error2(3,:),error2(2,:),"og;metoda QR;" ) % utworzenie wykresu 2 
h2 = gcf(); 
saveas(h2, "figure2.png");
 