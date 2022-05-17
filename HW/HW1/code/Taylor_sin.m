function [n,y] = Taylor_sin(x, isShifted)
%  使用Taylor展开截断
%  TODO：将函数改为向量化运算版本加快运算速度
if(x==0)
    y = 0;
    n = 0;
    return;
end
if(isShifted==1)
    x = shift(x);
end
    n = 0;
    u = x;
    y = 0;
    % 当截断误差大于舍入误差（机器精度）
    while(abs(u) > 1e-15)
        y = y + u;
        n = n + 1;
        u = (-1) * u * x * x  / ((2*n+1)*(2*n));
    end
end


