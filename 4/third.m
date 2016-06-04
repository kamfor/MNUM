%Realizacja podpunktu 3 metoda metoda RK4 zmienny krok
clear; 
zero=[8 7; 0 0.4; 5 0; 0.01 0.001]; %wektor kroków
step = 0.01; %krok

for k = 1:4
    
    data = rk4dynamic(zero(k,:),20,step);
    
    h = figure('visible','off');
    plot(data(:,1),data(:,2),'-o');
    l = size(data,1);
    hold on;
    xl = get(gca,'xlim');
    yl = get(gca,'ylim');
    zl = get(gca,'zlim');
    %scatter3(data(:,1),data(:,2),repmat(zl(1),l,1),'.');
    %scatter3(data(:,1),repmat(yl(2),l,1),data(:,3),'.');
    %scatter3(repmat(xl(2),l,1),data(:,2),data(:,3),'.');
    grid on; 
    name =  ['metoda RK4 zmienny krok podpunkt:' num2str(k)];
    title(name);
    saveas(h,name,'jpg'); 
end