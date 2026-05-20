% Propagation des ondes
clear all;
close all;
clc;

%% PARAMETRES
Pt = 43;              % Puissance d'emission en dBm
f = 900e6;            % Frequence : 900 MHz
c = 3e8;              % Vitesse de la lumiere

% Distance entre le mobile et l'antenne
d = 1:10:5000;        % Distance de 1 m a 5000 m
%% CALCUL DE LA PERTE DE PROPAGATION
% Formule du Free Space Path Loss (FSPL)
L = 20*log10(d) + 20*log10(f) - 147.55;
%% CALCUL DE LA PUISSANCE RECUE
Pr = Pt - L;
%% AFFICHAGE DES RESULTATS
figure;
plot(d, Pr, 'b', 'LineWidth', 2);
grid on;
xlabel('Distance entre le mobile et la BTS (m)');
ylabel('Puissance recue Pr (dBm)');
title('Influence de la distance sur la puissance du signal');
legend('Signal recu');
%% DEUXIEME GRAPHIQUE : ATTENUATION
figure;
plot(d, L, 'r', 'LineWidth', 2);
grid on;
xlabel('Distance entre le mobile et la BTS (m)');
ylabel('Attenuation L (dB)');
title('Attenuation du signal en fonction de la distance');
legend('Perte de propagation');
%% INTERPRETATION SIMPLE
disp('===========================================');
disp('INTERPRETATION');
disp('===========================================');
disp('Lorsque la distance augmente :');
disp('- L attenuation du signal augmente');
disp('- La puissance recue diminue');
disp('- Le signal devient plus faible');
disp('===========================================');
