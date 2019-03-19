%% Supplemental exercise for hw2.

%% Exercise 1
format long
a = 0.000015;
x = 1-a : a/100 : 1+a;
y = x.^3 - 3*x.^2 + 3*x -1;      % same as (x-1)^3
plot (x, y, 'o', x, zeros(size (x)));
title("y = x^3 -3x^2 + 3x -1");

%% Exercise 2
figure
% n = 3;            % initial values
% n = 21;
n = 30;
% n = 50;
% n = 100;

p = poly(1:n);
r = roots(p)
plot(real(r), imag(r),'o')
axis('equal')
