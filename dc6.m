clc;
clear all;
close all;
choice = input('Enter 1:BPSK, 2:QPSK, 3:MSK, 4:16-QASK, 5:QPR, 6:MPSK, 7:ortho.MFSK-')
SNR = input('Enter Eb/eta ratio i.e. bit energy to twice of PSD-')
if choice>4,
    M=input('Enter no. of symbols in integer power of 2-');
end
if choice<4,
    pe=0.5*erfc(sqrt(SNR));
end
if choice==4,
    pe=0.5*erfc(sqrt(pi*pi*SNR/16));
end
if choice==6,
    N=log2(M);
    pe=erfc(sqrt(N*SNR)*sin(pi/M));
end
if choice==7,
    N=log2(M);
    pe=((M-1)/2)*erfc(sqrt(N*SNR/2));
end
Error_Probability=pe