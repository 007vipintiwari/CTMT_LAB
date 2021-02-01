clc;
clear all;
X = [20 , 25 , 30 ,35 ,40 , 45];
Y = [354 , 332 ,291 , 260 , 231 , 204];
h = X(2) - X(1);
n = 6;
x = input('Enter the value of x :');
for i = 1:n-1
    d(i ,1) = Y(i + 1) - Y(i);
end
for j = 2:n-1
    for i = 1:n-j
        d(i,j) = d(i + 1,j-1) - d(i,j-1);
    end
end

p = (x - X(6))/h;
prod = 1;
y = Y(6);
for i= 1:5
    prod = 1;
    for t = 1:i
        prod = prod*(p+t-1)/t;      
    end
    y = y + prod*d(6-i,i);
end    
disp(y)