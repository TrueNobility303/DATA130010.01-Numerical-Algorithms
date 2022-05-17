function [S,err]  = Romberg (f,a,b, c)

%Using Romberg method to calculate int_a^b f(x) dx , whose exact value is c
eps = 1e-8;
T = zeros(100,100);
T(1,1) = (b-a)/2 * (f(a) + f(b));
S = T(1,1);
err = [];
m = 2;
while( abs(S -c) > eps )
    T(1,m) = trapezoid_quadrature(f,a,b,2^(m-1));
    for i = 2:m
        T(i,m+1-i) = (4^(i-1) * T(i-1,m+2-i) - T(i-1, m+1-i)) / (4^(i-1)-1);
    end
    S = T(m,1);
    err = [err, abs(S-c)];
    m = m+1;
end
end


%composite trapezoid quadrature for int_a^b f(x）dx for n intervals
function s = trapezoid_quadrature(f,a,b,n)

h = (b-a) / n;
s = 0;
for i = 0: (n-1)
   l = a + i *h;
   r = a + (i+1) *h;
   s = s + (r-l)/2 * (f(l) + f(r));
end

end