%Realizacja zadania 1
clear; 
%Generowanie wylresu funkcji aby sprawdzić poprwaność otrzymanych rozwiązań 
% Define values for x, y1, and y2
x  = -5: .1 : 5;
y = 1.4*sin(x)-e.^(x)+6*(x)-0.5; 

% Plot y vs. x (blue, solid)
figure
plot(x, y, 'b','LineWidth', 2)
grid on
% Set the axis limits
axis([-5 5 -150 150])

n=10; 
x1 = -5; 
x2 = -5; 

%wyznaczanie przedziałów izolacji
for j=1:n
  if fun(x1)*fun(x2)<0
    a = x1; 
    b = x2; 
  elseif abs(fun(x1))<abs(fun(x2))
    x1 = x1+1.1*(x1-x2); 
  else
    x2 = x2+1.1*(x2-x1); 
  end
end 
