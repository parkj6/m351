%% Jong Park (parkj6)
% Math 351 - Numerical Analysis
% HW 2

%% 1. part a
b = 1: 1 :100;
x = 0;
evenIter= -1;


f = 'log(x)';		% string variable
fprime = '1/x';		% string variable
maxiterations = 20;

% x = [0, 1.5, 3];				% Vector of starting values
% iters = x;						% Used to accumulate iterations
x= -4.9:0.1:5
lnnew = 0;
for k = 1 : 100       % 20 by default
    ln = (b-1).^k ./ k;
    if (mod(k,2))
        ln = evenIter * ln;
        disp(k)
    end
     lnnew = lnnew + ln
     
     y = lnnew;

 plot (x, y,'o');
% 
% 	xnew = x - eval(f) ./ eval(fprime);
% 	iters = [iters; xnew];
% 	test = abs(xnew -x) ./ (abs(xnew)+eps);
% 	if max(test) < 10*eps, break, end
% 	x = xnew;
end










%% 2. part a 
format long
n=2;            % only one with real root.
n=5;            % Try these values as well. 
n=10; 
n=20;
n=21;           % The computed roots aren't even real.

p = poly(1:n);  % p Contains coefficients (in descending order of a polynomial
                % whose roots are components of the vector 1:n
r = roots(p); 	% r contains the computed roots of this polynomial.

%% 2. part b

ep = 0.002;
n=7;


