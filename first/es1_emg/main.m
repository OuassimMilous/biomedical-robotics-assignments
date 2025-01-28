clear;
clc;

%% Step 1: Load and extract the data
load("ES1_emg.mat");

% Extraction of the EMG signal & movement signals
EMG_signal = Es1_emg.matrix(:, 1);          
movement_signal = Es1_emg.matrix(:, 2:4);   % (X, Y, Z)

Fs = 2000;  % Sampling frequency
t = (0:length(EMG_signal)-1) / Fs;    % Time vector based on sampling frequency

%% Step 2: Filter the EMG signal (band-pass 30-450 Hz)

% Parameters for the FIR filter
bp_low = 30;             
bp_high = 450;          
filter_order = 500;          

% FIR band-pass filter
bp_filter = fir1(filter_order, [bp_low, bp_high] / (Fs / 2), 'bandpass');

% Zero-phase digital filtering
filtered_EMG = filtfilt(bp_filter, 1, EMG_signal);

%% Step 3: Rectify the filtered EMG signal
rectified_EMG = abs(filtered_EMG);

%% Step 4: Compute the envelope of the rectified EMG (low-pass 3-6 Hz)

% Low-pass cutoff frequency for envelope
lp_cutoff_env = 6;   

% FIR low-pass filter
filter_order_env = 500;     
lp_filter_env = fir1(filter_order_env, lp_cutoff_env / (Fs / 2), 'low');

% Compute the envelope
envelope_EMG = filtfilt(lp_filter_env, 1, rectified_EMG);


%% Step 5: Downsample the envelope for analysis
downsample_factor = 10;      % Downsizes from 2000 Hz to 200 Hz

downsampled_envelope = downsample(envelope_EMG, downsample_factor);
t_downsampled = t(1:downsample_factor:end);

%% Additional Step
% Normalization of the movement signal
movement_signal_norm = (movement_signal - min(movement_signal(:))) / (max(movement_signal(:)) - min(movement_signal(:)));

% Normalization of the downsampled EMG envelope
downsampled_envelope_norm = (downsampled_envelope - min(downsampled_envelope)) / (max(downsampled_envelope) - min(downsampled_envelope));


%% Plotting
figure;

% Subplot 1: Raw EMG overlaid with Filtered EMG
subplot(3, 1, 1);
plot(t, EMG_signal, 'b', 'DisplayName', 'Raw EMG');
hold on;
plot(t, filtered_EMG, 'r', 'DisplayName', 'Filtered EMG');
title('Raw EMG Signal and Filtered EMG Signal');
xlabel('Time (s)');
ylabel('Amplitude');
legend('show');
hold off;

% Subplot 2: Rectified EMG overlaid with Envelope
subplot(3, 1, 2); 
plot(t, rectified_EMG, 'b', 'DisplayName', 'Rectified EMG');
hold on;
plot(t, envelope_EMG, 'r', 'DisplayName', 'EMG Envelope');
title('Rectified EMG Signal and Envelope');
xlabel('Time (s)');
ylabel('Amplitude');
legend('show');
hold off;

% Subplot 3: Normalized Movement Signals overlaid with a Normalized EMG Envelope
subplot(3, 1, 3); 
plot(t, movement_signal_norm(:, 1), 'b', 'DisplayName', 'Deltoid Accelerometer X');
hold on;
plot(t, movement_signal_norm(:, 2), 'g', 'DisplayName', 'Deltoid Accelerometer Y');
plot(t, movement_signal_norm(:, 3), 'm', 'DisplayName', 'Deltoid Accelerometer Z');
plot(t_downsampled, downsampled_envelope_norm, 'r', 'DisplayName', 'EMG Envelope');
title('Normalized Movement Signals and EMG Envelope');
xlabel('Time (s)');
ylabel('Normalized Amplitude');
legend('show');
hold off;

%% Answering the questions

% 1. Why is the down-sampling performed after the envelope computation?

% The down-sampling of a given signal is a two-step process, which requires
% first to reduce high-frequency signal components with a digital lowpass
% filter (done by the envelope). Otherwise, downsampling by itself would 
% create undesirable aliasing. This is because of the Nyquist theorem,
% which requires that the sampling rate be at least 2 times the highest
% frequency of the signal.


% 2. Based on the motion signal, when does the muscle activation commence 
% in relation to the movement?

% By quick inspection of the (normalized) movement signal overlaid with 
% the EMG envelope signal, we can observe the muscle activation occurs as
% soon as the EMG signal begins a significant increase in amplitude in relation 
% to its inactive low state. The movement corresponding to the "Deltoid 
% Accelerometer Y" signal, happens close to 500-600 ms after the 
% muscle activation.
% This time difference reflects the fact that the muscle must activate
% first in order to initiate the movement.

