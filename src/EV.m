%Ce fichier traces 3 courbes : EVtrain.eps EVLIM.eps EVLSM.eps
clear all
close all

colors = [134/255 235/255 242/255
          243/255 212/255 103/255
          228/255 033/255 131/255
          096/255 228/255 151/255
          102/255 080/255 232/255];

%récupère les données des fichiers csv
EVtrain_data = csvread('EVtrain.csv');
EVtrain_size = size(EVtrain_data);
EVLIM_data = csvread('EVLIM.csv');
EVLIM_size = size(EVLIM_data);
EVLSM_data = csvread('EVLSM.csv');
EVLSM_size = size(EVLSM_data);



%Diagramme EV train
figure(1);

%cherche pour la courbe 3% le point à partir duquel la résistance à l'avancement est supérieur à l'équipuissance
facteur3 = 1;
while(facteur3 < EVtrain_size(1) && EVtrain_data(facteur3,2) > EVtrain_data(facteur3,6))
    facteur3 = facteur3 + 1;
end

%ajoute les différentes courbes
plot(EVtrain_data(:,3), EVtrain_data(:,4), 'Color', colors(4,:), 'LineWidth', 3);
hold on
plot(EVtrain_data(1:facteur3 ,5), EVtrain_data(1:facteur3 ,6), 'Color', colors(3,:), 'LineWidth', 3);
hold on
plot(EVtrain_data(:,1), EVtrain_data(:,2), 'Color', colors(1,:), 'LineWidth', 3);
hold on
if(facteur3 < EVtrain_size(1))
    plot(EVtrain_data(facteur3:EVtrain_size(1) ,5), EVtrain_data(facteur3:EVtrain_size(1) ,6), '--', 'Color', colors(3,:), 'LineWidth', 3);
    hold on
end

%Résolution des différents défauts d'axes
xticks(0:50:350);
yticks(0:50:300);
xlim([0 350]);
ylim([0 300]);
legend('Location','northeast');
set(gcf,'Position',[100,100,1200,450]);
set(gca, 'FontSize', 14);

%ajoute les légendes
xlabel('vitesse (km/h)', 'FontSize', 16);
ylabel('Effort de traction (kN)', 'FontSize', 16);
legend('sans pente (0‰)', 'pente maximale (30‰)', 'FontSize', 16);



%Diagramme EV LIM
figure(2);

%cherche pour la courbe 7% le point à partir duquel la résistance à l'avancement est supérieur à l'équipuissance
facteur7 = 201;
while(round((facteur7-200)*2.23) < EVLIM_size(1) && EVLIM_data(round((facteur7-200)*2.23),2) > EVLIM_data(facteur7,8))
    facteur7 = facteur7 + 1;
end

%ajoute les différentes courbes
plot(EVLIM_data(:,3), EVLIM_data(:,4), 'Color', colors(4,:), 'LineWidth', 3);
hold on
plot(EVLIM_data(1:facteur7 ,7), EVLIM_data(1:facteur7 ,8), 'Color', colors(3,:), 'LineWidth', 3);
hold on
plot(EVLIM_data(: ,5), EVLIM_data(: ,6), '--', 'Color', colors(2,:), 'LineWidth', 1);
hold on
plot(EVLIM_data(:,1), EVLIM_data(:,2), 'Color', colors(1,:), 'LineWidth', 3);
hold on
if(facteur7 < EVLIM_size(1))
    plot(EVLIM_data(facteur7:EVLIM_size(1) ,7), EVLIM_data(facteur7:EVLIM_size(1) ,8), '--', 'Color', colors(3,:), 'LineWidth', 3);
    hold on
end

%Résolution des différents défauts d'axes
xticks(0:10:110);
yticks(0:10:40);
xlim([0 110]);
ylim([0 40]);
legend('Location','northeast');
set(gcf,'Position',[100,100,1200,450]);
set(gca, 'FontSize', 14);

%ajoute les légendes
xlabel('vitesse (km/h)', 'FontSize', 16);
ylabel('Effort de traction (kN)', 'FontSize', 16);
legend('sans pente (0‰)', 'pente maximale (70‰)', 'pente maximale train (30‰)', 'FontSize', 16);



%Diagramme EV LSM
figure(3);

%cherche pour la courbe 10% le point à partir duquel la résistance à l'avancement est supérieur à l'équipuissance
facteur10 = 1;
while(facteur10 < EVLSM_size(1) && EVLSM_data(facteur10,2) > EVLSM_data(facteur10,8))
    facteur10 = facteur10 + 1;
end

%ajoute les différentes courbes
plot(EVLSM_data(:,3), EVLSM_data(:,4), 'Color', colors(4,:), 'LineWidth', 3);
hold on
plot(EVLSM_data(1:facteur10 ,7), EVLSM_data(1:facteur10 ,8), 'Color', colors(3,:), 'LineWidth', 3);
hold on
plot(EVLSM_data(: ,5), EVLSM_data(: ,6), '--', 'Color', colors(2,:), 'LineWidth', 1);
hold on
plot(EVLSM_data(:,1), EVLSM_data(:,2), 'Color', colors(1,:), 'LineWidth', 3);
hold on
if(facteur10 < EVLSM_size(1))
    plot(EVLSM_data(facteur10:EVLSM_size(1) ,7), EVLSM_data(facteur10:EVLSM_size(1) ,8), '--', 'Color', colors(3,:), 'LineWidth', 3);
    hold on
end


%Résolution des différents défauts d'axes
xticks(0:50:400);
yticks(0:20:80);
xlim([0 400]);
ylim([0 80]);
legend('Location','northeast');
set(gcf,'Position',[100,100,1200,450]);
set(gca, 'FontSize', 14);

%ajoute les légendes
xlabel('vitesse (km/h)', 'FontSize', 16);
ylabel('Effort de traction (kN)', 'FontSize', 16);
legend('sans pente (0‰)', 'pente maximale (100‰)', 'pente maximale train (30‰)', 'FontSize', 16);