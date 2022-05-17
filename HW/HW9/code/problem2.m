
clear;
clf;
xq = linspace(1,4,1000);
gt = exp(xq) + log(xq);
dgt = exp(xq) + 1./xq;


subplot(2,2,1);
n = 10;
x = linspace(1,4,n);
y = exp(x) + log(x);
[~,dyq] = cubic_spline_for_derivative(x,y,xq,0,0,'natural');
plot(xq,dyq,'marker','o','MarkerIndices',1:100:length(xq));
hold on;
plot(xq,dgt,'marker','x','MarkerIndices',1:133:length(xq));
legend('fitting value','true value')
title('n=10')

subplot(2,2,2);
n = 100;
x = linspace(1,4,n);
y = exp(x) + log(x);
[~,dyq] = cubic_spline_for_derivative(x,y,xq,0,0,'natural');
plot(xq,dyq,'marker','o','MarkerIndices',1:100:length(xq));
hold on;
plot(xq,dgt,'marker','x','MarkerIndices',1:133:length(xq));
legend('fitting value','true value')
title('n=100')

subplot(2,2,3);
n = 1000;
x = linspace(1,4,n);
y = exp(x) + log(x);
[~,dyq] = cubic_spline_for_derivative(x,y,xq,0,0,'natural');
plot(xq,dyq,'marker','o','MarkerIndices',1:100:length(xq));
hold on;
plot(xq,dgt,'marker','x','MarkerIndices',1:133:length(xq));
legend('fitting value','true value')
title('n=1000')

subplot(2,2,4);
n = 10000;
x = linspace(1,4,n);
y = exp(x) + log(x);
[~,dyq] = cubic_spline_for_derivative(x,y,xq,0,0,'natural');
plot(xq,dyq,'marker','o','MarkerIndices',1:100:length(xq));
hold on;
plot(xq,dgt,'marker','x','MarkerIndices',1:133:length(xq));
legend('fitting value','true value')
title('n=10000')
