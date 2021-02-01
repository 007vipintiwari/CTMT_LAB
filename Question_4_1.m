p = [2 3 4;3 4 5;4 5 6;5 6 7];
q = p(:,2:3); %removes first column from p
disp(q);
m = p(:,3);  %removes first and second column from matrix p
disp(m);
z = q(1:2,:); % a sub-matrix of size 2*2
disp(z);
q(2,2) =  8;
disp(q)

