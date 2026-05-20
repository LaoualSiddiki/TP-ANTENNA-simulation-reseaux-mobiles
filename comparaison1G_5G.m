clc;
clear;
close all;

% Distance (km)
d = linspace(0.1, 20, 200); % de 100 m à 20 km

% Fréquences (Hz)
f_1G = 450e6;
f_2G = 900e6;
f_3G = 2100e6;
f_4G = 2600e6;
f_5G = 3500e6;

% Conversion en MHz
f1 = f_1G/1e6;
f2 = f_2G/1e6;
f3 = f_3G/1e6;
f4 = f_4G/1e6;
f5 = f_5G/1e6;

% Free Space Path Loss (FSPL)
PL_1G = 20*log10(d) + 20*log10(f1) + 32.44;
PL_2G = 20*log10(d) + 20*log10(f2) + 32.44;
PL_3G = 20*log10(d) + 20*log10(f3) + 32.44;
PL_4G = 20*log10(d) + 20*log10(f4) + 32.44;
PL_5G = 20*log10(d) + 20*log10(f5) + 32.44;

% Tracé des courbes
figure;

plot(d, PL_1G, 'LineWidth', 2); hold on;
plot(d, PL_2G, 'LineWidth', 2);
plot(d, PL_3G, 'LineWidth', 2);
plot(d, PL_4G, 'LineWidth', 2);
plot(d, PL_5G, 'LineWidth', 2);

grid on;

title('Comparaison des pertes (1G à 5G) en fonction de la distance');
xlabel('Distance (km)');
ylabel('Path Loss (dB)');

legend('1G (450 MHz)','2G (900 MHz)','3G (2100 MHz)','4G (2600 MHz)','5G (3500 MHz)');