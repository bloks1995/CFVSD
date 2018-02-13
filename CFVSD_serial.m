s = serial ('COM4');
s.BaudRate = 115200;
fopen(s);
init = fscanf(s)
data = zeros(0,1);
N = 256 %number of samples
for i = 1:N
    temp = fscanf(s, '%x\n')
    data = [data;temp]
end
fclose(s);
delete(s);
MASK = hex2dec('ffff')
datai = zeros(0,1);
dataq = zeros(0,1);
for i = 1:N
    datai = [datai;bitand(MASK, data(i,1))];
    dataq = [dataq;bitand(MASK, bitshift(data(i,1),4))];
end