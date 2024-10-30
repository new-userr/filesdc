%%TIME AND FREQ. DOMAIN RESPONSE

clc;
clear all;
N = 64;              % Number of subcarriers
M = 16;              % Modulation order (QPSK)
cpLen = 16;         % Length of cyclic prefix
numSymbols = 1;     % Number of OFDM symbols (for visualization)
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

% Time Domain Response
figure;
subplot(2,1,1);
plot(real(ofdmSignal)); % Plot real part of the OFDM signal
title('Time Domain OFDM Signal');
xlabel('Samples');
ylabel('Amplitude');
grid on;

% Frequency Domain Response
frequencySpectrum = fft(ofdmSignal, 2048); % FFT of the OFDM signal
f = linspace(-0.5, 0.5, length(frequencySpectrum)); % Frequency axis
magnitudeSpectrum = abs(fftshift(frequencySpectrum)); % Shift zero frequency component to center

subplot(2,1,2);
plot(f, 20*log10(magnitudeSpectrum)); % Plot magnitude spectrum in dB
title('Frequency Domain OFDM Signal');
xlabel('Normalized Frequency');
ylabel('Magnitude (dB)');
grid on;
axis tight;

% Show the figure
sgtitle('OFDM Modulation: Time and Frequency Domain Responses');