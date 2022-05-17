
% orginal function
g = @(t) exp(t) + log(t+1);

% u'(t) = exp(t) + 1/(t+1) = u(t) - log(t+1) + 1/(t+1);

% derivative 
f = @(t,u) u - log(t+1) + 1/(t+1);

u0 = 1;
n = 1000;
T = 1;
u_real = g(T);
u_hat = RK4(f,n,T,u0);

log_err = [];
log_h = [];
for n = [50,100,200,400]
    h = T/n;
    u_hat = RK4(f,n,T,u0);
    err = abs(u_hat - u_real);
    log_err  = [log_err, log(err)];
    log_h   =  [log_h, log(h)];
end

%regression
x = log_h';
y = log_err';

Sxx = (x - mean(x))' * (x - mean(x));
Sxy = (x - mean(x))' * (y - mean(y));
corr = Sxy / Sxx; 
disp(corr);
plot(x,y);
xlabel('log(h)');
ylabel('log(e)');

function [u] = RK4(f,n,T,u)

h = T / n;
t = 0;
for i = 1:n
    k1 = f(t,u);
    k2 = f(t + 1/2* h, u + 1/2*h * k1);
    k3 = f(t + 1/2* h, u + 1/2*h * k2);
    k4 = f(t + h, u + h * k3);
    u = u + h/6 * (k1 + 2*k2 + 2*k3+ k4);
    t = t + h;
end
end

    

