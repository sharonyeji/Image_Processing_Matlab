%Assignment 3
%Exercise
colormap(gray);
A = imread('lincoln.jpg');

%Convert to binary image
Tnew=mean(A(:));
for i=1:436
    for j=1:364
        if A(i,j) < Tnew
           I(i,j) = 0;
        else
           I(i,j) = 255;
        end
    end
end
A=I;

I1=(1:25)';
C=padarray(A,[2 2],0);

B = false(size(A));
for i=1:436
    for j=1:364
        I=C(i:i+4,j:j+4);
        if(I(I1)==255)
            B(i,j)=255;
        end
    end
end

B=double(B);
for i=1:436
    for j=1:364
        if B(i,j) == 1
           B(i,j) = 255;
        end
    end
end

C = A-B;
subplot(1,2,1), imagesc(A);
subplot(1,2,2), imagesc(C);
