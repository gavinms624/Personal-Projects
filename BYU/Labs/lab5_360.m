c = 3e8;
u = (2/3)*c;
f = (0.1:0.1:30)*1e6;
lambda = u./f;
beta = 2*pi./lambda;
l = 1;

% Zin of terminated line
Zo1 = 50;
ZL1 = 25;
l1 = l;
Zin1 = Zo1 .* (ZL1 + 1j.*Zo1.*tan(beta * l1))./(Zo1 + 1j.*ZL1.*tan(beta*l1));

% Zin of open stub
Zo2 = 50;
ZL2 = 25;
l2 = l;
Zin2 = -1j.*Zo2.*cot(beta*l2);

% Calculate the right end of T1
Zend = (1./Zin1 + 1./Zin2).^-1;

% Calculate the input impedance 
l_long = 12.55;
Zo3 = 50;
Zin = Zo3 .* (Zend + 1j.*Zo3.*tan(beta * l_long))./(Zo3 + 1j.*Zend.*tan(beta*l_long));
idx = find(f == 19.6e6);
ans = Zin(idx)
zL = Zend(idx)/Zo3
elength = l/lambda(idx)

% Reflection Coefficient
Gamma = (Zin - Zo3)./(Zin + Zo3);
plot(f/1e6,20*log10(abs(Gamma)))
mean(20*log10(abs(Gamma)))
grid on;
ylim([-50 0]);
title("Reflection Coefficient")
xlabel("Frequency (MHz)")
ylabel("Gamma-in Magnitude (dB)")
