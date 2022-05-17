function [fz,fy] = poly_interpolation(n,f,a,b, use_chebyshev)
%输入函数f，在区间[a,b]内等间隔采用n个点，返回fz为插值值，fy为真实值
y = linspace(a,b,1000);

if(use_chebyshev  == 0)
    x = linspace(a,b, n);
    
%使用切比雪夫插值结点    
else
   x = zeros(n);
   for i = 1:n
       x(i) = cos((2*i -1) * pi / (2*n) );
   end
end
% fx,fy分别为插值点和真实点
fx = zeros(1,n);
fy = zeros(1,1000);
for i = 1:n
    fx(i) = f(x(i));
end
for i = 1:1000
    fy(i) = f(y(i));
end

%构造矩阵作为Lagrange插值公式的分母，构造需要 O(n^2)的代价，

t = ones(n,1);
for k = 1:n
    for j = 1:n
        if(j==k)
                continue;
            else
                t(k) = t(k) * (x(k) - x(j));
        end
    end
end

fz = zeros(1,1000);
for i = 1:1000
    s = 1;
    for j=1:n
        s = s * (y(i) - x(j));
    end
    for k = 1:n
        fz(i) = fz(i) + fx(k) * s / ( (y(i) - x(k) ) * t(k));
    end
end
end

