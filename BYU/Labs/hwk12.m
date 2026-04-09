phi = 0:0.01:2*pi;
F = (sin(phi)).^2.*(sin(3.*phi)).^2;
polar(phi, F)