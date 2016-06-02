%Realizacja zadania 1

clear; 

%wektor kroków
zero=[8 7; 0 0.4; 5 0; 0.01 0.001]; 
step = 1; 

for k = 1:4
    
    data = rk4static(zero(k,:),20,step);
    error = rk4static(zero(k,:),20,step/2);
    for i=1:(20/step)
        error(i,1:2) = abs(data(i,1:2)-error(2*i,1:2));
    end
    n = norm(error);
    disp(n); 
    h = figure('visible','off');
    plot3(data(:,1),data(:,2),data(:,3));
    l = size(data,1);
    hold on;
    xl = get(gca,'xlim');
    yl = get(gca,'ylim');
    plot3(data(:,1),repmat(yl(2),l,1),data(:,3));
    plot3(repmat(xl(2),l,1),data(:,2),data(:,3));
    grid on;
    name =  ['krok_' num2str(step) num2str(k)]; 
    saveas(h,name,'jpg');
end