##Edited by James Tucker 3/1/2018
import numpy as np
import matplotlib.pyplot as plt
## Signal Processing in Python 2.7

#Set values for signal processing
RadioBasebandRate = 1e6
## VALUES ARE SAVED IN data
#f = open(".txt", "r")
#data = f.read()
data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] #test data
sample_freq=RadioBasebandRate

data_start = 2

try:
##	sigwave2=abs(data(data_start*sample_freq:end))
	sigwave2 = map(abs, data[data_start*sample_freq:]) #USE THIS LINE INSTEAD OF THE NEXT (the next is just for testing)
#	sigwave2 = map(abs, data[data_start:])
##	sigwave2=sigwave2-mean(sigwave2)
	sigwave2 = sigwave2 - np.mean(sigwave2)
	num=5*len(sigwave2)
	#plot of original collected data
	##figure(1)
	plt.figure(1)
	plt.plot(sigwave2)
	##plot(sigwave2)

	#cutoff frequency is 3 Hz
	fc_Hi=3
	fc_Lo = 0.07
	
	##fft_sig=(fft(sigwave2(10:end),num)) 
	fft_sig = np.fft.fft(sigwave2, num)
	##fft_sig(floor(fc_Hi/(sample_freq/num)):num-floor(fc_Hi/(sample_freq/num)))=0
	fft_sig[floor(fc_Hi/(sample_freq/num)):num-floor(fc_Hi/(sample_freq/num))]=0
	##fft_sig(1:floor(fc_Lo/(sample_freq/num))) = 0
	fft_sig[1:floor(fc_Lo/(sample_freq/num))] = 0
	##sig=real(ifft(fft_sig,num))
	sig = real(np.fft.ifft(fft_sig, num))
	##sig=sig-mean(sig)
	sig = sig - np.mean(sig)
	
	#plot of noise-free data,ideal filter is used
	plt.figure(2)
	plt.plot(sig)	
	plt.show()
except Exception as e:
	print e
	raw_input('ERROR')

#--------plot the freq domain signal detected by radar--------#
#figure(3)

#uwb data, frequency up to 3 Hz
#freq_x_axis=linspace(0,3,3/(sample_freq/num))
#plot(freq_x_axis,abs(fft_sig(1:length(freq_x_axis)))/max(abs(fft_sig(1:length(freq_x_axis)))),'r--')
#xlabel('Frequency (Hz)','linewidth',12,'fontsize',15,'Fontname','Timesnewroman','fontWeight','bold')
#ylabel('Normalized Magnitude','linewidth',12,'fontsize',15,'Fontname','Timesnewroman','fontWeight','bold')

#raw_input()
