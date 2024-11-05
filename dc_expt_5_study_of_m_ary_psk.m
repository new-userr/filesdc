%dc_expt_5_study_of_m_ary_psk
clc;
clear all;
M=256;  %also take m= 16, 64, 128, 256 for more readings
X=[0:M-1];
N=1;
OFF=0;
Z=pskmod(X,M);
figure(2);
scatterplot(Z,N,OFF,"r+")
