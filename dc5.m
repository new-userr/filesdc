clc;
clear all;
M=256;  %also take 64,128 for more readings
X=[0:M-1];
N=1;
OFF=0;
Z=pskmod(X,M);
figure(2);
scatterplot(Z,N,OFF,"r+")