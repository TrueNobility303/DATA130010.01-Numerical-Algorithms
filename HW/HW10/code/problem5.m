% reference: https://atmos.uw.edu/academics/classes/2012Q2/581/lect/matlab/pois_FFT.m

N = 32;      
L = 1;       
sigma = 0.1;   

k = (2*pi/L)*[0:(N/2-1) (-N/2):(-1)]; 
[KX,KY]  = meshgrid(k,k); 
                       
delsq = -(KX.^2 + KY.^2); 
delsq(1,1) = 1;           

% Construct RHS f(x,y) at the Fourier gridpoints

h = L/N;     
x = (0:(N-1))*h ;
y = (0:(N-1))*h;
[X,Y] = meshgrid(x,y);
rsq = (X-0.5*L).^2 + (Y-0.5*L).^2;
f = exp(-rsq/(2*sigma^2)).*(rsq - 2*sigma^2)/(sigma^4);

%  Spectral inversion of Laplacian

fhat = fft2(f);
u = real(ifft2(fhat./delsq));
u = u - u(1,1);  

%  Plot out solution in interior

uex = exp(-rsq/(2*sigma^2));

subplot(1,2,1);
surf(X,Y,uex);
title('original');

subplot(1,2,2);
surf(X,Y,u)
title('recovered');
