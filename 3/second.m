%skrypt generujacy wyniki do zadania 2
%Generowanie wykresu funkcji aby sprawdzic poprwanosc otrzymanych rozwiazan 
clear;
x  = -5: .1 : 2;
plot(x, df(x,0), 'b','LineWidth', 2)
grid on
axis([-5 2 -100 50])

for i = -5:3
    result(:,i+6) = muller(i,40);
end

disp(result); 




