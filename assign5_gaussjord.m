% GAUSSIAN ELIMINATION WITH BACKWARD SUBSTITUTION ALGORITHM 6.1
% To solve the n by n linear system for augmented matrix A
A = [2 -1 2 -2 -14;
    0 -1 0 0 -2;
    -4 1 -4 -8 -34
    -6 -3 7 -4 -33];
single(A)
pause
N=min(size(A));
L=zeros(N,N);
P=eye(N,N);
PI=eye(N,N);
TRUE = 1;
FALSE = 0;
OK=TRUE;
% STEP 1
% Elimination Process
NN = N-1;
M = N+1;
ICHG = 0;
I = 1;
while OK == TRUE & I <= N % Change to N 
    % STEP 2
    % use IP instead of I
    IP = I;
    while IP <= N & abs(A(IP,I)) <= 1.0e-20
        IP = IP+1;
    end
    if IP == M
        OK = FALSE;
    else
        % STEP 3
        if IP ~= I
            for JJ = 1:M
                C = A(I,JJ);
                A(I,JJ) = A(IP,JJ);
                A(IP,JJ) = C;
            end;
            PI=eye(N,N);
            PI(I,I)=0; PI(IP,IP)=0;
            PI(I,IP)=1; PI(IP,I)=1;
            P=PI*P;
            ICHG = ICHG+1;
            ['interchange rows ', num2str(I), ' and ', num2str(IP)]
            single(A)
            pause
        end;
        % STEP 4
        JJ = I+1;
        for J = [1:I-1,I+1:N] % Change to eliminate for columns above and below i-th row
            % STEP 5
            % use XM in place of l(J,I)
            XM = A(J,I)/A(I,I);
            % STEP 6
            for K = JJ:M
                A(J,K) = A(J,K) - XM * A(I,K);
            end;
            % Multiplier XM could be saved in A(J,I).
            A(J,I) = 0;
            L(J,I)= XM;
        end;
    end;
    if IP~=I
        L=PI*L;
    end
    I = I+1;
    single(A)
    pause
end;
if OK == TRUE
    % STEP 7
    if abs(A(N,N)) <= 1.0e-20
        OK = FALSE;
    else
        % STEP 8
        % start backward substitution
        X=A(:,M)
        pause
        X(N) = A(N,M) / A(N,N);
        X
        pause
        % STEP 9
        for K = 1:NN
            I = NN-K+1;
            JJ = I+1;
            SUM = 0;
            for KK = JJ:N
                SUM = SUM - A(I,KK) * X(KK);
            end;
            X(I) = (A(I,M)+SUM) / A(I,I);
            X
            pause
        end;
        
        OUP = 1;
        fprintf (OUP, '\n\nwith %d row interchange(s)\n', ICHG);
    end;
end;
if OK == FALSE
    fprintf(1,'System has no unique solution\n');
end;

