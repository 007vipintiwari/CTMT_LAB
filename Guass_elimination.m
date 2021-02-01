A = [2 1 1 ; 3 2 3 ; 1 4 9];
b = [10 ; 18 ; 16];
AB = [A , b];
largest  = AB(1,1);
row_no = 1;
for i = 1:2 %finding the largest element in the first column
    if(largest < AB(i + 1,1))
        largest = AB(i + 1,1);
        row_no = i + 1;    
    end
end
temp = AB(1,:);
AB(1,:) = AB(row_no,:);
AB(row_no,:) = temp;
disp(AB)
%Guass elimination method

%making A(1,1) as pivot element
m = AB(2,1)/AB(1,1);
AB(2,:) = AB(2,:) - m*AB(1,:);
m = AB(3,1)/AB(1,1);
AB(3,:) = AB(3,:) - m*AB(1,:);

%making A(2,2) as pivot element
m = AB(3,2)/AB(2,2);
AB(3,:) = AB(3,:) - m*AB(2,:);

%displaying matrix
disp(AB)

%values of unknown
z = AB(3,end)/AB(3,3) % value of z
y = (AB(2,4) - (AB(2,3)*z))/AB(2,2) %value of y
x = (AB(1,4) - (AB(1,3)*z + AB(1,2)*y))/AB(1,1) %value of x

