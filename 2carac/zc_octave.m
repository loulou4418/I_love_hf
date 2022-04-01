Adb = -4.205;
A = 10^(Adb/20) ;

phaseDeg = 0;%164;
phaseRad = 180 * phaseDeg / pi;

Zo = 50;

S11 = A * exp(i*phaseDeg);

Zc = Zo * sqrt((1-S11) / (1+S11));