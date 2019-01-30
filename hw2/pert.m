% PERT.M

% Math 351
% Higdon

% Demonstrate some effects of perturbing the coefficient of x^(n-1) in the 
% polynomial  (x-1)(x-2)(x-3)*...*(x-n)

% Use the function 'poly' to generate the coefficients of the polynomial in 
% expanded form, perturb a coefficient, and then compute and display the roots
% of the original and perturbed polynomials.

% USAGE:  At the command line, specify n and epsilon, and then execute this m-file.
% 		Examples:
% 		n = 7;  epsilon = -.002;	pert
% 		n = 20; epsilon = 1e-9;		pert
% 		n = 21; epsilon - 0; 		pert

% NOTE: The computed roots of the unperturbed polynomial may show some errors,
% due to the ill-conditioning of the roots. The computed roots of the perturbed 
% polynomial illustrate this ill-conditioning more vividly.

v = poly(1:n);
vpert = v; 
vpert(2) = vpert(2) + epsilon;
r = roots(v);
rpert = roots(vpert);

format long
[sort(r(:)) sort(rpert(:))]
format

% Graph the unperturbed polynomial, the perturbed polynomial, and the amount of 
% peturbation in the function values.
% the amount of perturbation is     epsilon * x^(n-1).
% Also, put small circles at the roots of the unperturbed polynomial.

dx = 0.05; x = 0 : dx : n+1;
y = polyval(v, x);
ypert = polyval(vpert, x);
perturbation = epsilon * x.^(n-1);

% Determine a suitable vertical scale for the graph. For each of the functions
% plotted, find the maximum absolute value for 1 <= x <= n, and then multiply
% the maximum of those maxima by 1.1

n1 = 1+(1/dx);  n2 = 1+(n/dx);   	% Indicies for x=1 and x=n respectively.
maxy = max(abs(y(n1:n2)));
maxypert = max(max(ypert(n1:n2)));
maxperturb = max(max(perturbation(n1:n2)));
maxy = 1.1 * max([maxy, maxypert, maxperturb]);

plot(x, y, x, ypert, '--', x, perturbation, ':', ...
		x, zeros(size(x)), '-', 1:n, zeros(1,n), 'o')
axis([0 n+1 -maxy maxy])
s = ['n = ', num2str(n), ', \epsilon = ', num2str(epsilon)];
title(s)
