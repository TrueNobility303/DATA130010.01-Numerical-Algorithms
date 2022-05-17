
N = 9;
x = linspace(-1,1,N);
y = linspace(-1,1,N);
u = linspace(-N/2, N/2, N);
v = linspace(-N/2, N/2, N);
sigma = 0.1;

%time domian function
A = zeros(N,N);
for i = 1:N
    for j = 1:N
        if x(i)^2 + y(j)^2 <= 1
            A(i,j) = exp( - (x(i)^2 + y(j)^2)/ sigma^2);
        end
    end
end

% time domian nabla operator
DA = zeros(N,N);
for i = 1:N
    for j = 1:N
        if x(i)^2 + y(j)^2 <= 1
            s  = exp( - (x(i)^2 + y(j)^2) / sigma^2);
            DA(i,j) = 4 *(x(i)^2 + y(j)^2) * s / sigma^2   - 4 * s / sigma^2;
        end
    end
end


shift_A = zeros(N,N);
for i = 1:N
    for j = 1:N
        shift_A(i,j) = A(i,j) * (-1)^((i-1)+(j-1));
    end
end

shift_DA = zeros(N,N);
for i = 1:N
    for j = 1:N
        shift_DA(i,j) = DA(i,j) * (-1)^((i-1)+(j-1));
    end
end

FA = fft2(shift_A);
FDA = fft2(shift_DA);

% kernel of nabla operator
K = zeros(N,N);
mid = (N+1)/2;
for i = 1:N
    for j = 1:N
        K(i,j) =  4*pi^2 * ( (i-mid)^2 + (j-mid)^2);
    end
end

B = -K .* FA;

[X,Y] = meshgrid(x,y);
subplot(3,3,1);
%colormap(parula(5));
mesh(X,Y,abs(FDA));
title('FDA')

subplot(3,3,2);
mesh(X,Y,abs(B));
title('B');

subplot(3,3,3);
mesh(X,Y,K);
title('K');

subplot(3,3,4);
mesh(X,Y,abs(FA));
title('FA');

subplot(3,3,5);
mesh(X,Y,abs(FA .* K));
title('FA .* K')


% shift back
for i =1:N
    for j = 1:N
        B = (-1)^(i+j) * B;
    end
end

% for i = 1:N
%     for j = 1:N
%         if x(i)^2 + y(j)^2 == 1
%             K = -B(i,j);
%         end
%     end
% end
% 
% for i = 1:N
%     for j = 1:N
%         if x(i)^2 + y(j)^2 <= 1
%             B(i,j) = B(i,j) + K;
%         end
%     end
% end

% [X,Y] = meshgrid(x,y);
% subplot(1,2,1);
% %colormap(parula(5));
% mesh(X,Y,DA);
% title('original')
% 
% subplot(1,2,2);
% mesh(X,Y,B);
% title('recovered');


