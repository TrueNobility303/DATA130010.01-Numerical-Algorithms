function [x,err] = Newton_p1(x)
%使用Newton法求解问题一

x = 1e-7 * ones(4,1);
err = [];
while (norm(f(x),2) > 1e-10)
   x = x -  J(x) \ f(x);  
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

function [H] = J(x) 

H = [x(2), x(1), 0, 0;
    x(3), 0 , x(1), 0;
    x(4) / x(3), 0, - x(1) * x(4) / x(3)^2, x(1) / x(3);
    1,-1,-1,-2];
end
