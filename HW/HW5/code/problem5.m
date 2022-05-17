%data of problem 5
data= [1 1 + 1
2 3 + 5
3 2 + 14
4 3 + 16
5 0 + 28
6 3 + 45
7 4 + 51
8 3 + 62
9 4 + 76
10 11 + 64
11 5 + 78
12 1 + 64
13 41 + 128
14 9 + 130
15 5 + 197
16 8 + 150
17 57 + 203
18 8 + 366
19 17 + 492
20 24 + 734];

x = data(:,1);
y = data(:,2);
n = length(x);
%linear regression

z = log(y);
Sxy = (x - mean(x))' * (z - mean(z));  
Sxx = (x - mean(x))' * (x - mean(x)); 
beta = exp(Sxy / Sxx);
alpha = exp( mean(z) -  mean(x) * Sxy / Sxx);
subplot(1,2,1);
qx = linspace(0,21,1000);
qy = alpha * beta .^ qx;
plot(qx,qy);
hold on;
scatter(x,y);
title('linear');
r = y - alpha * (beta .^ x);
disp(norm(r,2));

%non-linear regression

c = zeros(2,1);
c(1) = 6;
c(2) = 1.3;
[r,c] = gauss_newton(x,y,c);
disp(norm(r,2));

subplot(1,2,2);
qx = linspace(0,21,1000);
qy = c(1) * c(2) .^ qx;
plot(qx,qy);
hold on;
scatter(x,y);
title('non-linear');

function [r,c] = gauss_newton(x,y,c0)

%solving with gauss-newton method
c = c0;
r = y - c(1) * (c(2) .^ x);
n = length(x);
k = 0;
while(norm(r,2) > 1e-2)
    % residual
    r = y - c(1) * (c(2) .^ x);

    % gradient matrix 

    J = zeros(n,2);
    J(:,1) = c(2) .^ x;
    J(:,2) = c(1) * x .* (c(2) .^(x-1));
    c = c +   pinv(J) * r;
    k = k+1;
    if(k>10)
        disp('achieve maximum number of iterations')
        break;
    end

end
end