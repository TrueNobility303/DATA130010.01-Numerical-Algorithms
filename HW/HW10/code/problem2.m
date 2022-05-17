

time_poly = [];
time_conv = [];
N = 1e4;
x = 1:100:N;
for n = x
   u = randn(1,n);
   v = randn(1,n);
   tic;
   w = poly_multiple(u,v);
   time_poly = [time_poly toc];
   tic;
   w = conv(u,v);
   time_conv = [time_conv toc];
end

clf;
plot(x, time_poly);
hold on;
plot(x, time_conv);
legend('my impletement', 'matlab impletement');
