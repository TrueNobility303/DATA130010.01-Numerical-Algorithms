function [x] = bisection(f,a,b,regula_falsi)
% 使用二分法寻找x^64 = 0.1的根，返回迭代产生的序列x_k
% 当参数regula_falsi = 1的时候，转为反插值法
x = [];
while(abs(b-a) > 1e-12)
    
    fa = f(a);
    fb = f(b);
    
    if(regula_falsi == 0)
        c = (a+b) / 2;
    else 
       c = (a * fb - b * fa) / (fb - fa) ; 
    end
    
    fc = f(c);
    x = [x,c];
    if (abs(fc) < 1e-12)
        break;
    end
    
    if (fa * fc < 0 )
        b = c;
    else
        a = c;
    end

end

end
