%1.The table below reveals the velocity ‘v’ of a body during the time ‘t’ specified. Find its
%acceleration at t=1.1.
clc;
X = [1,1.1,1.2,1.3,1.4];
Y = [43.1,47.7,52.1,56.4,60.8];
n = 5;
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