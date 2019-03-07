%% Jong Park (parkj6)
% Math 351 - Numerical Analysis 
% HW 4 - Data Fitting

%% Given
y = [1, 0.5, 0.4, 0.25, 0.1, 0.1, 0.05, 0.02, 0.01];
m = length(y);
x = 1:m;

%plot (x,y)

%% 1. p(x) = c_1e^(-0.5x) + c_2e^(-x); c1, c2 are constants. 
%% a)  Use appx relation to derive an overdetermined system

%Ac = b;


%% b) Find least-square solution
c = A\b
print c1
print c2

%% c) Plot p(x) with c1, c2 from b. 

% also plot (x1,y1) ,..., (xm,ym) with small circles.


%% 2. p(x) = re^(sx); r, s are constants.
%% a) Use log to break re^(sx_i) and use the result to derive overdetermined system.

%Ac = b;
% A = matrix
% b = vector
% c = vector of unknows.

%% b) Find least-square solution

print r
print s

%% c) Plot


%% Notes
x(:)  % will always turn x as column vector

% given x_1, ..., x_m
exp(-1(:))  % produces columnvectors with e^(-x_1), ..., e^(-x_m)

ones (m,1)  % produces m x 1 array with all entries = 1. 



