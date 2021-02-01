% Given y’ = x2 –y, y(0)=1, find y(0.1) by using Runga-Kutta methods of (i)
% Second Order, and (ii) fourth order.
syms x;
syms y;
f = @(x,y) x^2 - y;
x0 = 0;
y0 = 1;
h = 0.1;
%(i) second order
K(1) = h*f(x0,y0);
K(2) = h*f((x0 + h),(y0 + K(1)));
delta_Y = (K(1) + K(2))/2;
Y1 = y0 + delta_Y;
fprintf("value of y at x = 0.1 using second order is %0.10f\n",Y1);
%(ii) fourth order
k(1) = h*f(x0,y0);
for i = 2:3
     k(i) = h*f(x0 + 0.5*h,y0 + k(i-1)/2);  
end  
k(4) = h*f(x0 + h,y0 + k(3));
delta_y = (k(1) + 2*k(2) + 2*k(3) + k(4))/6;
y1 = y0 + delta_y;
fprintf("value of y at x = 0.1 using fourth order is %0.10f\n",y1);