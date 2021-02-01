% 1. Using Picard’s method obtain y for x=0.1 given that dy/dx = 3x + y2
%; y=1 at x = 0
clc;
syms x;
f = @(x,y) 3*x + y^2;
x0 = 0;
y0 = 1;
Y = f(x,y0);
for i = 1:3
    g = y0 + int(Y,x);
    Y = f(x,g);
end

fprintf("%0.10f",subs(g,x,0.1));

