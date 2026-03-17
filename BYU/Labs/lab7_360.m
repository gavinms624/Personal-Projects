c = 3e8;
min_freq = 20e6;
max_freq = 40e6;
zg = 50;
z01 = 50;
z02 = 70.7;
zL = 100;
E1_20 = 67;
E2_20 = 90;
l1 = (c/min_freq)*E1_20;
l2 = (c/min_freq)*E1_20;
f = min_freq; % change for 2nd test
E1 = l1*c/f;
E2 = l2*c/f;


gamma_L = (zL - z02)/(zL + z02)

gamma_in_2 = gamma_L * exp(1j*2*pi*E2);
gamma_in = gamma_in_2 * exp(1j*2*pi*E1);
