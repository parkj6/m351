%% Jong Park (parkj6)
% Math 351 - Numerical Analysis 
% HW 4 - Data Fitting

%% Given
y = [1, 0.5, 0.4, 0.25, 0.1, 0.1, 0.05, 0.02, 0.01];
m = length(y);
x = 1:m;

%% 1. p(x) = c_1e^(-0.5x) + c_2e^(-x); c1, c2 are constants. 
%% a) Use appx relation to derive an overdetermined system
       
u = exp(-0.5.*x(:));         % e^(-0.5x)
v = exp(-x(:));              % e^(-x)

%% b) Find least-square solution
A = [u,v]
b = y(:)
c = A\b                     % Ac = b;

%% c) Plot p(x) with c1, c2. 

%x = graphable x from 0:10
xp = linspace(0,10);
%p(x) = c_1e^(-0.5x) + c_2e^(-x)
yp = c(1).*exp(-0.5.*xp) + c(2).*exp(-xp);

plot (xp, yp,'k', x, y,'ok');
title(sprintf("Approximation relation p(x) = c_1e^{-0.5x} + c_2e^{-x}"))
legend('p(x)','Initial Data','location','best')
ax = gca; ax.FontSize = 14; 

%% 2. p(x) = re^(sx); r, s are constants.
%% a) Use log to break re^(sx_i) and use the result to derive overdetermined system.

u = ones(m,1);
v = x(:);
A = [u,v]
b

%% b) Find least-square solution
c = A\log(b)            %Ac = b;

r = exp(c(1))
s = c(2)

%% c) Plot
figure
yp = r.*exp(s.*xp);
plot (xp,yp,'k', x,y,'ok')
title(sprintf("Approximation relation p(x) = re^{sx}"))
legend('p(x)','Initial Data','location','best')
ax = gca; ax.FontSize = 14; 

