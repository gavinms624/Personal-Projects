n = 1.6;
theta_i = 30;
eta_2 = 377;
eta_1 = 377/n;
theta_t = asind(n*sind(theta_i));


gamma = (eta_2/cosd(theta_t) - eta_1/cosd(theta_i)) / (eta_2/cosd(theta_t) + eta_1/cosd(theta_i));
tau = 2*(eta_2/cosd(theta_t)) / (eta_2/cosd(theta_t) + eta_1/cosd(theta_i));


display(gamma);
display(tau);