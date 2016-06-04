%Realizacja podpunktu 2 metoda metoda predyktor-korektor Adamsa 4-rzedu
clear; 
zero=[8 7; 0 0.4; 5 0; 0.01 0.001]; %wektor stanow poczatkowych
step = 0.5; %krok

for k = 1:4
    
    data = rk4static(zero(k,:),20,step);
    
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
    name =  ['metoda Adamsa krok:' num2str(step) ' podpunkt:' num2str(k)];
    title(name);
    saveas(h,name,'jpg'); 
end