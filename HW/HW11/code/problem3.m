
% u = [X,C,S]
u0 = [1,100,0]';
n = 10000;
T = 100;
[u, history] = RK4(n,T,u0);
plot(history);
legend('X','C','S');

function y = f(u)
    mu_max = 10;
    K = 10;
    Ks = 10;
    kd = 0.1;
    ke = 0.1;
    kh = 0.1;
    y = zeros(3,1);
    y(1) = mu_max * (1- u(1)/K) * (u(3)/ (Ks + u(3)))* u(1) - kd * u(1) - ke * u(1);
    y(2) = kd * u(1) - kh * u(2);
    y(3) = ke * u(1) + kh * u(2) - mu_max * (1- u(1)/K) * (u(3)/ (Ks + u(3)))* u(1);
end

function [u,history] = RK4(n,T,u)
h = T / n;
t = 0;
history = zeros(n,3);
for i = 1:n
    k1 = f(u);
    k2 = f(u + 1/2*h * k1);
    k3 = f(u + 1/2*h * k2);
    k4 = f(u + h * k3);
    u = u + h/6 * (k1 + 2*k2 + 2*k3+ k4);
    t = t + h;
    history(i,:) = u;
end
end
