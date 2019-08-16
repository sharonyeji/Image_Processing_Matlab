%Part A
I=imread('landscape.jpg');
I = double(I);
colormap(gray),imagesc(I);

%Display histogram of I
x = 1:256;
h = zeros(1,256);
for i=1:1116
    for j=1:1984
        h(I(i,j)+1) = h(I(i,j)+1) + 1;
    end
end
plot(x,h);

%Find Average Optical Density
mean(I(:))


%Part B
M=imread('mammogram.jpg');
M=double(M);

%1.Convert into a binary image by simple thresholding
Tnew=mean(M(:));
for i=1:512
    for j=1:512
        if M(i,j) < Tnew
           I(i,j) = 0;
        else
            I(i,j) = 255;
        end
    end
end
result1=I;
colormap(gray)
subplot(1,3,1),imagesc(M)
subplot(1,3,2),imagesc(result1)

%2.Implement the Approximate Contour Image Generation algorithm
for i=2:511
    for j=2:511
        if I(i,j)==255
            n = I(i-1,j-1) + I(i-1,j) + I(i-1,j+1) + I(i,j-1) + I(i,j) + I(i,j+1) + I(i+1,j-1) + I(i+1,j) + I(i+1,j+1);
            if n<2040
                J(i,j) = 255;
            else
                J(i,j) = 0;
            end
        else
            J(i,j) = 0;
        end
    end
end
result2 = J;

subplot(1,3,3),imagesc(result2)

%Part C
S = imread('spot.jpg');
S = double(S);
colormap(gray);

%Display histogram of S
x = 1:256;
h = zeros(1,256);
for i=1:256
    for j=1:256
        h(S(i,j)+1) = h(S(i,j)+1) + 1;
    end
end
subplot(2,2,1), plot(x,h);
 
% Perform full-scale contrast stretch
% J(i,j) = ((k-1)/(b-a))*(I(i,j) - a)
J = uint8((255/50)*S);
a = 1:256;
n = zeros(1,256);
for i=1:256
    for j=1:256
        n(J(i,j)+1) = n(J(i,j)+1) + 1;
    end
end
subplot(2,2,2), plot(a,n);

subplot(2,2,3),imagesc(S);
subplot(2,2,4),imagesc(J);