function w = poly_multiple(u,v)
    lu = length(u);
    lv = length(v);
    u = [u, zeros(1,lv-1)]; 
    v = [v, zeros(1,lu-1)]; 
    w = ifft(fft(u) .* fft(v));
end