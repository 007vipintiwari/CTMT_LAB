clc;
clear all;
A = [2 -12;1 -5];
x0 = [1;1];
m1 = 10;
for iter = 1:100
    x = A*x0;
    [m2,ind] = min((x(:)));
    if (abs(x/m2) < 0.0001)
        break;
    end
    x0 = x/abs(m2)
end
disp(x0)