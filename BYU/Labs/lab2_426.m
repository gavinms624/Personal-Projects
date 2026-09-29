N = 200; % Spatial
M = 500; % Time
c = 3e8;
alp = 0.95;
% alp = 1.05;
alpha = alp*alp*ones(N, 1);
tau = (alp - 1) / (alp + 1);
eps = 5;
eps2 = 15;

% slab
sb = 85;
se = 115;
alpha(sb:se) = alpha(sb:se) / eps;

sb2 = 115;
se2 = 135;
alpha(sb2:se2) = alpha(sb2:se2)/ eps2;
x3 = [sb2 sb2];
x4 = [se2 se2];

x1 = [sb sb];
x2 = [se se];
y = [-1 1];
xx = 1:N+1;

% Pulse 
pw = 10;
dt = 1;
t = dt*(1:M);
source = exp(-(t-4*pw).^2/(2*pw^2));

figure(1);
% Electric Field
e = zeros(N + 1, 3);
for m = 1:M
    for i = 2:N % Initialize row 3
        e(i, 3) = alpha(i)*(e(i+1, 2) - 2*e(i,2) + e(i-1,2)) + 2*e(i,2) - e(i, 1);
    end
    if m < 8*pw
        e(1, 3) = source(m);
    else
        e(1,3) = e(2,2) + tau*(e(2,3) - e(1,2));
    end
        e(N + 1, 3) = e(N, 2) + tau * (e(N, 3) - e(N+1, 2));
    
    plot(xx,e(:,3),'-',x1,y,'-',x2,y,'-', x3, y, '-', x4, y, '-');
    % plot(xx,e(:,3),'-',x1,y,'-',x2,y,'-');
    axis([0,N,-1.2,1.2]);
    pause(0.001);
    
    e(:, 1) = e(:, 2);
    e(:,2) = e(:,3);
end