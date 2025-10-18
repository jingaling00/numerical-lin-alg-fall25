% Problem 7(b)

A = [-1/2 1; -2 -5/2];
I = eye(2);
B_inv = inv(I - A);     
tol = 1e-8;
Nmax = 64;
errors = zeros(Nmax+1,1);  

% start with A^0 = I
Ak = I;                  
% partial sum
S = Ak; 

for N = 0:Nmax
    err = norm(B_inv - S, 2);
    errors(N+1) = err;
    fprintf('N = %2d,  ||B^{-1} - B_N^{-1}||_2 = %.3e\n', N, err)
    if err < tol
        fprintf('Tolerance reached at N = %d\n', N);
        break
    end
    Ak = Ak * A;
    S = S + Ak;
end
                

figure;
plot(0:N, errors(1:N+1), 'o-', 'LineWidth', 1.5);
xlabel('N');
ylabel('||B^{-1} - B_N^{-1}||_2');
title('Convergence of B_N^{-1} = \Sigma_{k=0}^N A^k for Matrix (ii)');
grid on;


