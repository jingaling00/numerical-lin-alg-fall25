% Problem 2
x = [1, 1, 2, 2, 3, 3].';
x1 = norm(x,1);
x2 = norm(x,2);
xe = norm(x);
xinf = norm(x,inf);

% Problem 4
A = [-2 0 ; 6 -4];
Arho = max(abs(eig(A)));
A1 = norm(A,1);
Af = norm(A,"fro");
A2 = norm(A,2);
Ainf = norm(A,inf);

B = [-3 -6 ; 4 7];
Brho = max(abs(eig(B)));
B1 = norm(B,1);
Bf = norm(B,"fro");
B2 = norm(B,2);
Binf = norm(B,inf); 