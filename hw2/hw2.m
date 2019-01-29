%% Jong Park (parkj6)
% Math 351 - Numerical Analysis
% HW 2

%% 1. part a
b = 0.1 : 0.1 :10;
x = log(b)
y = exp(b)
plot (x, y, x, zeros(size(x)), zeros(size(y)), y);








%% 2. part a 
format long
n=2;            % only one with real root.
n=5;            % Try these values as well. 
n=10; 
n=20;
n=21;           % The computed roots aren't even real.

p = poly(1:n);  % p Contains coefficients (in descending order of a polynomial
                % whose roots are components of the vector 1:n
r = roots(p) 	% r contains the computed roots of this polynomial.
