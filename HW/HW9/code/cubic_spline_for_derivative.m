function [yq,dyq] = cubic_spline_for_derivative(x,y,xq,df1,df2,type)
%use cublic spline for interpolation, if type =='complete', df1 and df2 are the
%derivative of two endpoints

n = length(x);

%generate coefficient matrix
h = zeros(n-1);
beta = zeros(n-1);
eta = zeros(n-1);
for i = 1:n-1
    h(i) = x(i+1) - x(i);
    beta(i) = 1/h(i);
    eta(i) = 3 * (y(i+1) - y(i)) / h(i)^2;
end

A = zeros(n-2,n);
b = zeros(n-2,1);
for i=1:(n-2)
   A(i,i) = beta(i);
   A(i,i+1) = 2 * ( beta(i) + beta(i+1));
   A(i,i+2) = beta(i+1); 
   b(i) = eta(i) + eta(i+1);
end
%complte spline 
k = zeros(n);
if(strcmp(type,'complete')==1)
    B = zeros(n,n);
    B(1,1) = 1;
    B(n,n) = 1;
    B(2:n-1,:) = A(:,:);
    d = zeros(n,1);
    d(1) = df1;
    d(n) = df2;
    d(2:n-1) = b(:);
    k = B \ d;
end

%natural spline
if(strcmp(type,'natural')==1) 
    B = zeros(n,n);
    B(1,1) = 2 * beta(1);
    B(1,2) = beta(1);
    B(n,n) = beta(n-1);
    B(n,n-1) = 2 * beta(n-1);
    B(2:n-1,:) = A(:,:);
    
    d = zeros(n);
    d(1) = eta(1);
    d(n) = eta(n-1);
    d(2:n-1) = b(:);
    k = B \ d; 
end

%periodic spline 
if(strcmp(type,'periodic')==1) 
    % for periodic spline, k1 = kn, so we only need n-1 variables 
    
    B = zeros(n-1,n-1);
    B(1,1) = 2 * (beta(1) + beta(n-1));
    B(1,2) = beta(1);
    B(1,n-1) = beta(n-1);
    B(2:n-1,:) = A(:, 1:n-1);
    B(n-1,1) = A(n-2,n-2);
    
    d = zeros(n-1,1);
    d(2:n-1) = b(:);
    d(1) = eta(1) + eta(n-1);
    k = zeros(n);
    k(1:n-1) = B \ d;
    k(n) = k(1);
end

i = 1;
m = length(xq);
yq = zeros(m,1);
dyq = zeros(m,1);

%base function 
phi = @(x) -2*x^3 +  3 *x^2;
psi = @(x) x^3 - x^2;

%derivative of base function 
dphi = @(x) -6*x^2 +  6 *x;
dpsi = @(x) 3*x^2 - 2*x;

for j = 1:m
    % find the interval of xq to determine which spline
    if(xq(j) > x(i+1))
        i = i +1;
    end
    
    yq(j) = y(i) * phi((x(i+1) - xq(j))/h(i)) + y(i+1) * phi((xq(j) - x(i))/ h(i))  - k(i) * h(i) * psi((x(i+1)  -xq(j))/ h(i)) + k(i+1) * h(i) * psi((xq(j)-x(i))/h(i));
    dyq(j) = -y(i) * dphi((x(i+1) - xq(j))/h(i)) / h(i) + y(i+1) * dphi((xq(j) - x(i))/ h(i)) / h(i)  + k(i) * dpsi((x(i+1)  -xq(j))/ h(i)) + k(i+1)  * dpsi((xq(j)-x(i))/h(i));
    
end
end