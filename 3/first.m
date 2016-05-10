%Realizacja zadania 1
clear; 
%Generowanie wykresu funkcji aby sprawdzic poprwanosc otrzymanych rozwiazan 
x  = -5: .1 : 5;

% Plot y vs. x (blue, solid)
%figure
%plot(x, fun(x), 'b','LineWidth', 2)
%grid on
%axis([-5 5 -150 150])

n=1000; 
x1 = -5; 
x2 = 5; 

%wyznaczanie przedzialow izolacji
for j=1:n
  if fun(x1)*fun(x2)<0
    a = x1;
    b = x2;
    t = bisection('fun',a,b,100)
    m = secant('fun',a,b,100)
    g = newton('fun',a,100)
    x1 = x2;
  elseif abs(fun(x1))<abs(fun(x2))
    x1 = x1+5*(x1-x2);
  else
    x2 = x2+5*(x2-x1);
  end
  if(x1>5)
    break; %wyjscie z petli po przekroczeniu przedzialu
  end
end
