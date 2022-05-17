function [S,err]  = Richardson (f,x, c)

%Using Richardson method to calculate df(x)  , whose exact value is c
eps = 1e-10;
T = zeros(100,100);
h = 1e-2;
T(1,1) = (f(x+h) - f(x-h))/ (2*h);
S = T(1,1);
err = [];
m = 2;
while(abs(S-c) > eps)
    h = 1/ 2^(m-1);
    T(1,m) = (f(x+h) - f(x-h))/(2*h);
    for i = 2:m
        T(i,m+1-i) = (4^(i-1) * T(i-1,m+2-i) - T(i-1, m+1-i)) / (4^(i-1)-1);
    end
    S = T(m,1);
    err = [err,abs(S-c)];
    m = m+1;
    if(m>100)
        break;
    end
end
end

