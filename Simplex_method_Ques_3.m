%  3. Using Simplex method solve the Linear Programming problem to
%   minimize f=-2x1 - 7x2 + 2x3
%   subjected to
%   x1+2x2+x3≤1
%   -4x1-2x2+3x3≤2
%    xi≥0 for all i
clc;
Cj = [-1 3 -3 0 0 0]; 
Cb = [0 ;0 ; 0];
a = [3 -1 2 1 0 0 7; -2 -4 0 0 1 0 12 ; -4 3 8 0 0 1 10];
rows = 3;
columns = 7;
incoming_var = zeros(1,3);
outgoing_var = zeros(1,3);
b =[7 ; 12 ; 10];
Zj = zeros(1,columns);
cjZj = zeros(1,columns-1);
min_ratio = zeros(rows,1);
for m = 1:4
    for i = 1 : columns-1
        s = 0;
        for j = 1:rows
            s = s +  Cb(j,1)*a(j,i);
        end
        Zj(1,i) = s;  % finding Zj
    end  
    for k = 1:columns-1
        cjZj(1,k) = Cj(k) - Zj(1,k); %finding cj - Zj
    end  
    [max_value,key_column] = max(cjZj); %finding value and column index of incoming variable
    incoming_var(1,key_column) = 1;
    for i = 1:rows
        b(i,1) = a(i,columns);
    end
    
    for i = 1:rows
        if(a(i,key_column) > 0)
            min_ratio(i,1) = b(i,1)/a(i,key_column); 
        else
            min_ratio(i,1) = Inf;
        end              
    end
    [min_value,key_row] = min(min_ratio); %finding minimum ratio
    outgoing_var(1,key_row) = 1;
    key_element = a(key_row,key_column);  %key element
    
    for i = 1:columns
        a(key_row,i) = a(key_row,i)/key_element;    %making the key element unity 
    end 
    
    for i = 1:rows
       if i ~= key_row
            z = a(i,key_column);
            for j = 1:columns
                a(i,j) = a(i,j) - (a(key_row,j)*z);
            end    
       end    
    end 
    
    Cb(key_row,1)  = Cj(1,key_column); 
end
x1 = a(1,columns);
x2 = a(3,columns);
x3 = 0;
Z = 1*x1 - 3*x2 + 3*x3;
fprintf("X1 is %0.10f\n",x1);
fprintf("X2 is %0.10f\n",x2);
fprintf("X3 is %0.10f\n",x3);
fprintf("The optimal solution is %0.20f",Z);