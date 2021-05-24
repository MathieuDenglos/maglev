clear all
close all

colors = [134/255 235/255 242/255
          243/255 212/255 103/255
          228/255 033/255 131/255
          096/255 228/255 151/255
          102/255 080/255 232/255];

%r�cup�re les donn�es du fichier csv
EI_data = csvread('EI.csv');
figure(1);

%ajoute les diff�rentes courbes
plot(EI_data(:,5), EI_data(:,6), '+', 'Color', colors(4,:), 'LineWidth', 5);
hold on
plot(EI_data(:,1), EI_data(:,2), 'o', 'Color', colors(2,:), 'LineWidth', 5);
hold on
plot(EI_data(:,3), EI_data(:,4), 'd', 'Color', colors(3,:), 'LineWidth', 5);
hold on

plot(EI_data(:,7), EI_data(:,8), 'Color', colors(4,:), 'LineWidth', 3);
hold on

%R�solution des diff�rents d�fauts d'axes
xticks(0:50:550);
yticks(0:10:140);
xlim([0 550]);
ylim([0 120]);
legend('Location','southeast');
set(gcf,'Position',[100,100,1200,700]);
set(gca, 'FontSize', 14);

%ajoute les l�gendes
xlabel('vitesse (km/h)', 'FontSize', 16);
ylabel('Energy Intensity (Wh/m�-km)', 'FontSize', 16);
legend('trains', 'LIM', 'LSM', 'FontSize', 16);