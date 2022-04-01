close all;
clc;
clear all;


%Variables globales
C = 3e8;


%Teflon large
% F1 = 1.43e9;
% F2 = 2.79e9;
% h = 1.58e-3;
% w = 8e-3;
% L = 74.978e-3;

%Epoxy large
F1 = 766.23e6;
F2 = 1.53e9;
h = 1.58e-3;
w = 8e-3;
L = 100e-3;


V = 2*L*(F2 - F1);

epsilon_reff = (C/V)^2;


a = (1 + (10*h)/w)^(-1/2);
epsilon_r = (2*epsilon_reff + a - 1) / (1 + a)






