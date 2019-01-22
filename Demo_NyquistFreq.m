%define parameters
T = 1; % total time
F = 10; % driving frequency

% close to continuous
fs0 = 1e4;
tt0 = 1/fs0:1/fs0:T;

%%
% discrete signal
% fs_vec = [10, 20, 40, 80];
fs_vec = fliplr(round(logspace(log10(20), log10(101), 4)));
N = length(fs_vec); % number samples

fig_size =[7,7];
figure(1)
for ii=1:N 
    fs = fs_vec(ii);
%     ph = rand(1); % random phase
    tt = 0:1/fs:T;
    subplot(N, 1, ii)
    plot(tt0, sin(2*pi*F*tt0), 'k');
    hold all
    plot(tt, sin(2*pi*F*tt), 'o-')
    myfigpub2('', 'Signal', ['Fs = ' num2str(fs)], fig_size)
end
myfigpub2('Time (s)', 'Signal', ['Fs = ' num2str(fs)], fig_size)

