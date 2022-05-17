[y,fs] = audioread('DTMF_dialing.ogg');
y = y(42400:43100);
plot(y);
sound(y,fs);

T = 1/fs;
n = length(y);
t = (0: n-1)'  * T;
f = (0: n-1)' * fs / n;
subplot(1,2,1);
plot(t,y);
subplot(1,2,2);
plot(f, abs(fft(y)));
