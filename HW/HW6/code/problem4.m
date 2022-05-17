
[x,y,k,err] = Remez_log;

% plot 
subplot(2,2,1);
plot(abs(err(:,1)' - y));
title('initial guess');
subplot(2,2,2);
plot(abs(err(:,2)' - y));
title('first iteration');
subplot(2,2,3);
plot(abs(err(:,3)' - y));
title('second iteration');
subplot(2,2,4);
plot(abs(err(:,4)' - y));
title('third iteration');

%log-plot

subplot(2,2,1);
semilogy(abs(err(:,1)' - y));
title('initial guess');
subplot(2,2,2);
semilogy(abs(err(:,2)' - y));
title('first iteration');
subplot(2,2,3);
semilogy(abs(err(:,3)' - y));
title('second iteration');
subplot(2,2,4);
semilogy(abs(err(:,4)' - y));
title('third iteration');




