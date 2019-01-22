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
x = [-0.60, -0.40, -0.30, -0.25, -0.20];    % These are actually x0
max_iter = 20;
f =      'x + exp(-B .* (x .^ 2))';
fprime = '1 + 2.*(-B) .* exp(-B .* (x .^ 2)) .* x';
%     iters(k) = xval;
iters = x;
for j = 1 : max_iter       % 20 by default
    xnew = x - eval(f) ./ eval(fprime);
    iters = [iters; xnew];
    test = abs(xnew -x) ./ (abs(xnew)+eps);
    if max(test) < 10*eps, break, end
    x = xnew;
end

%% Changing the Format to long
format long;
iters
% iterall