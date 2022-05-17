function [x] = shift(a)
    
%将x平移到 (-pi/2, pi/2]之间
    if (a==0)
        x = 0;
        return;
    end
    
    x = a;
    
    % 先平移到 (-2*pi, 2*pi]之间
    if(x>0)
        x = x - (floor(x/(2*pi)) * 2 * pi);
    else
        if(x<0)
            x = x - (ceil(x/(2*pi)) * 2 * pi);
        end
    end
    
    %disp(x);
    
    %平移到 (-pi,pi]之间
    if(x > pi)
        x = x - 2 * pi;
    else 
        if(x< - pi)
            x = x + 2* pi;
        end
    end
    
    %disp(x);
    
    % 利用对称性转化到 (-pi/2,pi/2] 之间
    if(x > pi/2)
        x = pi - x; 
    else
        if(x < - pi/2)
            x = -pi - x;
        end
    end
    
    %disp(x);
end

