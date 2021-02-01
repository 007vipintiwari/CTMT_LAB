%code for question 6
clc;
x1 = [1 ,2 ,3 , 4];
x2 = [0, 1 ,2 , 3];
y  = [12 ,18 ,24 ,30];
n = 4;
x12 = x1.*x1;
x22 = x2.*x2;
x1x2 = x1.*x2;
x1y = x1.*y;
x2y = x2.*y;

A = [n  sum(x1) sum(x2) ; sum(x1)  sum(x12) sum(x1x2) ; sum(x2)  sum(x1x2)  sum(x22)];
B = [sum(y) ; sum(x1y) ; sum(x2y)];
C = linsolve(A,B);
[X1,X2] = meshgrid(x1,x2);


for j = 1:n
    for i = 1:n
        Y(j,i) = C(1) + C(2)*X1(j,i) + C(3)*X2(j,i);
    end
end
%mesh(x1,x2,Y);    
grid on;
surf(X1,X2,Y);
xlabel('X axis');
ylabel('Y axis');
zlabel('Z axis');
title('Multi regression 3-d plot');