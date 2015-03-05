close all

A = imread('cameraman.tif');
A = im2double(A);
m = 3;
An = imnoise(A,'gaussian',0,.05);

meanResp = colfilt(An, [m m],'sliding', @mean);
medianResp = colfilt(An, [m m],'sliding',@median);

[THR,SORH,KEEPAPP] = ddencmp('den','wv',An);
[wavResp,CXC,LXC,PERF0,PERFL2] = wdencmp('gbl',An,wname,N,THR,SORH,KEEPAPP);


imshow(A), title('Original Image')
figure, imshow(An), title(sprintf('With AWGN N(0,.05),\n PSNR (dB) = %.2f',psnr(An,A)))
figure, imshow(meanResp),title(sprintf('With Mean Filter Applied,\n PSNR (dB) = %.2f',psnr(meanResp,A)))
figure, imshow(medianResp),title(sprintf('With Median Filter Applied,\n PSNR (dB) = %.2f',psnr(medianResp,A)))
figure, imshow(wavResp), title(sprintf('With Donoho''s Wavelet Denoising Applied,\n PSNR (dB) = %.2f',psnr(wavResp,A)))
