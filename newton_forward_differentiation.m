%1. From the following table, find the first two derivatives of x1/3 at x=50 and x=56.
clc;
X = [50,51,52,53,54,55,56];
Y = [3.6840 ,3.7084 ,3.7325 ,3.7563 ,3.7798 ,3.8030 ,3.8259];
n = 7;
h = X(2) - X(1);

syms x;
syms p;
p = (x - X(1))/h;
for i = 1:n-1
    d(i,1) = Y(i + 1) - Y(i);
end
for j = 2:n-1
    for i = 1:n-j
        d(i,j) = d(i + 1,j-1) - d(i,j-1);
    end
end
%Newton Forward Interpolation Formula
y = 0;
for i = 1:n-1
    prod = 1;
    for j = 0:i-1
        prod = prod * ((p - j)/(j+1));
    end  
    y = y + prod*d(1,i);
end    
dydx1 = diff(y);
x = input("Enter the first value of x :");
fprintf("value of first derivative using  Newton forward formula at x = %d is %0.20f\n",x,subs(dydx1));
dydx2 = diff(dydx1);
fprintf("value of second derivative using  Newton forward formula at x = %d is %0.20f\n",x,subs(dydx2));

%Newton Backward Interpolation Formula
syms x1;
syms u;
u = (x1 - X(n))/h;
q = 0;
for i = 1:n-1
    prod = 1;
    for j = 0:i-1
        prod = prod * ((u + j)/(j+1));
    end  
    q = q + prod*d(n-i,i);
end    
dqdx1 = diff(q);
x1 = input("Enter the second value of x :");
fprintf("value of first derivative using  Newton backward formula at x = %d is %0.20f\n",x_news,subs(dqdx1));
dqdx2 = diff(dqdx1);
fprintf("value of second derivative using  Newton backward formula at x = %d is %0.20f\n",x_news,subs(dqdx2));
