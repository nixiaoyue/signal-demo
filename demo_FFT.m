%% define time series signal
fs = 200;
T = 20;
tt = 1/fs:1/fs:T; % time vector
N = length(tt); % length of the signal

F = 1; % Frequency of the signal
A = 0.1; % Amplitude of the signal
ss = A*real(exp(-1j*(2*pi*F*tt+pi/4))); % Time series of the signal s(t)
nn = randn(size(ss)); % time series of the noise
xx = ss + nn; % time series of signal+noise

% plot
figure(1)
plot(tt, xx, tt, ss)
ylim([-4, 4])
xlabel('Time (s)')
ylabel('Signal (a.u.)')
legend({'Signal & Noise', '0.1sin(Ft+\pi/4)'}, 'Box', 'off', 'Orientation', 'Horizontal')


%% The Idea of Fourier Amplitude
d = cos(2*pi*(F+2)*tt+pi/4);
figure(21)
subplot(211)
plot(tt, ss, tt, d)
ylabel('Signal (a.u.)')
subplot(212)
plot(tt, ss.*d)
hold all
plot([tt(1), tt(end)], [mean(ss.*d), mean(ss.*d)], '--') 
mean(ss.*d)
xlabel('Time (s)')
ylabel('Signal (a.u.)')


d = cos(2*pi*(F)*tt+pi/4);
figure(22)
subplot(211)
plot(tt, ss, tt, d)
ylabel('Signal (a.u.)')
subplot(212)
plot(tt, ss.*d, 'k')
hold all
plot([tt(1), tt(end)], [mean(ss.*d), mean(ss.*d)], '--') 
mean(ss.*d)
xlabel('Time (s)')
ylabel('Signal (a.u.)')

%% fast fourier transform
y = fft(xx);
k1 = 1:N/2+1; % only first half matters for real measurements
P2 = abs(y/N);
P1 = P2(k1);
P1(2:end-1) = 2*P1(2:end-1);
ph = (angle(y));

figure(2)
loglog(k1/T,P1, 'k')
ylim([2e-5, 2e-1])
xlabel('Frequency (s)')
ylabel('FFT (a.u.)')

%% power spectral density
ww = fs*20;       % width of hanning window applied to each subseries
if mod(ww,2)~=0
    ww = ww-1;
end

% calc psd
[pp, ff] = pwelch(xx,hann(ww),ww/2,ww,fs); % power density spectrum of data
hold all
plot(ff, pp)
% plot(ff, sqrt(cumsum(pp*fs/ww)*2))
