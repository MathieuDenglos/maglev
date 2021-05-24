clear all
close all

colors = [134/255 235/255 242/255
          243/255 212/255 103/255
          228/255 033/255 131/255
          096/255 228/255 151/255
          102/255 080/255 232/255];

%récupère les données du fichier csv
RF_data = csvread('RF.csv');
RF_size = size(RF_data);
figure(1);

%ajoute les différentes courbes
for i = 1:1:RF_size(2)/2
    plot(RF_data(:,2*i-1), RF_data(:,2*i), 'Color', colors(i,:), 'LineWidth', 3);
    hold on
end

%ajouts des deux dates clés du développement des technologies maglev
plot([1908, 1908], [0, 70000], 'Color', colors(5,:), 'LineStyle', '--', 'LineWidth', 2);
hold on
plot([1940, 1940], [0, 70000], 'Color', colors(5,:), 'LineStyle', ':', 'LineWidth', 2);
hold on

%Résolution des différents défauts d'axes
xtickformat('%.0f')
xticks(1860:20:2000);
xlim([1860 2000]);
ylim([0 70000]);
legend('Location','northwest');
set(gcf,'Position',[100,100,1200,700]);
ax = gca;
ax.YAxis.Exponent = 0;
set(gca, 'FontSize', 14);

%ajoute les légendes
xlabel('année', 'FontSize', 16);
ylabel('longueur du réseau (km)', 'FontSize', 16);
legend('France','Allemagne','Japon','Chine','premier brevet','premiers essais', 'FontSize', 16);