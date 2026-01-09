% Load ECG signal with variables t, Ts, and x
load('ecg.mat');

% Filter using convolution
td = input('Enter td value:');

% Default h(t) over t to be zero
h = zeros(size(t));

% 0 < t < 2*td
hCuts = (t > 0) & (t< 2*td);
h(hCuts) = 116 * sinc(116 * (t(hCuts)-td));

y = conv(x,h) * Ts;
y = y(1:length(t));

% Plot convolution for filtering
figure;
plot(t,x, 'b', 'DisplayName','Original ECG');
hold on;
plot(t, y, 'g', 'DisplayName', 'Filtered ECG');
xlabel('Time (s)');
ylabel('Amplitude');
title('Question 1, HW 5 with td=', num2str(td));
legend;
grid on;

