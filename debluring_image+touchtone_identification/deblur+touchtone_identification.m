I = imread('Camblurred.jpg');
I = im2double(I);
colormap(gray);

F = fftshift(fft2(I));
f1 = log(1+abs(F));

g=F;
g(220:240,95:110)=0;
g(100:110,230:240)=0;
g(220:230,170:180)=0;
g(250:270,290:305)=0;
g(65:85,110:130)=0;
g(190:205,150:160)=0;
g(190:205,230:240)=0;
g(130:140,250:265)=0;
g(100:110,305:315)=0;
g(130:145,170:180)=0;
g(100:110,140:150)=0;
g(225:235,260:270)=0;

B=abs(ifft2(g));

subplot(2,2,1), imagesc(I);
subplot(2,2,2), imagesc(mat2gray(f1));
subplot(2,2,3), imagesc(mat2gray(log(1+abs(g))));
subplot(2,2,4), imagesc(B);

%Exercise 2
[ttone,FS]=audioread('touchtone.wav');
sound(ttone,FS)

%First tone
t1 = ttone(1:1500);
[m1, n1] = size(t1);
l1 = int32(m1/2);
f1 = abs(fft(t1));
f11 = f1(1:(l1+1));
F11 = FS*(0:l1)/m1;
subplot(7,1,1), plot(F11,f11);
title('1st number');
%679Hz & 1477Hz = 3

t2 = ttone(1501:3000);
[m2, n2] = size(t2);
l2 = int32(m2/2);
f2 = abs(fft(t2));
f12 = f2(1:(l2+1));
F12 = FS*(0:l2)/m2;
subplot(7,1,2), plot(F12,f12);
title('2nd number');
%679Hz & 1336Hz = 2

t3 = ttone(3001: 4500);
[m3, n3] = size(t3);
l3 = int32(m3/2);
f3 = abs(fft(t3));
f13 = f3(1:(l3+1));
F13 = FS*(0:l3)/m3;
subplot(7,1,3), plot(F13,f13);
title('3rd number');
%852Hz & 1336Hz = 8

t4 = ttone(4648:6147);
[m4, n4] = size(t4);
l4 = int32(m4/2);
f4 = abs(fft(t4));
f14 = f4(1:(l4+1));
F14 = FS*(0:l4)/m4;
subplot(7,1,4), plot(F14,f14);
title('4th number');
%852Hz & 1336Hz = 8

t5 = ttone(6287:7786);
[m5, n5] = size(t5);
l5 = int32(m5/2);
f5 = abs(fft(t5));
f15 = f5(1:(l5+1));
F15 = FS*(0:l5)/m5;
subplot(7,1,5), plot(F15,f15);
title('5th number');
%941Hz & 1336Hz = 0

t6 = ttone(7926:9425);
[m6, n6] = size(t6);
l6 = int32(m6/2);
f6 = abs(fft(t6));
f16 = f6(1:(l6+1));
F16 = FS*(0:l6)/m6;
subplot(7,1,6), plot(F16,f16);
title('6th number');
%852Hz & 1209Hz = 7

t7 = ttone(9564:11063);
[m7, n7] = size(t7);
l7 = int32(m7/2);
f7 = abs(fft(t7));
f17 = f7(1:(l7+1));
F17 = FS*(0:l7)/m7;
subplot(7,1,7), plot(F17,f17);
title('7th number');
%770Hz & 1477Hz = 6

%Dialed Numbers are: 3288076
