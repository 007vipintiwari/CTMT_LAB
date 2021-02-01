clc;
X = [0,1,2,3,4,5,6];
n = 7;
h = 1;
for i = 1:n
    Y(i) = (1/(1 + X(i)^2));
end


%using trapezoidal rule
disp("Using trapezoidal rule");
trapezoidal  = Y(1) + Y(n);
for i = 2:n-1
    trapezoidal = trapezoidal + 2*Y(i);
end
trapezoidal = (trapezoidal*h)/2;
disp(trapezoidal);


%using Simpson's 1/3rd rule;
simpson = Y(1) + Y(n);
for i = 2:n-1
    z = mod(i,2);
    if z == 0
        simpson = simpson + 4*Y(i);
    else
        simpson = simpson + 2*Y(i);
    end    
end 
simpson = (simpson*h)/3;
disp("Using Simpson's 1/3rd rule");
disp(simpson);

%using Simpson's 3/8th rule

simpson_38th = Y(1) + Y(n);
for i = 2:3:n-1
    simpson_38th = simpson_38th + 3*Y(i); 
end 

for i = 3:3:n-1
    simpson_38th = simpson_38th + 3*Y(i); 
end 
for j = 4:3:n-1
    simpson_38th = simpson_38th + 2*Y(j); 
end   
simpson_38th = (simpson_38th*3*h)/8;
disp("Using Simpson's 3/8th rule");
disp(simpson_38th);