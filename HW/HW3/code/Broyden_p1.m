function [x,err] = Broyden_p1
%使用Good Broyden法求解问题一

n = 4;
x = 1e-7 * ones(n,1);
err = [];

H = eye(n);
r = zeros(n,1);
y = zeros(n,1);
U = [];
V = [];
k = 0;

while (norm(f(x),2) > 1e-10)
   
   x_plus = x - H * f(x);
   
   %基于dx,df计算r,y用于下一步迭代使用
   dx = x_plus - x;
   df = f(x_plus) - f(x);
   H = H - ((H*df - dx)* dx' * H)/(dx' * H * df);
   
   %使用rank k扰动的方式
   %U = [U, r];
   %V = [V, y];
   %k = k+1;
   %H = H0 - H0 * U * inv(eye(k) + V' * H0 * U ) * V' * H0;  
   
   %更新并且记录误差
   x = x_plus;
   err = [err, norm(f(x),2)];
end
end

function [y] = f(x)

KH = 10^(-1.46);
K1 = 10^(-6.3);
K2 = 10^(-10.3);
KW = 10^(-14);
pCO2 = 375;

y = [x(1) * x(2) - KW, x(1) * x(3) - K1 * KH * pCO2 /10^6, x(1) * x(4) / x(3) - K2, x(1) - x(2) - x(3) - 2 * x(4)]';

end


