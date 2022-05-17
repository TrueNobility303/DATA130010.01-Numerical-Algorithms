function [fz,fy] = interpolation_p2(n,f,a,b)
%输入函数f，在区间[a,b]内等间隔采用n个点，计算插值产生的误差
y = linspace(a,b,1000);
x = linspace(a,b, n);

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

