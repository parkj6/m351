a=5;
b=10;
x=linspace(-4,10,50);
y_1=a*x+b;
y_2=(x.^2);
for i=1:length(x)
      if(a*x+b==(x.^2))
          printf(x)
    end
end
plot(x, y_1,'b-', 'LineWidth', 2);
hold on;
plot(x, y_2),'c-', 'LineWidth', 2;
grid on;
xRoots = roots([1, -a, -b])
y1 = a * xRoots(1) + b;
y2 = a * xRoots(2) + b;
plot(xRoots, [y1, y2],'ro', 'LineWidth', 2, 'MarkerSize', 13);