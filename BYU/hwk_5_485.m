beta = 1;
span = 6;
sps = 16; % samples per symbol
N = 200;

p = rcosdesign(beta, span, sps, 'sqrt');
a = 2*randi([0 1], 1, N) - 1;

figure;
plot(p);

x = upfirdn(a, p, sps, 1);
eyediagram(x, 2*sps);