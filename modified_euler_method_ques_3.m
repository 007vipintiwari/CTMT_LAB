% Using modified Euler’s method, find y(0.1), y(0.2) given that dy/dx =x2 + y2,
% y (0) = 1
clc;
f = @(x,y) x^2 + y^2;
x0 = 0;
y0 = 1;
h = 0.01;
for i = 1:10
    y1 = y0 + h*f((x0 + 0.5*h) , y0 + 0.5*h*f(x0,y0));
    x0 = x0 + h;
    y0 = y1;
end
fprintf("value of Y at x = 0.1 is %0.10f\n",y1);

x2 = 0;
y2 = 1;
h = 0.02;
for i = 1:10
    y3 = y2 + h*f((x2 + 0.5*h) , y2 + 0.5*h*f(x2,y2));
    x2 = x2 + h;
    y2 = y3;
end
fprintf("value of Y at x = 0.2 is %0.10f",y3);