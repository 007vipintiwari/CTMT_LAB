A = [2 -3 10 ; -1 4 2 ; 5 2 1];
b = [3 ; 20 ; -12];
Ab = [A , b];
n = length(A);
L = eye(n);


%making A(1,1) as pivot element
for i = 2:3
    m = Ab(i,1)/Ab(1,1);
    L(i,1) = m; % Lower Triangular matrix
    Ab(i,:) = Ab(i,:) - m*Ab(1,:);
end

%making A(2,2) as pivot element
i = 3;
m = Ab(i,2)/Ab(2,2);
L(i,2) = m;
Ab(i,:) = Ab(i,:) - m*Ab(2,:);

U = Ab(1:n,1:n);
%LUx = B
Y = inv(L)*b; % consider Ux = Y =>  LY = B => Y = inv(L)*B
X = inv(U)*Y