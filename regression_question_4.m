%code for question 4;
clc;
x = [1 ,2 ,3 , 4 ];
y = [1.65 , 2.70 , 4.50 ,7.35];
n = 4;
Y = log10(y);

x2 = x.*x;
sum_x = sum(x);
sum_Y = sum(Y);
xY = x.*Y;
sum_x2 = sum(x2);

A = [n  sum_x ; sum_x  sum_x2];
B = [sum(Y) ; sum(xY)];
C = linsolve(A,B);

a = 10^C(1);
b = C(2)/log10(exp(1));
%finding value y = a*exp(b*x) at x = 6;
x_val = 6;
y_equation = a*exp(b*x_val);
disp('value of y at x = 6');
disp(y_equation);

x_value = -2:0.1:8;
Y_value = zeros(1,length(x_value));

for i = 1:length(x_value)
    Y_value(i) = a*exp(b*x_value(i));
end    

plot(x_value,Y_value,'-r',x,y,'^b'); grid();
title('Question 4 Regression Curve Plot');
xlabel('X axis');
ylabel('Y axis');
legend('Estimated plot','Given data');






