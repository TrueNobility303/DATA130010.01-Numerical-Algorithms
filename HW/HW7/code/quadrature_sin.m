function err = quadrature_sin

N = 100;
err = zeros(N,1);
for  n = 1:100
    err(n) = tri_quadrature(n);
end
end

function s = tri_quadrature(n)

% use 1/3 - quadrature to calculate integration of sinx in [0,pi]

h = pi / n;
s = 0;
for i = 0: (n-1)
   a = i *h;
   b = (i+1) *h;
   s = s + (b-a)/2 * (sin(a + h/3)  + sin(a + 2*h/3));
end

end