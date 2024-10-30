clc;
clear all;

% OFDM Parameters
N = 64;              % Number of subcarriers
M = 16;              % Modulation order (QPSK)
cpLen = 16;         % Length of cyclic prefix
numSymbols = 100;   % Number of OFDM symbols
snr = 20;           % Signal-to-noise ratio in dB

% Generate random data
data = randi([0 M-1], numSymbols * N, 1); % Random data

% QPSK modulation
modData = pskmod(data, M, pi/4); % Modulate using QPSK

% OFDM Modulation
ofdmSymbols = reshape(modData, N, numSymbols); % Reshape data
ifftData = ifft(ofdmSymbols, N);               % IFFT
cyclicPrefix = ifftData(end-cpLen+1:end, :);  % Generate cyclic prefix
ofdmSignal = [cyclicPrefix; ifftData];         % Add cyclic prefix

% Transmit signal (add noise)
receivedSignal = awgn(ofdmSignal, snr, 'measured');

% OFDM Demodulation
receivedSignal = receivedSignal(cpLen+1:end, :); % Remove cyclic prefix
receivedOfdmSymbols = fft(receivedSignal, N);     % FFT

% QPSK Demodulation
receivedData = reshape(receivedOfdmSymbols, [], 1); % Reshape
demodData = pskdemod(receivedData, M, pi/4);         % Demodulate

% Calculate Bit Error Rate (BER)
ber = sum(data ~= demodData) / length(data);
disp(['Bit Error Rate: ', num2str(ber)]);