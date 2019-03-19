% Newton.m written from book

function root = newt1(x0,error_bd,max_iterate)

format short e
error =1;
it_count =0;
fprintf('\n it_count    x   f(x)    df(x)   error   \n');

while abs(error) >error_bd && it_count < max_iterate
    fx = f(x0);
    dfx = deriv_f(x0);
    if dfx == 0
        disp('The derivative is zero. sttop')
        return
    end
    x1 = x0 -fx/dfx;
    error = x1 - x0;
    %Internal print of the Newton method. 
    iteration = [it_count x0 fx dfx error]
    pause    %Tap the carriage return key to continue the computation.
    x0 = x1;
    it_count = it_count +1;
end

if it_count >= max_iterate
    disp('The number of iterates calcuated exceeded max_iterate.')
    disp('An accurate root was not calculated')
else
    format long
    root = x1;
    format short
end

%% Function to define equation for rootfinding problem.
function value = f(x)
value = x.^6 - x - 1;

%% Derivative of function defining equation for rootfinding problem.
function value = deriv_f(x)
value = 6*x.^5 - 1; 


