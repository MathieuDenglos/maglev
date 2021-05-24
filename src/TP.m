clear all
close all

colors = [134/255 235/255 242/255
          243/255 212/255 103/255
          228/255 033/255 131/255
          096/255 228/255 151/255
          102/255 080/255 232/255];

%récupère les données du fichier csv
TP_data = csvread('TP.csv');
    
%ajoute les différentes courbes
plot(TP_data(:,1), TP_data(:,2), 'Color', colors(4,:), 'LineWidth', 3);
hold on
plot(TP_data(:,3), TP_data(:,4), 'Color', colors(2,:), 'LineWidth', 3);
hold on
plot(TP_data(:,5), TP_data(:,6), 'Color', colors(3,:), 'LineWidth', 3);
hold on
plot(TP_data(:,7), TP_data(:,8), 'Color', colors(5,:), 'LineWidth', 3);
hold on
    
%Résolution des différents défauts d'axes
xticks(0:50:500);
xlim([0 500]);
xlabel('vitesse (km/h)', 'FontSize', 16);
yticks(0:50:750);
ylim([0 750]);
ylabel('temps (s)', 'FontSize', 16);
set(gcf,'Position',[100,100,1200,700]);
set(gca, 'FontSize', 14);
legend('trains (Velaro)', 'LIM (ECOBEE)', 'LSM (TR-09)', 'LSM (MLX-01)', 'FontSize', 16);
legend('Location','northeast');