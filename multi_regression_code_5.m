%code for question 5
%multiple regression
clc;
x1 = [19,51,30,42,25,18,44,56,38,32,25,10,20,27,13,49,27,55];
x2 = [8,15,11,21,7,5,10,13,12,13,5,6,4,8,7,12,6,16];
y  = [4,5,3,3,2,1,4,6,3,4,2,3,4,4,3,5,3,7];
n = 18;
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
xlabel('Yield of dry bark (oz.)');
ylabel('Height of 6’’ (in.)');
zlabel('Girth at a height of 6’’ (in.)');
title('Multi regression 3-d plot');
