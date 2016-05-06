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
axis([-5 5 -1.5 1.5])
