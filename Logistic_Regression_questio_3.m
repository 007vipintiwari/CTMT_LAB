clear all;
clc;
x=[1 1.5 2 2.5 3 3.5 4];
y=[5.3 5.7 6.3 7.2 8.2 8.7 8.4];
n=length(x);
mx=sum(x)/n;
my=sum(y)/n;
sqx=sum(x.*x);
smxy=sum(x.*y);
b=(n*smxy-sum(x)*sum(y))/(n*sqx-(sum(x)*sum(x)));
xval=[-10:10];
yval=my+b.*(xval-mx);
z=1./(1+exp(-yval));
figure,plot(xval,z,"*")