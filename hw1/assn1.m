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

%% Part 1
B = [1, 5, 10, 25, 50];    % Initial input

x = -2: 0.01: 2;            % -2 <= x <= 2
for k = 1 : length(B)
    y = x + exp(-B(k) .* (x .^ 2));
    plot (x,y);
    
    if y == 0
        root = x;
    end
    root;
    
end

%% Changing the Format to long
format long

