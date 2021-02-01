%code for question 1
clc;
x = [5 ,7 ,9 ,11 ,13 ,15];
y = [1.70 ,2.40 ,2.80 ,3.40 ,3.70 ,4.40];
n = 6;

sum_x = 0;
sum_y = 0;
x2 = x.*x;
y2 = y.*y;
xy = x.*y;
mean_x = sum(x)/n;
mean_y = sum(y)/n;
sum_xy = 0;
sum_xx = 0;
   
m = (n*sum(xy) - sum(x)*sum(y))/(n*sum(x2) - sum(x)*sum(x));
c = mean_y - m*mean_x;
x_value = 0:0.1:20;
for i = 1:length(x_value)
    Y(i) = m*x_value(i) + c;
end    
plot(x_value,Y,'--m',x,y,'*g');grid()
xlabel('Output (in thousand)');
ylabel('Profit per unit of Output (in Rs)');
title('Regression line plot');
legend('Estimated plot','Given data');


