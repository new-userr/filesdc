%%program for entropy and MI for noise free channel
clc;
clear all;
close all;
i=input('Enter no. of elements=');
q=input('Enter joint probabilities matrix=');
sum=0;
%probability P(x)
for n=1:i
w=0;
for m=1:i
p(n)=w+q(n,m)
w=p(n)
end
end
disp('P(x):');
disp(p);
%entropy H(x)
for n=1:i
H=sum+(p(n)*log2(1/p(n)));
sum=H;
end
disp('H(x):');
disp(H);
%conditional probability matrix
for n=1:i
for m=1:i
a(n,m)=q(n,m)/p(n);
end
end
disp('P(Y/X):');
disp(a);
%entropy H(Y/X)
d=0;
for n=1:i
for m=1:i
if(a(n,m)>0)
H1=d+(a(n,m)*log2(1/a(n,m)));
d=H1
end
end
end
disp('H(Y/X):');
disp(H1);
%MI
m=H-H1;
disp('MI=');
disp(m);
%probability P(Y)
for n=1:i
w=0;
for m=1:i
s(n)=w+q(m,n);
w=s(n);
end
end
disp('P(Y):');
disp(s);
%entropy H(Y)
k=0;
for n=1:i
H2=k+(s(n)*log2(1/s(n)));
k=H2
end
disp('H(Y):');
disp(H2);