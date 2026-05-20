% SIMULATION DE LA COUVERTURE CELLULAIRE
clear all;
close all;
clc;
%% PARAMETRES
Pt = 43;              % Puissance d'emission en dBm
f = 900e6;            % Frequence : 900 MHz
c = 3e8;              % Vitesse de la lumiere
%% CREATION DE LA ZONE CELLULAIRE
% Coordonnees de la surface etudiee
x = -2000:50:2000;
y = -2000:50:2000;
[X,Y] = meshgrid(x,y);
%% POSITION DE LA BTS
x_bts = 0;
y_bts = 0;
%% CALCUL DE LA DISTANCE ENTRE BTS ET UTILISATEUR
D = sqrt((X - x_bts).^2 + (Y - y_bts).^2);
% Eviter log(0)
D(D == 0) = 1;
%% CALCUL DE L'ATTENUATION
L = 20*log10(D) + 20*log10(f) - 147.55;
%% CALCUL DE LA PUISSANCE RECUE
Pr = Pt - L;
%% REPRESENTATION DE LA COUVERTURE CELLULAIRE
figure;
surf(X,Y,Pr);
shading interp;
colorbar;
xlabel('Position X (m)');
ylabel('Position Y (m)');
zlabel('Puissance recue (dBm)');
title('Representation de la couverture cellulaire');
%% VUE 2D DE LA COUVERTURE
figure;
contourf(X,Y,Pr,20);
colorbar;
xlabel('Position X (m)');
ylabel('Position Y (m)');
title('Zones de couverture cellulaire');
%% ANALYSE DES NIVEAUX DE SIGNAL
figure;
imagesc(x,y,Pr);
colorbar;
xlabel('Position X (m)');
ylabel('Position Y (m)');
title('Analyse des niveaux de signal');
%% INTERPRETATION
disp('===========================================');
disp('INTERPRETATION');
disp('===========================================');
disp('La puissance du signal est plus forte');
disp('a proximite de la BTS.');
disp('Lorsque la distance augmente,');
disp('le signal devient plus faible.');
disp('Les couleurs chaudes representent');
disp('un bon niveau de signal.');
disp('Les couleurs froides representent');
disp('un signal faible.');
disp('===========================================');
