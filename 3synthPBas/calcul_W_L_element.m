% Calcul des W et l pour les bobines et les condensateurs du filtre

clear all;
close all;
clc;

h = 1.58; % Epaisseur du cuivre en mm




epsilon_r = 2.61; % Pour le teflon (calculé à partir du teflon large)
% epsilon_reff = 3; % pour l'epoxy


% ATTENTION Les calculs suivants sont valables pour w/h < 3.3
w = 0.5; % largeur de piste les condensateurs en mm 



% a = (1 + (10*h)/w)^(-1/2);
% epsilon_r = (2*epsilon_reff + a - 1) / (1 + a);

a = h/w;
b = (epsilon_r - 1) / (epsilon_r + 1);
c = log(4*a + sqrt(16 * a^2 + 2)) - 0.5 * b * (log((pi/2) + (1/epsilon_r)* log(4/pi)));
Z_L = (119.19 / sqrt(2*(epsilon_r + 1))) * c
epsilon_reff = (epsilon_r + 1) / 2 + ((epsilon_r - 1) / 2) * ((1 + ((10 * h)/w)) ^ (-1/2))


% ATTENTION Les calculs suivants sont valables pour w/h < 3.3
w = 10;
% a = (1 + (10*h)/w)^(-1/2);
% epsilon_r = (2*epsilon_reff + a - 1) / (1 + a);

a = w / (2*h);
b = log((pi * e)/2) + log(a + 0.94) ;
c = a + log(4)/pi + log((e * pi^2) / 16) / (2*pi) * ((epsilon_r - 1) / epsilon_r) + (epsilon_r + 1) / (2 * pi * epsilon_r) * b;
Z_C = ((119.19 * pi) / (2*sqrt(epsilon_r))) * c^(-1)
epsilon_reff = (epsilon_r + 1) / 2 + ((epsilon_r - 1) / 2) * ((1 + ((10 * h)/w)) ^ (-1/2))

