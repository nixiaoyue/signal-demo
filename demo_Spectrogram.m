t = 0:1/1e3:2;
y = chirp(t,0,1,250);

pspectrum(y,1e3,'spectrogram','TimeResolution',0.1,'OverlapPercent',99,'Leakage',0.85)
set(gcf, 'position', [334   353   280   160])