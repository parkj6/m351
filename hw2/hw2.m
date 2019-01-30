%% Jong Park (parkj6)
% Math 351 - Numerical Analysis
% HW 2

% %% 1. part a
% format long
% 
% b = 1:100;                                            % B value
% x = b;                                                  % x0
% y = exp(x)-b;
% yp = exp(x);
% 
% plot(x, y )
% title('Plot of f(x) = e^x-b')
% xlabel('x')
% ylabel('y')
% hold on
% 
% f = 'exp(x)- b';                               % f(x)   = e^x-b
% fprime = 'exp(x)';                          % f'(x) = e^x
% maxiterations = 20;
% 
% iters = x;                                          % Used to accumulate iterations
% for k = 1 : maxiterations               % 20 by default
% 	xnew = x - eval(f) ./ eval(fprime);
% 	iters = [iters; xnew];
% 	test = abs(xnew -x) ./ (abs(xnew)+eps);
% 	if max(test) < 10*eps, break, end
% 	x = xnew;
%           
%     x = -5:5
%     plot(x,y)
%     m = exp(xnew(k));
%     y = m .* x - m .* xnew(k)
%     
%     plot (x, yp)
%     hold on
% end
% iters
% 
% 
%% 2. part a 
n=2;            % only one with real root.
n=5;            % Try these values as well. 
n=10; 
n=20;
n=21;           % The computed roots aren't even real.

p = poly(1:n);  % p Contains coefficients (in descending order of a polynomial
                % whose roots are components of the vector 1:n
r = roots(p); 	% r contains the computed roots of this polynomial.

%% 2. part b

epsilon = -0.002;
n=10;

v = poly(1:n);                                  % Creates vector of polynomials from 1 to n
vpert = v; 
vpert(2) = vpert(2) + epsilon;   % Subtract eps from coefficient of x^6
r = roots(v);                                   % Roots of normal polynomial
rpert = roots(vpert);                   % Roots of perturbed polynomial

format long
pertable = [sort(r(:)) sort(rpert(:))]

%% 2. part c
dx = 0.05; 
x = 0 : dx : n+1;
y = polyval(v, x);
ypert = polyval(vpert, x);
perturbation = epsilon * x.^(n-1);

n1 = 1+(1/dx);  n2 = 1+(n/dx);   	% Indicies for x=1 and x=n respectively.
maxy = max(abs(y(n1:n2)));
maxypert = max(max(ypert(n1:n2)));
maxperturb = max(max(perturbation(n1:n2)));
maxy = 1.1 * max([maxy, maxypert, maxperturb]);

plot(x, y, x, ypert, '--', x, perturbation, ':', ...
		 1:n, zeros(1,n), 'o', x, zeros(size(x)), '-')
axis([0 n+1 -maxy maxy])
s = ['n = ', num2str(n), ', \epsilon = ', num2str(epsilon)];
title(s)
legend({'f(x)','f-hat(x)','Amount of perterbation','root'},'Location','north')
