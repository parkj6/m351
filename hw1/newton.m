%	NEWTON.M

%	Math 351
%	Higdon

%	Use Newton's method to find roots of equation f(x) = 0,
%	Where f(x) = x^3 - 4x^2 + 3x + 1.

%	The following commands plot the function f in order to illustrate the approximate locations of the roots.
%	In the definition of vector x, the increment .02 is rather arbitrary. 
%	The main constraint is that the increment should be small enough that the graph looks smooth (otherwise, it's arbitrary).
%	A vector x could also be generated with the command linspace.
%	Matlab's "array" operations (i.e., vector operations) are used to compute the vector y of vertical coordinates.
x = -2 : 0.02 : 4;
y = x.^3 - 4*x.^2 + 3*x +1;
plot(x, y, x, zeros(size(x)))
axis([-2, 4, -5, 5])
title('Plot of f(x) = x^3 - 4x^2 +3x +1')
xlabel('x')
ylabel('y')


