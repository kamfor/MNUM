%Realizacja podpunktu 2 metoda metoda predyktor-korektor Adamsa 4-rzedu
clear; 
zero=[8 7; 0 0.4; 5 0; 0.01 0.001]; %wektor kroków
step = 0.01; %krok

for k = 1:4
    
    data = rk4static(zero(k,:),20,step);
    
    h = figure;
    %('visible','off');
    plot3(data(:,1),data(:,2),data(:,3));
    l = size(data,1);
    hold on;
    xl = get(gca,'xlim');
    yl = get(gca,'ylim');
    zl = get(gca,'zlim');
    plot3(data(:,1),data(:,2),repmat(zl(1),l,1));
    plot3(data(:,1),repmat(yl(2),l,1),data(:,3));
    plot3(repmat(xl(2),l,1),data(:,2),data(:,3));
    grid on; 
    name =  ['metoda Adamsa krok:' num2str(step) ' podpunkt:' num2str(k)];
    title(name);
    saveas(h,name,'jpg'); 
end