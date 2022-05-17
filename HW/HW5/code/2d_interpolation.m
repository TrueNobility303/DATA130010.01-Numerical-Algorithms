% data of problem 3
x = [-1, -1, 1, 1, -0.7313, 0.5275, -0.0091, 0.3031];
y = [-1, 1, -1, 1, 0.6949, -0.4899, -0.010101, 0.5774];
z = [1.6389, 0.5403, -0.99, 0.1086, 0.9573, 0.827, 1.6936, 1.367];

% Delaunay's method
T = delaunay(x,y);
subplot(1,2,1);
trimesh(T,x,y,z);
hold on;
scatter3(x,y,z);
title('Delaunay ');

% Shepard’s method:

m = length(x);
n = 10;
xi  = linspace(-1,1,n);
yi = linspace(-1,1,n);
[xi,yi] = meshgrid(xi,yi);
F = zeros(n,n);

for i =1:n
    for j = 1:n
        %calculate the weightw
        w = zeros(m,1);
        for k = 1:m
            d = (x(k) - xi(i,j))^2 +(y(k) - yi(i,j))^2;
            
            % when sufficient close to the control point, avoid divide by zero
            if(d<1e-10)
                w = zeros(m,1);
                w(k) = 1;
                break;
            else 
                 w(k) = 1 / d;
            end
        end
        w = w / sum(w);
        for k = 1:m
            F(i,j) = F(i,j) + w(k) * z(k);
        end
    end
end

subplot(1,2,2);
mesh(xi,yi,F);
hold on;
scatter3(x,y,z);
title('Shepard');

