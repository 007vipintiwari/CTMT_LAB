%Question Number 2
clc;
x = [1.0 ,1.5 ,2.0 ,2.5 ,3.0 ,3.5 ,4.0];
y = [5.3 ,5.7 , 6.3 , 7.2 , 8.2 , 8.7 8.4 ];
n = 7;

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
x_value = -5:0.1:5;
Y = zeros(1,length(x_value));
for i = 1:length(x_value)
    Y(i) = m*x_value(i) + c;
end    
plot(x_value,Y,'--r',x,y,'db');grid()
xlabel('X axis');
ylabel('Y axis');
title('Regression Line Plot');
legend('Estimated plot','Given data');



