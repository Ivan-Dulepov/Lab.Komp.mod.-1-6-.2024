% Compute power spectrum

% Generated by MATLAB(R) 24.1 and Signal Processing Toolbox 24.1.
% Generated on: 30-Sep-2024 02:44:50

% Parameters
timeLimits = [0 0.53]; % seconds
frequencyLimits = [0 500]; % Hz
leakage = 1;

%%
% Index into signal time region of interest
currentSpectr_ROI = currentSpectr(:);
sampleTime = 0.0002; % seconds
startTime = 0; % seconds
minIdx = ceil(max((timeLimits(1)-startTime)/sampleTime,0))+1;
maxIdx = floor(min((timeLimits(2)-startTime)/sampleTime,length(currentSpectr_ROI)-1))+1;
currentSpectr_ROI = currentSpectr_ROI(minIdx:maxIdx);

% Compute spectral estimate
% Run the function call below without output arguments to plot the results
[PcurrentSpectr_ROI, FcurrentSpectr_ROI] = pspectrum(currentSpectr_ROI,seconds(sampleTime), ...
    'FrequencyLimits',frequencyLimits, ...
    'Leakage',leakage);
figure
time321 = 0:0.0002:0.53;
plot(time321, currentSpectr_ROI);
grid("minor");
xlabel('t, с');
ylabel('I1, А');
title("Исследуемый сигнал (Ток на входе трансформатора)");
xlim([0.4 0.4833]);
ylim([-80 80]); 
figure
time123 = 0:(500/(length(PcurrentSpectr_ROI)-1)):500;
plot(time123, sqrt(PcurrentSpectr_ROI));
grid("minor");
ylabel("Амплитуда, А");
xlabel("Частота, Гц");
title("Спектральный анализ тока в цепи питания УВ");