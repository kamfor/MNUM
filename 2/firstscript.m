%realizacja zadania 1 z projektu 2.17
  clear; 
  F = fopen('results.txt','w'); %wynik zapisany do pliku
  fprintf(F, 'Wyniki do zadania numer 1 \n');
  Z = [5 10 20];
  
  %macierz symetryczna
  fprintf(F, '<<<Macierz symetryczna>>>\n\n');
  for i=1:3;
    Gtimen = 0; %zmienne do wyliczania średnich wartosci
    Gitern = 0; 
    Gprecn = 0; 
    Gvalidn = 0; 
    Gtimes = 0; 
    Giters = 0; 
    Gprecs = 0; 
    Gvalids = 0;
    Gteig = 0; 
    for j=1:30
      A = cmsim(Z(i));
      [R,timen,itn,validn] = eignoshift(A,0.00001,1000);% metoda bez przesuniec
      [S,times,its,valids] = eigshift(A,0.00001,1000); % metoda z przesunieciami
      eigstart = tic; 
      E = eig(A);
      teig = toc(eigstart);
      Gteig = Gteig + teig;
      Gtimen = Gtimen + timen;
      Gitern = Gitern + itn; 
      Gprecn = Gprecn + norm(R-E);
      if validn == 1
        Gvalidn = Gvalidn + 1; % zliczanie poprawnych rozwiazan
      end
      Gtimes = Gtimes + times;
      Giters = Giters + its; 
      Gprecs = Gprecs + norm(S-E);
      if valids == 1 
        Gvalids = Gvalids + 1;
      end
    end
    Gtimen = Gtimen/Gvalidn; 
    Gitern = Gitern/Gvalidn;      [S,times,its,valids] = eigshift(A,0.00001,1000); % metoda z przesunieciami

    Gprecn = Gprecn/Gvalidn;
    Gtimes = Gtimes/Gvalids; 
    Giters = Giters/Gvalids;
    Gprecs = Gprecs/Gvalids;
    Gteig = Gteig/30; 
    fprintf(F, '<<<Liczba rownan %d >>>\n',Z(i));
    fprintf(F, '<<<Macierz symetryczna bez przesuniec>>>\n');
    fprintf(F, 'Sredni czas wykonania: %d\n',Gtimen);
    fprintf(F, 'Srednia ilosc iteracji: %d\n',Gitern);
    fprintf(F, 'Ilosc zakonczonych: %d\n',Gvalidn);
    fprintf(F, 'Srednia roznica miedzy eig(): %d\n\n',Gprecn);
    
    fprintf(F, '<<<Macierz symetryczna z przesunieciami>>>\n');
    fprintf(F, 'Sredni czas wykonania: %d\n',Gtimes);
    fprintf(F, 'Srednia ilosc iteracji: %d\n',Giters);
    fprintf(F, 'Ilosc zakonczonych: %d\n',Gvalids);
    fprintf(F, 'Srednia roznica miedzy eig(): %d\n\n',Gprecs);
    
    fprintf(F, '<<<Wyniki dla funkcji eig()>>>\n');
    fprintf(F, 'Sredni czas wykonania: %d\n',Gteig);
  end
  % macierz niesymetryczna
  fprintf(F, '<<<Macierz niesymetryczna>>>\n\n');
  for i=1:3;
    Gtimes = 0; 
    Giters = 0; 
    Gprecs = 0; 
    Gvalids = 0;
    Gteig = 0;  
    for j=1:30
      A = cmunsim(Z(i)); 
      [S,times,its,valids] = eigshift(A,0.00001,1000);
      eigstart = tic; 
      E = eig(A);
      teig = toc(eigstart);
      Gteig = Gteig + teig;
      if valids == 1
        Gtimes = Gtimes + times; 
        Giters = Giters + its; 
        Gprecs = Gprecs + norm(S-E); 
        Gvalids = Gvalids + 1;
      end
    end
    Gtimes = Gtimes/Gvalids; 
    Giters = Giters/Gvalids;
    Gprecs = Gprecs/Gvalids;
    Gteig = Gteig/30; 
    
    fprintf(F, '<<<Liczba rownan %d >>>\n',Z(i));
    fprintf(F, '<<<Macierz niesymetryczna z przesunieciami>>>\n');
    fprintf(F, 'Sredni czas wykonania: %d\n',Gtimes);
    fprintf(F, 'Srednia ilosc iteracji: %d\n',Giters);
    fprintf(F, 'Ilosc zakonczonych: %d\n',Gvalids);
    fprintf(F, 'Srednia roznica miedzy eig(): %d\n\n',Gprecs);
    
    fprintf(F, '<<<Wyniki dla funkcji eig()>>>\n');
    fprintf(F, 'Sredni czas wykonania: %d\n',Gteig);
  end
  
  fclose(F);
   