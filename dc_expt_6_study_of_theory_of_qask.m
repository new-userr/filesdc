clc;
clear all;
close all;

% Prompt the user to select a modulation scheme
choice = input('Enter 1 for BPSK, 2 for QPSK, 3 for MSK, 4 for 16-QAM, 5 for MPSK, 6 for MFSK: ');

% Define constants
M = 16;
SNR = 25;

% Compute error probability based on modulation choice
if choice == 1 || choice == 2 || choice == 3
    % BPSK, QPSK, MSK
    pe = 0.5 * erfc(sqrt(SNR));
elseif choice == 4
    % 16-QAM
    pe = 2 * erfc(sqrt(0.4 * SNR));
elseif choice == 5
    % MPSK
    pe = 0.5 * erfc(sqrt(pi^2 * SNR / 16));
elseif choice == 6
    % MFSK
    N = log2(M);
    pe = erfc(sqrt(N * SNR) * sin(pi / M));
else
    error('Invalid choice. Please enter a valid option (1-6).');
end

% Display error probability
Error_Probability = pe
