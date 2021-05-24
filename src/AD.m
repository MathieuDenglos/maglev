clear all
close all

colors = [134/255 235/255 242/255
          243/255 212/255 103/255
          228/255 033/255 131/255
          096/255 228/255 151/255
          102/255 080/255 232/255];

%récupère les données du fichier csv
Atv_data = csvread('Atv.csv');
Adv_data = csvread('Adv.csv');
Dtv_data = csvread('Dtv.csv');
Ddv_data = csvread('Ddv.csv');

for i=1:4
    
    figure(i);
    switch i
        case 1
            temp = Atv_data;
        case 2
            temp = Dtv_data;
        case 3
            temp = Adv_data;
        case 4
            temp = Ddv_data; 
    end
    
    %ajoute les différentes courbes
    plot(temp(:,1), temp(:,2), 'Color', colors(4,:), 'LineWidth', 3);
    hold on
    plot(temp(:,3), temp(:,4), 'Color', colors(2,:), 'LineWidth', 3);
    hold on
    plot(temp(:,5), temp(:,6), 'Color', colors(3,:), 'LineWidth', 3);
    hold on
    plot(temp(:,7), temp(:,8), 'Color', colors(5,:), 'LineWidth', 3);
    hold on
    
    %Résolution des différents défauts d'axes
    legend('Location','northeast');
    set(gcf,'Position',[100,100,600,700]);
    set(gca, 'FontSize', 14);
    legend('trains (Velaro)', 'LIM (ECOBEE)', 'LSM (TR-09)', 'LSM (MLX-01)', 'FontSize', 16);
    yticks(0:50:500);
    ylim([0 500]);
    ylabel('vitesse (km/h)', 'FontSize', 16);
    
    if(i <= 2)
        xticks(0:50:400);
        xlim([0 400]);
        xlabel('temps (s)', 'FontSize', 16);
    else
        xticks(0:5:25);
        xlim([0 25]);
        xlabel('distance (km)', 'FontSize', 16); 
    end  
end


