% code for Question Number 3
clc;
x = [1 ,2 ,3 , 4 ,5];
y = [2 , 6, 7 ,8 ,10];
n = 5;
x2 = x.*x;
xy = x.*y;
x2y = x.*x.*y;
x3 = x.*x.*x;
x4 = x.*x.*x.*x;
mean_x = sum(x)/n;
mean_y = sum(y)/n;

A = [n  sum(x) sum(x2); sum(x) sum(x2) sum(x3) ; sum(x2) sum(x3) sum(x4)];
B = [sum(y) ; sum(xy) ;sum(x2y)];
C = linsolve(A,B);
x_value = -5:0.1:20;
Y = zeros(1,length(x_value));

for i = 1:length(x_value)
    Y(i) = C(1) + C(2)*x_value(i) + C(3)*x_value(i)*x_value(i);
end    

plot(x_value,Y,'-r',x,y,'^b'); grid();
title('Regression Curve Plot');
xlabel('X axis');
ylabel('Y axis');
legend('Estimated plot','Given data');


z = C(1) + C(2)*7 + C(3)*7*7;
disp('value of y at x = 7');
disp(z);



