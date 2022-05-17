
%使用Cubic Hermite插值方法对sine函数进行插值
subplot(2,2,1);
n = 2;
[xq, yq] = inter(n);
plot(xq,yq);
legend('n=2');

subplot(2,2,2);
n = 3;
[xq,yq] = inter(n);
plot(xq,yq);
legend('n=3');

subplot(2,2,3);
n = 5;
[xq,yq] = inter(n);
plot(xq,yq);
legend('n=5');

subplot(2,2,4);
n = 9;
[xq,yq] = inter(n);
plot(xq,yq);
legend('n=9');


function [xq,yq] = inter(n)
x = linspace(0,2*pi, n);
phi = @(x) -2*x^3 +  3 *x^2;
psi = @(x) x^3 - x^2;
xq = linspace(0,2*pi,1000);
yq = zeros(1000,1);
i = 1;
for j = 1: 1000
    
    %找到j所在的区间 [x_i,x_{i+1}]
    if(xq(j) > x(i+1))
        i = i +1;
    end
    %利用Hermite插值公式插值
    h = x(i+1) - x(i);
    yq(j) = sin(x(i)) * phi((x(i+1) - xq(j))/h) + sin(x(i+1)) * phi((xq(j) - x(i))/ h)  - cos(x(i)) * h * psi((x(i+1)  -xq(j))/h) + cos(x(i+1)) * h * psi((xq(j)-x(i))/h);
end

end

