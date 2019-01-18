% Jong Park (parkj6)
% Math 351 - Numerical Analysis
% HW 1

x = -2: 0.02: 2;
y = -5: 0.2: 5;
plot(x, zeros(size(x)), 'b', zeros(size(y)),y,'b')
axis([-2, 2, -5, 5])
title("Plot of f(x) = x + e^{-Bx^2}")
xlabel('x')
ylabel('y')
input = [1, 5, 10, 25, 50];         % Input
hold on
format long

maxiterations = length(input);

x = [-2, 0.02, 2];	% Vector of starting values

iters = x;						% Used to accumulate iterations
for k = 1 : maxiterations  
    B = input(k);
    y = x + exp(-B .* x .^ 2);                    % string variable
 %   f = 'x + exp(-B .* x .^ 2)';                    % string variable
 %   fprime = '1 - 2 .* B .* exp(-B .* x .^ 2) .* x';		% string variable     % 5 by default
    
 %	xnew = x - eval(f) ./ eval(fprime);
 %	iters = [iters; xnew];
 %  test = abs(xnew -x) ./ (abs(xnew)+eps);
 %	if max(test) < 10*eps, break, end;
 %	x = xnew;
    plot (x, y)
% plot (x, zeros(size(x)), zeros(size(y)), y)



end

iters;

