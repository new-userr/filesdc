% dc_expt_10_coding_and_decoding_linear_block_codes
% Given H Matrix
H= [1 1 1 0 1 0 0;
0 1 1 1 0 1 0;
1 1 0 1 0 0 1];
k=4;
n=7;
%Generating G Matrix
%taking the H matrix transpose
P=H';
%making a copy of H transpose matrix
L=P;
%taking the last 4 rows of L and storing
L((5:7),:)=[];
%creating a identity matrix of size k*k
I=eye(k);
%making a 4*7 matrix
G=[I L];
%generate U data vector, denoting all information sequences
no=2^k;
%iterate through an unit-spaced vector
for i=1:2^k
%iterate through vector with specified increment
%or in simple words here we are decrementing 4 till we get 1
for j=k:-1:1
if rem(i-1,2^(-j + k + 1)) >= 2^(-j +k)
u(i,j)=1;
else
u(i,j)=0;
end
%to avoid displaying each iteration/loop value
echo off;
end
end
echo on;
u;
%generate codewords
c=rem(u*G,2);
%find the min distance
w_min='min(sum((c(2:2^k,:))))';
%given recieved codeword
r=[0 0 0 1 0 0 0];
r;
p=[G(:,n-k+2:n)];
%find syndrome
ht=transpose(H);
s=rem(r*ht,2);
for i=1 : 1 : size(ht)
if(ht(i,1:3)==s)
r(i)=1-r(i);
break;
end
end
disp('the error is in bit:')
disp(i)
disp('the corrected codeword is:')
disp(r)

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