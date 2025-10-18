% Problem 3(a)
% Forward substitution
% L = []; all diagonal elements should be 1
% U = [];
% b = [];

% initialize y vector and size
[n,~] = size(L);
y = inf(n,1);

for i=1:n
    if L(i,i) == 0
        error('Matrix is singular.')
    end
    
    s = 0;
    for j=1:(i-1)
        s = s + L(i,j) * y(j);
    end

    y(i) = (b(i) - s);
end

fprintf("Forward substitution: Ly = b:\n");
fprintf("y =\n");
disp(y);


% Backwards substitution
x = inf(n,1);

for k=1:n
    i = n-k+1; % map 1:n to n:1
    if U(i,i) == 0
        error('Matrix is singular.')
    end
     
    s = 0;
    for j=(i+1):n
        s = s + U(i,j) * x(j);
    end

    x(i) = (y(i) - s) / U(i,i)
end

fprintf("Backwards substitution: Ux = y:\n");
fprintf("x =\n");
disp(x);

% Problem 3(b)
% Modify for general LU-decomp (diag elements of L may or may not be 1)

% Forward substitution
% L = []; all diagonal elements don't have to be 1
% U = [];
% b = [];

% initialize y vector and size
[n,~] = size(L);
y = inf(n,1);

for i=1:n
    if L(i,i) == 0
        error('Matrix is singular.')
    end
    
    s = 0;
    for j=1:(i-1)
        s = s + L(i,j) * y(j);
    end

    y(i) = (b(i) - s) / L(i,i) % add'tl division for non-1 diag elements
end

fprintf("Forward substitution: Ly = b:\n");
fprintf("y =\n");
disp(y);




