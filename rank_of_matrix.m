A = [1 -1 2 3; 0 1 1 0 ; 1 0 3 3]
A(3,:) = A(3,:) - A(1,:);
A(3,:) = A(3,:) - A(2,:);
disp(A)
rank(A)