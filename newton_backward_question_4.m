clc;
clear all;
X = [0 , 1 , 2 ,3 ,4 ];
Y = [3 , 6 ,11 , 18 , 27];
h = X(2) - X(1);
n = 5;
x = [-7:0.01:7];
[m,x_len] = size(x);
for i = 1:n-1
    d(i ,1) = Y(i + 1) - Y(i);
end
for j = 2:n-1
    for i = 1:n-j
        d(i,j) = d(i + 1,j-1) - d(i,j-1);
    end
end

for i = 1:x_len
    p = (x - X(5))/h;
    y = Y(5);
    for i= 1:4
        prod = 1;
        for t = 1:i
            prod = prod .*(p+t-1)/t;      
        end
        y = y + prod .*d(5-i,i);
    end 
    plot(x,y,'--c',X,Y,'*m'),grid
    xlabel('X axis')
    ylabel('Y axis')
    xticks(-7:1:7)
    yticks(0:8:100)
end