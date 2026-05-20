% Simulation du Handover entre deux antennes BTS
% Point de basculement au milieu (sans hystérésis)

clear all;
close all;
clc;

%% Configuration des paramètres

distance_inter_bts = 2000;      % Distance entre BTS A et BTS B (m)
d = 0:10:distance_inter_bts;    % Position du mobile

P_tx = 43;                      % Puissance d'émission (dBm)
f = 900e6;                      % Fréquence : 900 MHz
c = 3e8;                        % Vitesse de la lumière

%% Calcul de la longueur d'onde

lambda = c / f;

%% Modèle Free Space Path Loss (FSPL)

% -------- Signal reçu depuis BTS A --------
L_A = 20*log10(d + 1) + 20*log10(f) - 147.55;
RSSI_A = P_tx - L_A;

% -------- Signal reçu depuis BTS B --------
L_B = 20*log10(distance_inter_bts - d + 1) ...
    + 20*log10(f) - 147.55;

RSSI_B = P_tx - L_B;

%% Logique du Handover

% Hystérésis = 0
% => Le handover se produit lorsque les deux signaux sont égaux

Hysteresis = 0;

point_handover = 0;

for i = 1:length(d)

    if RSSI_B(i) >= RSSI_A(i) + Hysteresis

        point_handover = d(i);
        break;

    end

end

%% Affichage du point de handover

disp('======================================');
disp(['Point de Handover : ', num2str(point_handover), ' m']);
disp('======================================');

%% Tracé des courbes

figure;

plot(d, RSSI_A, 'b', 'LineWidth', 2);
hold on;

plot(d, RSSI_B, 'r', 'LineWidth', 2);

grid on;

%% Ligne verticale du handover

xline(point_handover, '--k', ...
    ['Handover à ', num2str(point_handover), ' m'], ...
    'LabelVerticalAlignment', 'bottom');

%% Mise en forme du graphique

xlabel('Distance du mobile par rapport à la BTS A (mètres)');

ylabel('Puissance reçue RSSI (dBm)');

title('Simulation du mécanisme de Handover');

legend('Signal BTS A', ...
       'Signal BTS B', ...
       'Point de basculement');
