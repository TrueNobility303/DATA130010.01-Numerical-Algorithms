function [res] = newton(f,g,x,m)
%输入初始点x0，对于使用Newton迭代求根
%f为待求根函数，g为其一阶导数,m表示重根的数目，利用m对Newton迭代进行修正

res = [x];
while(abs(f(x)) > 1e-10)
   x = x - m * f(x) / g(x);
   res = [res,x];
end
    
end

