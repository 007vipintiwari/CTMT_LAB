% 2. Find y approximately for x = 0.1 by Euler’s method: given
%dy/dx =(y-x)/(y+x) with x=0, y=1. 
f = @(x,y) (y - x)/(y + x);
h = 0.01;
x0 = 0.00;
y0 = 1;
for i = 1:10
    y1 = y0 + h*f(x0,y0);
    x0 = x0 + h;
    y0 = y1;
    %disp(y1);
end
%disp(y1);
fprintf("%0.10f + value at x= 0.1",subs(0.01));