%% Jong Park (parkj6)
% Math 351 - Numerical Analysis 
% HW 3

%% 1

% choose a spacing that is fine enough that the curve appears smooth.
x = linspace(-1,1);
%n = 2;
n = 10;

% f(x) = e^x for [-1,1]
y = exp(x);

% f(x) = 1 / (1+ 25x^2)
%y = 1 ./ (1 + 25 * x.^2);

%Chebyshev Polynomials
c = chebyshevT(n,y);

% if Vectors x and y each have n+1 components,
coeffs = polyfit (x,y,n); 
cpoly  = polyfit (x,c, n);
% produces the coefficients of polynomial of degree n or less that interpolates
% points having horizontal coordinates in vector and vertical coordiantes in
% vector y. coeffs are listed in order of descending powers of x.

% to compute the values of that polynomial:
polyplot = polyval (coeffs, x); 
cplot = polyval (cpoly, x);
% produces values of the polynomial at horizontal coordinates
% specified in the vector x.

% compute areas where f and p meets.
[xr,yr] = polyxpoly(x,y, x,polyplot);              % x-root
[cxr,cyr] = polyxpoly(x,c, x,cplot);                  

% f-p
fp = abs (y - polyplot);
fpc = abs (c - cplot);


%% Subplots
% F as solid curve
% P as dashed curve
% F==P - Small circle 
subplot (221); plot (x,y, '-', x, polyplot,'--',  xr, yr, 'o');
legend ('f(x) = 1 /(1+ 25x^2)', 'p(x)', 'f(x) == p(x)', 'location','north')
title ('f(x) = 1 /(1+ 25x^2), evenly spaced (n=10)')

% Same thing with Chebyshev points
subplot (222); plot (x,c, '-', x, cplot,'--',cxr,cyr,'o');
legend ('f(x) = T_1_0(x)', 'p(x)', 'f(x) == p(x)', 'location','north')
title ('Chebyshev Polynomial')

% Error f-p (Normal)
subplot (223); plot (x, fp);
legend('f(x) - p(x)','location','north')
title ('Error f-p (Normal)')

% Error f-p (Chebyshev)
subplot (224); plot (x,fpc);
legend('T_n(x) - p(x)','location','north')
title('Error f-p (Chebyshev)')

%% 2




