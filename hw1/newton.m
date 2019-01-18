%	NEWTON.M

%	Math 351
%	Higdon

%	Use Newton's method to find roots of equation f(x) = 0,
%	Where f(x) = x^3 - 4x^2 + 3x + 1.

%	The following commands plot the function f in order to illustrate the 
%	approximate locations of the roots.
%	In the definition of vector x, the increment .02 is rather arbitrary. 
%	The main constraint is that the increment should be small enough that the 
%	graph looks smooth (otherwise, it's arbitrary).
%	A vector x could also be generated with the command linspace.
%	Matlab's "array" operations (i.e., vector operations) are used to compute 
%	the vector y of vertical coordinates.
x = -2 : 0.02 : 4;
y = x.^3 - 4*x.^2 + 3*x +1;
plot(x, y, x, zeros(size(x)))
axis([-2, 4, -5, 5])
title('Plot of f(x) = x^3 - 4x^2 +3x +1')
xlabel('x')
ylabel('y')

%	Apply Newton's Method/
%	The variables f and fprime are string variables that are evaluated when
%	Newton's method is executed.

f = 'x.^3 -4*x.^2 + 3*x +1';		% string variable
fprime = '3*x.^2 - 8*x + 3';		% string variable
maxiterations = 20;

%	Specify a vector of starting values for Newton's method, and then compute roots.
%	The fomula for Newton's method that is contained in the loop is stated in 
%	terms of a "vector division.
%	This means that the entries in vector x are operated on independently,
%	so that the final value of x is a list of roots corresponding to the various
%	starting values.
%	As new iterates are computed, they are added to the bottom of the array iters.

x = [0, 1.5, 3];				% Vector of starting values
iters = x;						% Used to accumulate iterations
for k = 1 : maxiterations,	% 20 by default
	xnew = x - eval(f) ./ eval(fprime);
	iters = [iters; xnew];
	test = abs(xnew -x) ./ (abs(xnew)+eps);
	if max(test) < 10*eps, break, end;
	x = xnew;
end

%	Switch to long format, display the final answer,
% 	and then turn off the longformat.
format long
iters
format

