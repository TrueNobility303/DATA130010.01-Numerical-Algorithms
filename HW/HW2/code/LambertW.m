function [x,y] = LambertW
% 使用bisection方法返回LambertW函数
x = linspace(-exp(-1),10,100);
y = zeros(1,100);
for i = 1:100
   if( x(i) < 0)
       res = bisection(@(y) y * exp(y) - x(i),-2, 0, 0);
       y(i) = res(end);
   else
       res = bisection(@(y) y * exp(y) - x(i),0, x(i),0);
       y(i) = res(end);
   end 
end
end

