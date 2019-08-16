function A = deblur(B, n, gry, flag)
% Deblurs the image stored in the matrix/tensor B 
% and returns the "unblurred" image.
% The image is considered to be grayscale if gry = 1 
% and the image is displayed if flag = 1.


% Our initial "guess" to feed into the CG method is the zero image.
A = zeros(size(B));

if gry == 0 % Color

    % Run the CG method on RGB values. 
    % Each call to the CG method is iterated n times.
    [A(:,:,1), error, niter, flag] = CGmethod(0.1, A(:,:,1), B(:,:,1), n, 0);
    [A(:,:,2), error, niter, flag] = CGmethod(0.1, A(:,:,2), B(:,:,2), n, 0);
    [A(:,:,3), error, niter, flag] = CGmethod(0.1, A(:,:,3), B(:,:,3), n, 0);
    
else % Grayscale

    % Each call to the CG method is iterated n times.
    [A, error, niter, flag] = CGmethod(0.1, A, B, n, 0);

end;


% Display image when flag is 1.
if flag == 1
    figure; 
    if gry == 1
        colormap(gray(256)); 
        
        % rescale to make image show up.
        x = max([max(max(A)),0.000001]);
        scaleA = (1/x)*A;
    else 
        % rescale to make image show up.
        x = max([max(max(max(A))),0.000001]);
        scaleA = (1/x)*A;
    end;
    %image(myImg);
    imshow(scaleA);
end;