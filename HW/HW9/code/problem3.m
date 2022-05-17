
clear;
clf;
n = 1024;

subplot(1,2,1);
x = linspace(-2*pi,2*pi,n);
y = sin(2* pi * 10 * x);
z = fft(y);
i = 0:(n-1);
plot(i /(4*pi),abs(z));
title('sin(3x)');

subplot(1,2,2);
x = linspace(-12*pi,12*pi,n);
y = sin(2 *pi *x) + sin(2 * pi * 128^(1/12) * x);
z = fft(y);
i = 0:n-1;
plot(i / (24 * pi),abs(z));
title('sin(x) + sin(1.4983x)');
