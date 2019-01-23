%% define time series signal
fs = 2e3;
T = 100;
tt = 1/fs:1/fs:T; % time vector
N = length(tt); % length of signal

F = 11;
A = 0.1;
ss = A*real(exp(-1j*(2*pi*F*tt+pi/4))); % signal
nn = randn(size(ss)); % noise
xx = ss + nn; % signal+noise

% plot
figure(1)
plot(tt, xx, tt, ss)
ylim([-4, 4])
xlabel('Time (s)')
ylabel('Signal (a.u.)')
legend({'Signal & Noise', '0.1sin(Ft+\pi/4)'}, 'Box', 'off', 'Orientation', 'Horizontal')

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
