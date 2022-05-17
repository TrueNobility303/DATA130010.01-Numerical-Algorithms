function [u,history] = RK4(f,n,T,u)
h = T / n;
t = 0;
history = zeros(n,1);
for i = 1:n
    k1 = f(t,u);
    k2 = f(t + 1/2* h, u + 1/2*h * k1);
    k3 = f(t + 1/2* h, u + 1/2*h * k2);
    k4 = f(t + h, u + h * k3);
    u = u + h/6 * (k1 + 2*k2 + 2*k3+ k4);
    
    t = t + h;
    history(i) = u;
end
end