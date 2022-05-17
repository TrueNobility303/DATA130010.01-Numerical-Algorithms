
% u = [x,v]', u0 = [0,1]';
u0 = [0,1]';
A = [0,1;-1,0];
T = 40;
h = 0.1;
n = T/h; %100
I = eye(2);

info_forward_euler = zeros(n,2);
u = u0;
for i = 1:n
   u = (I+h *A) * u;
   info_forward_euler(i,:) = u;
end

info_backward_euler = zeros(n,2);
u = u0;
for i = 1:n
   u = (I-h *A) \ u;
   info_backward_euler(i,:) = u;
end

info_trapezoidal = zeros(n,2);
u = u0;
for i = 1:n
   u = (I-h/2*A) \ (I+h/2*A) * u;
   info_trapezoidal(i,:) = u;
end

info_RK4 = zeros(n,2);
u = u0;
for i = 1:n
    k1 = A * u ;
    k2 = A * (u + 1/2*h * k1);
    k3 = A * (u + 1/2*h * k2);
    k4 = A * (u + h * k3);
    u = u + h/6 * (k1 + 2*k2 + 2*k3+ k4); 
    info_RK4(i,:) = u;
end

x = linspace(0,T,n);
true_x = sin(x);
true_v = cos(x);

clf;
subplot(1,2,1);
plot(info_forward_euler(:,1));
hold on;
plot(info_backward_euler(:,1));
hold on;
plot(info_trapezoidal(:,1));
hold on;
plot(info_RK4(:,1));
hold on;
plot(true_x);
legend('forward euler','backward euler','trapezoidal','RK4','x');
title('x');

subplot(1,2,2);
plot(info_forward_euler(:,2));
hold on;
plot(info_backward_euler(:,2));
hold on;
plot(info_trapezoidal(:,2));
hold on;
plot(info_RK4(:,2));
hold on;
plot(true_v);
legend('forward euler','backward euler','trapezoidal','RK4','v');
title('v');