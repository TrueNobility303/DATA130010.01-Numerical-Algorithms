
x = linspace(-1.1,1.1,1000);
n = 6;
y = zeros(n,1000);
for k = 1:n
   y(k,:) =  cos(k * acos(x));
end

subplot(2,3,1);
plot(x,y(1,:));
legend('T_1(x)');

subplot(2,3,2);
plot(x,y(2,:));
legend('T_2(x)');

subplot(2,3,3);
plot(x,y(3,:));
legend('T_3(x)');

subplot(2,3,4);
plot(x,y(4,:));
legend('T_4(x)');

subplot(2,3,5);
plot(x,y(5,:));
legend('T_5(x)');

subplot(2,3,6);
plot(x,y(6,:));
legend('T_6(x)');