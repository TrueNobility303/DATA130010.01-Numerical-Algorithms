
function [s] = cos_quatrature(f,m,a,b)
%intergrate int_a^b cos(mx) f(x) dx 

% using Newon-Cotes quatrature with degree 2
% B1 = -sin(m * a)/m + (cos(m*b) + 3 * cos(m*a)) / ((b-a)*m^2) - 4 *(sin(m*b) - sin(m*a))  / ((b-a)^2 * m^3);
% B2 = - 4 *(cos(m*b) + cos(m*a))/((b-a) * m^2) + 8 * (sin(m*b) - sin(m*a)) / ((b-a)^2 * m^3);
% B3 = sin(m*b)/m + (3* cos(m*b) + cos(m*a)) / ((b-a)*m^2)  - 4 *(sin(m*b) - sin(m*a))  / ((b-a)^2 * m^3);
% s = B1 * f(a) + B2 * f((a+b)/2) + B3 * f(b);

% using Gauss quatrature with degree 3
k0 = -(sin(a*m) - sin(b*m))/m;
k1 = (cos(b*m) + b*m*sin(b*m))/m^2 - (cos(a*m) + a*m*sin(a*m))/m^2;
k2 = (b^2*m^2*sin(b*m) - 2*sin(b*m) + 2*b*m*cos(b*m))/m^3 - (a^2*m^2*sin(a*m) - 2*sin(a*m) + 2*a*m*cos(a*m))/m^3;
k3 = (6*cos(a*m) - 3*a^2*m^2*cos(a*m) - a^3*m^3*sin(a*m) + 6*a*m*sin(a*m))/m^4 - (6*cos(b*m) - 3*b^2*m^2*cos(b*m) - b^3*m^3*sin(b*m) + 6*b*m*sin(b*m))/m^4;

b = -k1 / k0;
res1= -inv([k1,k0; k2+k1*b, k1+k0*b]) * [k2,k3+k2*b]';
c = res1(1);
d = res1(2);

x1 = -c/2 - sqrt(c^2 - 4*d)/2;
x2 = -c/2 + sqrt(c^2 - 4*d)/2;
res2 = inv([1,1;x1,x2]) *[k0,k1]';
A1 = res2(1);
A2 = res2(2);
s = A1 * f(x1) + A2 * f(x2);
end