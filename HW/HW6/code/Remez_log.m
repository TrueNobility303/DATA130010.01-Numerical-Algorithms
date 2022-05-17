
function [x,y,k,err] = Remez_log

%using Remez algorithm for finding uniformly approximation in interval
%[a,b] for function log(1+x) with quadratic function, err represent the history error curve 

EPS = 1e-10;

x = linspace(0,1,1000);
y = log(1+x);
z = zeros(4,1);
for i = 1:4
   z(i) = 1/2 * ( cos((i-1) * pi / 3) + 1);
end
z = sort(z);

%initial guess
[c,b,a,eta] = sub_equation(z);
g = a * x.^2 + b * x + c;
err = [g'];

k = 0;
while(eta > EPS)
    last_eta = eta;
    r = sub_root(b,a);
    z = exchange(z,c,b,a,r(1));
    z = exchange(z,c,b,a,r(2));
    [c,b,a,eta] = sub_equation(z);
    g = a * x.^2 + b * x + c;
    err = [err, g'];
    k = k +1;
    % if eta do no change, then the lagorithm has already converged
    if(abs(last_eta - eta) < EPS)
       break; 
    end
    
end

end

function [c,b,a,eta] = sub_equation(z)
    A = [1, z(1), z(1)^2, -1; 
         1, z(2), z(2)^2, 1; 
         1, z(3), z(3)^2, -1;
         1, z(4), z(4)^2, 1];
     h = zeros(4,1);
     for i = 1:4
         h(i) = log(1+z(i));
     end
     d = A \ h;
     
     c = d(1);
     b = d(2);
     a = d(3);
     eta = abs(d(4));
end

function z = exchange(z,c,b,a,r)
    % if the root is out of the interval, remain the same nodes
    if(r >1 || r<0)
        return;
    end
    
    q = @(x) log(1+x) - (a* x^2+ b*x +c);
    if(z(1) < r && r < z(2) )
        if(q(z(1)) * q(r) >0)
            z(1) = r; 
        end
        if(q(z(2)) * q(r) >0)
            z(2) = r;
        end 
        return;
    end
    if(z(2) < r && r < z(3) )
        if(q(z(2)) * q(r) >0)
            z(2) = r; 
        end
        if(q(z(3)) * q(r) >0)
            z(3) = r;
        end 
        return;
    end
end

function r = sub_root(b,a)
    na = 2*a;
    nb = 2*a +b;
    nc = b-1;
    r = zeros(2,1);
    r(1) = (-nb - sqrt(nb^2- 4* na*nc))/ (2*na);
    r(2) = (-nb + sqrt(nb^2- 4* na*nc))/ (2*na);
end
