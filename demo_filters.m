fs = 1000;

%% lowpass
fc = 300;
[b,a] = butter(6,fc/(fs/2));
freqz(b,a)
set(gcf, 'Position', [328   262   300   360]);

%% highpass
fc = 300;
[b,a] = butter(6,fc/(fs/2), 'high');
freqz(b,a)
set(gcf, 'Position', [328   262   300   360]);

%% bandpass
fc = [300,500];
[b,a] = butter(6,fc/(fs/2), 'bandpass');
freqz(b,a)
set(gcf, 'Position', [328   262   300   360]);

%% bandstop
fc = [300,500];
[b,a] = butter(6,fc/(fs/2), 'stop');
freqz(b,a)
set(gcf, 'Position', [328   262   300   360]);


