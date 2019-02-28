%% Jong Park (parkj6)
% Math 351 - Numerical Analysis 
% HW 3

%% 1. f(x) = e^x for [-1,1]
%n = 2;
n = 10;

% choose a spacing that is fine enough that the curve appears smooth.
x = linspace(-1,1, n+1);                    % x for finding roots
xplot = linspace(-1,1);                     % x for graphs

y = exp(x);                                 % f(x) = e^x 
yplot = exp(xplot);                         % y for graphs

%% 2.  f(x) = 1 / (1+ 25x^2)
%y = 1 ./ (1 + 25 * x.^2);

% Chebyshev Polynomials
syms s
cy = chebyshevT(n+1,s);                 % 'sym' T_(n+1)

% if Vectors x and y each have n+1 components,
coeffs = polyfit (x, y, n);             % coeff for p(x)
cChev = sym2poly(cy);                   % x^n +c
% produces the coefficients of polynomial of degree n or less that interpolates
% points having horizontal coordinates in vector and vertical coordiantes in
% vector y. coeffs are listed in order of descending powers of x.

% to compute the values of that polynomial:
polyplot = polyval (coeffs, xplot);             % p(x) for graphs
% produces values of the polynomial at horizontal coordinates
% specified in the vector x.

% % compute areas where f and p meets.
% [xr,yr] = polyxpoly(x,y );              % x-root
% [cxr,cyr] = polyxpoly(x,c, x,cplot);                  
cx = roots(cChev)
cy = exp(cx)
ccoeffs = polyfit(cx, cy, n);
cplot = polyval (ccoeffs, xplot);               % p(x) for graphs (Chev)


% f-p
fp = yplot - polyplot;
fpc = yplot - cplot;


%% Subplots
% F as solid curve
% P as dashed curve
% F==P - Small circle 
subplot (221); plot (xplot,yplot, '-', xplot, polyplot,'--',  x, y, 'o');
legend ('f(x) = e^x', 'p(x)', 'f(x) == p(x)', 'location','north')
title ('f(x) = e^x, evenly spaced (n=2)')
% legend ('f(x) = 1 /(1+ 25x^2)', 'p(x)', 'f(x) == p(x)', 'location','north')
% title ('f(x) = 1 /(1+ 25x^2), evenly spaced (n=2)')

% Same thing with Chebyshev points
subplot (222); plot (xplot,yplot, '-', xplot, cplot,'--',cx,cy,'o');
legend ('f(x) = e^x', 'p(x)', 'f(x) == p(x)', 'location','north')
title ('Chebyshev Polynomial')

% Error f-p (Normal)
subplot (223); plot (xplot, fp, xplot, zeros(size(xplot)),'k');
legend('f(x) - p(x)','location','north')
title ('Error f-p (Normal)')
% axis ([-1 1 -.1 .1])

% Error f-p (Chebyshev)
subplot (224); plot (xplot,fpc, xplot, zeros(size(xplot)),'k');
legend('T_n(x) - p(x)','location','north')
title('Error f-p (Chebyshev)')
% axis ([-1 1 -.1 .1])



