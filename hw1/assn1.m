%% Jong Park (parkj6)
% Math 351 - Numerical Analysis
% HW 1


%% Initial Plot
x = -2: 0.02: 2;
y = -2: 0.02: 2;
plot(x, zeros(size(x)), 'b', zeros(size(y)),y,'b')
axis([-2, 2, -2, 2])
title("Plot of f(x) = x + e^{-Bx^2}")
xlabel('x')
ylabel('y')
hold on 


%% Part a
B = [1, 5, 10, 25, 50];   % Initial input
x = -2: 0.01: 2;          % Used for making pretty graphs

for k = 1 : length(B)
    bval = B(k);
    y = x + exp(-bval .* (x .^ 2));
    plot (x,y);
end

%% Part b
format short;
x = [-0.64, -0.40, -0.32, -0.22, -0.18];    % These are actually x0
max_iter = 20;
iterall = x;
for k = 1 : length(x)
    bval = B(k);
    xval = x(k);
    f =      'xval + exp(-bval .* (xval .^ 2))';
    fprime = '1 + 2*(-bval) * exp(-bval .* (xval .^ 2)) .* xval';
    iters(k) = xval;
    iter = [iters(k)];
    
    for j = 1 : max_iter
        xnew(k) = x(k) - eval(f) ./ eval(fprime);
        iter = [iter; xnew(k)];
        test = abs(xnew(k) -x(k)) ./ (abs(xnew(k))+eps);
        if max(test) < 10*eps, break, end
        x(k) = xnew(k);
        iter;
    end
    iters(k)
    iter
end

%% Changing the Format to long
format long;
iters;
% iterall