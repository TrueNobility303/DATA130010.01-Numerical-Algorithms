x = linspace(-10, 10, 1000);
a = zeros(1,1000);
b = zeros(1,1000);
c = zeros(1,1000);

for i = 1:1000
   [na, a(i)] = Taylor_sin(x(i), 0);
   [nb, b(i)] = Taylor_sin(x(i), 1);
   c(i) = sin(x(i));
end

error_with_shift = sum(abs(a-c));
error_without_shift = sum(abs(b-c));
disp(error_with_shift);
disp(error_without_shift);
semilogy(x, abs(a-c), x, abs(b-c));
legend('without shift','with shift','Location','northwest')

%plot(x, a,x,b)
%legend('without shift','with shift','Location','northwest')

