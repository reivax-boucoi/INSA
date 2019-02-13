clear;
b0=.996
b1=[1 -1]
a1=[1 -.996]
b2=[1 0 0]
b=b0*conv(b1,b2)
[h,w]=freqz(b,a1,100000,1000);
[h1,t]=stepz(b,a1,1000)
%plot(w,20*log10(abs(h)));
plot(t/1000,h1);
ylabel({'Amplitude (unit step)'});
xlabel({'Time (s)'});
title({'Step reponse'});
grid
