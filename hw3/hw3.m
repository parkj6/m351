%% Jong Park (parkj6)
% Math 351 - Numerical Analysis 
% HW 3

%% 1. f(x) = e^x for [-1,1]
n = 2;
%n = 10;

% choose a spacing that is fine enough that the curve appears smooth.
x = linspace(-1,1, n+1);                    % x for finding roots
xplot = linspace(-1,1);                     % x for graphs

y = exp(x);                                             % f(x) = e^x 
yplot = exp(xplot);                             % y for graphs

%% 2.  f(x) = 1 / (1+ 25x^2)
%y = 1 ./ (1 + 25 * x.^2);

% Chebyshev Polynomials
syms s
cy = chebyshevT(n+1,s);                    % 'sym' T_(n+1)

% if Vectors x and y each have n+1 components,
coeffs = polyfit (x, y, n);               % coeff for p(x)
cChev = sym2poly(cy);                        % x^n +c
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
cx = roots(cChev);
cy = exp(cx);
ccoeffs = polyfit(cx, cy, n);
cplot = polyval (ccoeffs, xplot);               % p(x) for graphs (Chev)


% f-p
fp = yplot - polyplot;
fpc = yplot - cplot;


%% Subplots
% F as solid curve
% P as dashed curve
% F==P - Small circle 
subplot (221); 
hold on
plot (xplot,yplot, '-', xplot, polyplot,'--', 'LineWidth',2);
plot (x, y, 'o');
legend ('f(x) = e^x', 'p(x)', 'f(x) == p(x)', 'location','north')
title(sprintf("f(x) = e^x, evenly spaced (n=%d)",n))

% legend ('f(x) = 1 /(1+ 25x^2)', 'p(x)', 'f(x) == p(x)', 'location','north')
% title ('f(x) = 1 /(1+ 25x^2), evenly spaced (n=2)')

% Same thing with Chebyshev points
subplot (222);
hold on
plot (xplot,yplot, '-', xplot, cplot,'--','LineWidth',2);
plot (cx,cy,'o');
legend ('f(x) = e^x', 'p(x)', 'f(x) == p(x)', 'location','north')
title ('Chebyshev Polynomial')

% Error f-p (Normal)
subplot (223); plot (xplot, fp, xplot, zeros(size(xplot)),'k','LineWidth',2);
legend('f(x) - p(x)','location','north')
title ('Error f-p (Normal)')
if n == 2
    axis ([-1 1 -.1 .1])
else n == 10
    axis ([-1 1 -.00000000025 .00000000025])
end
% Error f-p (Chebyshev)
subplot (224); plot (xplot,fpc, xplot, zeros(size(xplot)),'k','LineWidth',2);
legend('T_n(x) - p(x)','location','north')
title('Error f-p (Chebyshev)')
if n == 2
    axis ([-1 1 -.1 .1])
else n == 10
    axis ([-1 1 -.00000000025 .00000000025])
end



