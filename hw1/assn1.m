%% Jong Park (parkj6)
% Math 351 - Numerical Analysis
% HW 1


%% Initial Plot
x = -2: 0.01: 2;
y = -2: 0.01: 2;
plot(x, zeros(size(x)), 'b', zeros(size(y)),y,'b');
axis([-2, 2, -2, 2]);
title("Plot of f(x) = x + e^{-Bx^2}");
xlabel('x');
ylabel('y');
hold on;         % to what you got


%% Part a
B = [1, 5, 10, 25, 50];                  % Initial input
x = -2: 0.01: 2;                         % Used for making pretty graphs

for k = 1 : length(B)
    bval = B(k);
    y = x + exp(-bval .* (x .^ 2));
    plot (x,y);
end

%% Part b
x = [-0.60, -0.40, -0.30, -0.25, -0.20]; % These are actually x0
max_iter = 20;
f =      'x + exp(-B .* (x .^ 2))';
fprime = '1 + 2.*(-B) .* exp(-B .* (x .^ 2)) .* x';
iters = [0,x];                           % Start at iteration 0
for j = 1 : max_iter                     % Max 20 iterations
    xgood = x - eval(f) ./ eval(fprime);
    iters = [iters; j, xgood];            % Added iteration #
    test = abs(xgood -x) ./ (abs(xgood)+eps);
    if max(test) < 10*eps, break, end
    x = xgood;
end

format long;                             % Changing the format to long
iters;                                   % Display iterations.

%% Part c
for k = 1 : length(B)
    figure                               % Used to make individual charts
    x = -2: 0.01: 2;         
    y = -2: 0.01: 2;
    plot(x, zeros(size(x)), 'b', zeros(size(y)),y,'b')
    axis([-2, 2, -2, 2])
    title(sprintf("Plot of f(x) = x + e^{- %d x^2}",B(k)))
    xlabel('x')
    ylabel('y')
    hold on     
 
    y = x + exp(-B(k) .* (x .^ 2));      % Individual graphs
    plot (x,y);
    
    x = -2: 0.01: 2;
    m = 1 + 2.*(-B(k)) .* exp(-B(k) .* (xgood(k) .^ 2)) .* xgood(k); % slope
    y = m .* x - m .* xgood(k);           % Graph of the new slope
    plot (x,y)
    hold off
end

x = [0 0 0 0 0];                         % All x0 = 0;
max_iter = 20;
f =      'x + exp(-B .* (x .^ 2))';
fprime = '1 + 2.*(-B) .* exp(-B .* (x .^ 2)) .* x';
iters = [0,x];                           % Start at iteration 0
for j = 1 : max_iter                     % Max 20 iterations
    xbad = x - eval(f) ./ eval(fprime);
    iters = [iters; j, xbad];           % Added iteration #
    test = abs(xbad -x) ./ (abs(xbad)+eps);
    if max(test) < 10*eps, break, end
    x = xbad;
end

%% Changing the Format to short;
format short 
iters