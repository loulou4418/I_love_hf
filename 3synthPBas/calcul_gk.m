clear all;
close all;
clc;

% Calcul des coefficient g_k normalisé pour un passe-bas avec une réponse de Tchebychiev
% L'atténuation maximal dans la bande passante sera de 0.1 dB

Amax = 0.1; % en dB
n = 5; % ordre du filtre
for k=1:n
    a_k(k)=sin(((2*k - 1)* pi)/(2*n));
end

Beta = log(coth(Amax/17.37));
Gamma = sinh(Beta/(2*n));

for k=1:n   
    b_k(k) = Gamma^2 + (sin((k*pi)/n))^2;
end


g_k(1) = (2*a_k(1))/Gamma;
for k=2:n
    g_k(k) = (4 * a_k(k-1) * a_k(k)) / (b_k(k-1) * g_k(k-1));
end
g_k % Affichage des coefficient

fp = 2e9; % appelé fc dans le poly de TP
R = 50;
Cdenorm = 1 / (2 * pi * fp * R);
Ldenorm =  R / (2 * pi * fp);
for k=1:n
    if mod(k,2) ==0
        C = g_k(k) * Cdenorm;
        printf("C%d =%e\n",k, C);
    else
        L = g_k(k) * Ldenorm;
        printf("L%d =%e\n",k, L);
    end
end

