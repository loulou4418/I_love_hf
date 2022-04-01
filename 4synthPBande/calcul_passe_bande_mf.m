% ORDRE 4 PASSE-BAS BUTTERWORTH SOIT PASSE-BANDE ORDRE 8

clear all
close all
clc
pkg load symbolic
pkg load control
warning('off','all'); % Pour désactiver le warning " passing floating-point values to sym is dangerous"

syms q p % equivalent ) q = sym('q') et p = sym('p')


fs_moins = 1000;
fs_plus = 20000;
Amax = 3; % en dB
R = 100;


f0=sqrt(fs_moins*fs_plus);
B = (fs_plus - fs_moins)/f0;

N = 8; % Ordre du filtre passe-bande

% Pour montage en impédance (l1, c2, l3, c4, ...)
coeff_normalise_passe_bas = [0.7654 1.8478 1.8478 0.7654];

for n=1:N/2
    if mod(n,2) == 1
        printf("l_%d = %f\n",n, coeff_normalise_passe_bas(n));
    else
        printf("c_%d = %f\n",n, coeff_normalise_passe_bas(n));
    end
end

for n=1:N/2
    coeff_normalise_passe_bande(n,1) =  coeff_normalise_passe_bas(n)/B; % nouveau l
    coeff_normalise_passe_bande(n,2) =  B/coeff_normalise_passe_bas(n); % nouveau c
    
    if mod(n,2) == 1
        printf("l_%d est changé par en série l=%f et c=%f\n",n, coeff_normalise_passe_bande(n,1), coeff_normalise_passe_bande(n,2));
    else
        printf("c_%d est changé par en parallèle c=%f et l=%f\n",n, coeff_normalise_passe_bande(n,1), coeff_normalise_passe_bande(n,2));
    end
end

C_n = 1/(2*pi*f0*R);
L_n = R/(2*pi*f0);
printf("\n Valeur réelles\n");
coeff_normalise_passe_bande
for n=1:N/2

    if mod(n,2) == 1
        coeff_normalise_passe_bande(n,1) *=  L_n; 
        coeff_normalise_passe_bande(n,2) *=  C_n; 
        printf("l_%d est changé par en série l=%e et c=%e\n",n, coeff_normalise_passe_bande(n,1), coeff_normalise_passe_bande(n,2));
    else
        coeff_normalise_passe_bande(n,1) *=  C_n;
        coeff_normalise_passe_bande(n,2) *=  L_n; 
        printf("c_%d est changé par en parallèle c=%f et l=%f\n",n, coeff_normalise_passe_bande(n,1), coeff_normalise_passe_bande(n,2));
    end
end