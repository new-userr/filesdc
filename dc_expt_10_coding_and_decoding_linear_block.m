% Given H Matrix
H = [1 1 1 0 1 0 0;
     0 1 1 1 0 1 0;
     1 1 0 1 0 0 1];
k = 4; % Number of information bits
n = 7; % Codeword length

% Generating G Matrix
P = H';         % Transpose of H matrix
L = P;          % Copy of P matrix
L((5:7), :) = []; % Remove the last 3 rows to get a 4x3 matrix
I = eye(k);     % Identity matrix of size 4x4
G = [I L];      % Construct G matrix as [I | L]

% Generate U data vector, denoting all information sequences
no = 2^k; % Total number of information sequences
u = zeros(no, k); % Pre-allocate u matrix for efficiency

for i = 1:no
    for j = k:-1:1
        if rem(i-1, 2^(-j + k + 1)) >= 2^(-j + k)
            u(i, j) = 1;
        else
            u(i, j) = 0;
        end
    end
end
disp('Information sequences (u):');
disp(u);

% Generate codewords
c = rem(u * G, 2);
disp('Codewords (c):');
disp(c);

% Find the minimum Hamming distance
w_min = min(sum(c(2:no, :), 2)); % Exclude the all-zero codeword
disp('Minimum Hamming distance (w_min):');
disp(w_min);

% Given received codeword
r = [0 0 0 1 0 0 0];
disp('Received codeword (r):');
disp(r);

% Syndrome calculation
ht = H';  % Transpose of H for syndrome decoding
s = rem(r * ht, 2);
disp('Syndrome (s):');
disp(s);

% Error correction
for i = 1:size(ht, 1)
    if all(ht(i, 1:3) == s)
        r(i) = 1 - r(i); % Flip the bit at error position
        break;
    end
end

disp('The error is in bit:');
disp(i);
disp('The corrected codeword is:');
disp(r);




%{ 
1) H
2) G
3) no = 16
4) u 
5) %generate codewords
   c=rem(u*G,2))

6) %find the min distance
  w_min='min(sum((c((2:2^k,:))))'

7) %given recieved codewords
   r=[0 0 0 1 0 0 0];
8) r

9) p=[G(:,n-k+2:n)];

10) %find syndrome
    ht=transpose(H)

11) s=rem(r*ht,2)

%}
