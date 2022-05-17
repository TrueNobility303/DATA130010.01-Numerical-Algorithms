function s = triangle_quatrature(f,n)
% calculate int_0^1 int^0^{1-y} f(x,y) dx dy with n x n grids

h = 1/n;
s = 0;
for i = 1:n
    for j = 1:i
        y1 = 1-i*h;
        y2 = 1-(i-1)*h;
        x1 = (j-1)*h;
        x2 = j*h;
        s = s + h^2 * sub_tri_quatrture(f,x1,y1,x1,y2,x2,y1);
        
        if(j<i)
           s = s + h^2 * sub_tri_quatrture(f,x2,y2,x1,y2,x2,y1);
        end
    end
end
end

function s = sub_tri_quatrture(f,a1,a2,b1,b2,c1,c2)
    s = 1/6 * f((a1 + b1)/2, (a2 +b2)/2 ) + 1/6 * f((a1 + c1)/2, (a2 +c2)/2 ) + 1/6 * f((b1 + c1)/2, (b2 +c2)/2 );
end