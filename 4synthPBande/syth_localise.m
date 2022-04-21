clear all;

g1 =  1.0315;
g2 = 1.1474;
g3 = 1.0315;

R = 50;
f0 = 1.9843*10^9;
B = (2.250 - 1.75)/1.984;

nano = 10^(9); %nano
%pico = 10^(-12); %pico

% admitance

##C1 = g1/B;
##L1 = B/g1;
##L2 = g2/B;
##C2 = B/g2;
##L3 = B/g3;
##C3 = g3/B;

% impédance
L1 = g1/B;
C1 = B/g1;
L2 = B/g2;
C2 = g2/B;
L3 = g3/B;
C3 = B/g3;

L1 = L1 *(R/(2*pi*f0));
L2 = L2 * (R/(2*pi*f0));
L3 = L3 * (R/(2*pi*f0));
C1 = C1/(2*pi*R*f0);
C2 = C2/(2*pi*R*f0);
C3 = C3/(2*pi*R*f0);

% fréquence centrale techno microruban
% moyenne arithmétique
f0_ruban = 2e9;

Zc_serie = 4 * f0_ruban * L1
Zc_parallele = 1/(4 * f0_ruban * C2)

L1 = L1*nano
L2 = L2*nano
L3 = L3*nano
C1 = C1*nano
C2 = C2*nano
C3 = C3*nano
