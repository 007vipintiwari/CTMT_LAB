%6.Find y(0.1), z(0.1) from the system of equations dy/dx=x+z and dz/dx=x-y
%2; given that y(0) =2, z(0) =1 by using Runga-Kutta method of 4th order
clc;
f1 = @(x,y,z)  x + z;
f2 = @(x,y,z) x - y^2;
x0 = 0;
y0 = 2;
z0 = 1;
h = 0.1;
   k1  = h*f1(x0,y0,z0);
   l1 = h*f2(x0,y0,z0);
   
   l2 = h*f2(x0 + h/2,y0 + k1/2,z0 + l1/2);
   k2 = h*f1(x0 + h/2,y0 + k1/2,z0 + l1/2);
   
   l3 = h*f2(x0 + h/2,y0 + k2/2,z0 + l2/2);
   k3 = h*f1(x0 + h/2,y0 + k2/2,z0 + l2/2);
   
   l4 = h*f2(x0 + h,y0 + k3,z0 + l3);
   k4 = h*f1(x0 + h,y0 + k3,z0 + l3);
   
   y0 = y0 + (k1 + 2*k2 + 2*k3 + k4)/6;
   z0 = z0 + (l1 + 2*l2 + 2*l3 + l4)/6;
   x0 = x0 + h;    
fprintf("fourth order :value of y(0.10) is %0.20f\n",y0);
fprintf("fourth order :value of z(0.10) is %0.20f\n",z0);