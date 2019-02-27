%% Jong Park (parkj6)
% Math 351 - Numerical Analysis HW 1

%% 1

% choose a spacing that is fine enough that the curve appears smooth.
x = linspace(-1,1);

%f(x) = e^x for [-1,1]
y = exp(x);

% if Vectors x and y each have n+1 components,
n1 = 2;
n2 = 10;
coeffs = polyfit (x,y,n1); 
% produces the coefficients of polynomial of degree n or less that interpolates
% points having horizontal coordinates in vector and vertical coordiantes in
% vector y. coeffs are listed in order of descending powers of x.

% to compute the values of that polynomial:
polyplot = polyval (coeffs, x); 
% produces values of the polynomial at horizontal coordinates
% specified in the vector xplot.

% compute areas where f and p meets.
xroots = polyxpoly(x,y, x,polyplot);

for i=1: size(xroots)
    yroots = exp(xroots);
end

% f-p
fp = abs (y - polyplot);

%Chebyshev Polynomials
c1 = chebyshevT(n1,x);
c2 = chebyshevU(n2,x);

%% Subplots (n = 2)
% F as solid curve
% P as dashed curve
% F==P - Small circle 
subplot (221); plot (x,y, '-', x, polyplot,'--', xroots, yroots, 'o');
legend ('f(x) = e^x', 'p(x)', 'f(x) == p(x)', 'location','best')

% Same thing with Chebyshev points
subplot (222); plot (c1, '-');

% Error f-p (Normal)
subplot (223); plot (x, fp);
legend('f(x) - p(x)','location','best')

% Error f-p (Chebyshev)
subplot (224); %plot (x,y);






%% 2




