data = [-4.00000 0.00001
-3.50000 0.00726
-3.00000 0.25811
-2.50000 1.87629
-2.00000 1.55654
-1.50000 0.17209
-1.00000 0.00899
-0.50000 0.05511
0.00000 0.24564
0.50000 0.60455
1.00000 0.89370
1.50000 1.03315
2.00000 0.51633
2.50000 0.18032
3.00000 0.04287
3.50000 0.00360
4.00000 0.00045];

x = data(:,1);
y = data(:,2);
n = length(x);

%peak
c(1) = 2;
c(4) = 1;
%variance
c(2) = 2;
c(5) = 1;
%mean
c(3) = -2.5;
c(6) = 1.5;

gs1 =  exp( - c(2) * (x - c(3)).^2);
gs2 =  exp( - c(5) * (x - c(6)).^2);
r = y - ( c(1) * gs1 + c(4) * gs2 );
r_last = zeros(n,1);
k = 0;

% in practice, it may be difficult for residual to be small since the existence of noise 
while(norm(r,2) > 1e-2)
    % residual
    gs1 =  exp( - c(2) * (x - c(3)).^2);
    gs2 =  exp( - c(5) * (x - c(6)).^2);
    r = y - ( c(1) * gs1 + c(4) * gs2 );

    % gradient matrix 
    
    J = zeros(n,6);
    J(:,1) = gs1;
    J(:,2) = -c(1) * (x - c(3)).^2 .* gs1;
    J(:,3) = 2 * c(1) * c(2) * (x-c(3)) .* gs1;
    J(:,4) = gs2;
    J(:,5) = -c(4) * (x - c(6)).^2 .* gs2;
    J(:,6) = 2 * c(4) * c(5) * (x-c(6)) .* gs2;
    
    c = c +   pinv(J) * r;
    k = k+1;
    if(k>10)
        disp('achieve maximum number of iterations')
        break;
    end
    
end

qx = linspace(-5,5,1000);
gs1 =  exp( - c(2) * (qx - c(3)).^2);
gs2 =  exp( - c(5) * (qx - c(6)).^2);
qy =  c(1) * gs1 + c(4) * gs2 ;
plot(qx,qy);
hold on;
scatter(x,y);

