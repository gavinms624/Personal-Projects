tiledlayout;
u = 4*pi*10^-7;
eps = 8.85*10^-12;
N = 30;
d = 0.02;
dx = d/(N-1);
% n = 4;
x = (0:N-1)*dx;
A = (1/dx^2)*(-2*diag(ones(N-2,1)) + diag(ones(N-3,1), 1) + diag(ones(N-3,1), -1));
[V, lambda] = eig(A);
% Cutoff frequencies: sort in ascending order
[kc, I] = sort(-diag(lambda));
fc = 3e8*sqrt(kc)/(2*pi);
% Sort eigenvectors in order of eigenvalues
Vs = V(:,I);
% If you want to plot the nth eigenvector:
figure(1); clf;
for n = 1:9
    nexttile();
    plot(x, [0; real(Vs(:,n)); 0]);
end

figure(2);
Ni = (1:(N-2));
fca = Ni*3e8/(2*d);
plot(Ni, fc/1e9, 'ko', Ni, fca/1e9, 'ks');
xlabel('Mode index');
ylabel('Cutoff frequency (GHz)');
legend('Numerical', 'Analytical', 'Location', 'northwest');
grid on;