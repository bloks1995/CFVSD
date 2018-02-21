s = serial ('COM4');
s.BaudRate = 115200;
fopen(s);
init = fscanf(s)
data = zeros(0,1);
N = 10000 %number of samples
temp = fscanf(s)
for i = 1:N
    temp = fscanf(s, '%x\n')
    i
    data = [data;temp];
end
fclose(s);
delete(s);
MASK = hex2dec('ffff')
datai = zeros(N,1);
dataq = zeros(N,1);
for i = 1:N
    datai(i) = uint16(bitand(MASK, data(i,1)));
    if datai(i) > 32768
        datai(i) = datai(i) - 65536;
    end    
    dataq(i) = uint16(bitand(MASK, bitsrl(uint32(data(i,1)),16)));
    if dataq(i) > 32768
        dataq(i) = dataq(i) - 65536;
    end
end
% hold on
% plot(dataq)
% plot(datai)

sample_freq=1e3;
data = dataq+1i*datai
data_start = 2;
sigwave2=abs(data(1000:end));
sigwave2=sigwave2-mean(sigwave2);
num=5*length(sigwave2);

%plot of original collected data
figure(1)
plot(sigwave2)
%cutoff frequency is 3 Hz
fc_Hi=3;
fc_Lo = 0.07;

fft_sig=(fft(sigwave2(10:end),num));
fft_sig(floor(fc_Hi/(sample_freq/num)):num-floor(fc_Hi/(sample_freq/num)))=0;
fft_sig(1:floor(fc_Lo/(sample_freq/num))) = 0;
sig=real(ifft(fft_sig,num));
sig=sig-mean(sig);
%plot of noise-free data,ideal filter is used
figure(2)
plot(sig)

%--------plot the freq domain signal detected by radar--------%
figure(3)

%uwb data, frequency up to 3 Hz
freq_x_axis=linspace(0,3,3/(sample_freq/num));
plot(freq_x_axis,abs(fft_sig(1:length(freq_x_axis)))/max(abs(fft_sig(1:length(freq_x_axis)))),'r--');
xlabel('Frequency (Hz)','linewidth',12,'fontsize',15,'Fontname','Timesnewroman','fontWeight','bold')
ylabel('Normalized Magnitude','linewidth',12,'fontsize',15,'Fontname','Timesnewroman','fontWeight','bold')
