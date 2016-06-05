%Realizacja podpunktu 1 metoda RK4 ze stalym krokiem
clear; 
zero=[8 7; 0 0.4; 5 0; 0.01 0.001]; %wektor stanow poczatkowych
step = 0.04; %krok

for k = 1:1
    
    data = rk4static(zero(k,:),20,step);
    %error = rk4static(zero(k,:),20,step/2);
    %for i=1:(20/step)
        %error(i,1:2) = abs(data(i,1:2)-error(2*i,1:2));
    %end
    %n = norm(error);
    %disp(n); 
    h = figure;%('visible','off');
    plot(data(:,1),data(:,2),'-o');
    l = size(data,1);
    hold on;
    xl = get(gca,'xlim');
    yl = get(gca,'ylim');
    zl = get(gca,'zlim');
    %plot3(data(:,1),data(:,2),repmat(zl(1),l,1),'-');
    %plot3(data(:,1),repmat(yl(2),l,1),data(:,3),'-');
    %plot3(repmat(xl(2),l,1),data(:,2),data(:,3),'-');
    grid on;
    name =  ['metoda RK4 krok:' num2str(step) ' podpunkt:' num2str(k)]; 
    title(name);
    saveas(h,name,'jpg');
end