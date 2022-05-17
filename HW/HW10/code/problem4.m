x = linspace(-10,10,1000);
sigma = 1;
gs = exp( - x.^2 / (2*sigma^2));

subplot(1,3,1);
y = (-1+x).*(x<0) + (x+1).*(x>0);
plot(x,y);
xlim([-5,5]);

subplot(1,3,2);
plot(x,gs);
xlim([-5,5]);

subplot(1,3,3);
plot(x, conv(y,gs,'same'));
xlim([-5,5]);
