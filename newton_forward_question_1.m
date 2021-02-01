clc;
clear all;
X = [1893 , 1903 ,1913 ,1923 ,1933];
Y = [48 , 69 ,83 , 91 ,98];
h = X(2) - X(1);
n = 5;
x = input('Enter the value of x :');
for i = 1:n-1
    d(i ,1) = Y(i + 1) - Y(i);
end
for j = 2:n-1
    for i = 1:n-j
        d(i,j) = d(i + 1,j-1) - d(i,j-1);
    end
end

p = (x - X(1))/h;
prod = 1;
y = Y(1);
for t = 1:n-1
    prod = prod*(p-t+1)/t;
    y = y + prod*d(1,t);
end    
disp(y)