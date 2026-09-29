%% Part 1
eps_0 = 8.85e-12;
mu_0 = pi*4e-7;
freq = 300e6;

dx = 0.01;
dy = 0.01;
x = 0:dx:5;
y = 0:dy:5;

[X, Y] = meshgrid(x, y);

figure(1)
f = cos(X);
% f = X.^2 + Y.^2;
imagesc(x,y,f)
set(gca,'ydir','normal')
xlabel('x')
ylabel('y')

%% Part 2b
eps_0 = 8.85e-12;
mu_0 = pi*4e-7;
freq = 300e6;

dx = 0.01;
dy = 0.01;
x = 0:dx:5;
y = 0:dy:5;

[X, Y] = meshgrid(x, y);



figure(1)
f = cos(-2*pi.*X);
imagesc(x,y,f)
set(gca,'ydir','normal')
xlabel('x')
ylabel('y')
colorbar();

%% Part 2c
eps_0 = 8.85e-12;
mu_0 = pi*4e-7;
freq = 300e6;

dx = 0.01;
dy = 0.01;
x = 0:dx:5;
y = 0:dy:5;

[X, Y] = meshgrid(x, y);

figure(1)
% dt = 4.6296e-11;
dt = (5*pi / 180) / (freq * 2 * pi);


for n = 1:100
    t = (n-1)*dt;
    Ez = cos(2*pi*freq*t - 2*pi.*X);
    figure(1)
    imagesc(x,y,Ez)
    set(gca,'ydir','normal')
    xlabel('x')
    ylabel('y')
    M(n) = getframe;
end

%% Part 3

eps_0 = 8.85e-12;
mu_0 = pi*4e-7;
freq = 300e6;
sigma = 0.01;

dx = 0.01;
dy = 0.01;
x = 0:dx:5;
y = 0:dy:5;

[X, Y] = meshgrid(x, y);


figure(1)
f = exp(-1.81.*X) .* cos(-2*pi.*X);
imagesc(x,y,f)
set(gca,'ydir','normal')
xlabel('x')
ylabel('y')
colorbar();

%% Part 4

eps_0 = 8.85e-12;
mu_0 = pi*4e-7;
freq = 300e6;
sigma = 0.01;

dx = 0.01;
dy = 0.01;
x = 0:dx:5;
y = 0:dy:5;

[X, Y] = meshgrid(x, y);


figure(1)
phi = 60 * pi/180;
f = cos(-2*pi*(X.*cos(phi) + Y.*sin(phi)));
imagesc(x,y,f)
set(gca,'ydir','normal')
xlabel('x')
ylabel('y')
colorbar();


%% Part 5
eps_0 = 8.85e-12;
mu_0 = pi*4e-7;
freq = 300e6;
sigma = 0.01;
phi = 60 * pi/180;
k_0 = 2*pi;

dx = 0.01;
dy = 0.01;
x = 0:dx:5;
y = -5:dy:5;
xn = -5:dx:(-dx);
[X, Y] = meshgrid(x, y);
[Xn, Yn] = meshgrid(xn, y);

eps_r2 = 2;
phi_t = asin((1/sqrt(eps_r2)) * sin(phi));
gamma = (cos(phi) - sqrt(eps_r2)*cos(phi_t)) / (cos(phi) + sqrt(eps_r2)*cos(phi_t));
T = 1 + gamma;

k_2 = sqrt(eps_r2)*k_0;


E1 = cos(k_0*Xn*cos(phi) + k_0*Yn*sin(phi)) + gamma * (cos(k_0*Xn*cos(phi) - k_0*Yn*sin(phi)));
E2 = T * cos(X*cos(phi_t)*k_2 + Y*sin(phi_t)*k_2);


figure(1)
imagesc([xn, x],y,[E1, E2])
set(gca,'ydir','normal')
xlabel('x')
ylabel('y')
colorbar();