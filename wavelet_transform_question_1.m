% 1. Write a MATLAB program to implement Wavelet Transform for any image and obtain the
%  original image by implementing inverse Wavelet Transform.
clc;
img = imread('Monuments_1001.jpg');
figure,imshow(img);
title("original image");
myimg = imresize(img,[256 ,256]);
m = myimg(:,:,3);
[ca,ch,cv,cd] = dwt2(m,'haar');
[ca1,ch1,cv1,cd1] = dwt2(ca,'haar');

figure,imshow(uint8([ca,ch;cv,cd]));
title("DWT level 1");

figure,imshow(uint8([[ca1,ch1;cv1,cd1],ch;cv,cd]));
title("DWT level 2");

invca = idwt2(ca,ch,cv,cd,'haar');
figure , imshow(invca);
title("invDWT of level 1");

invca2 = idwt2(ca1,ch1,cv1,cd1,'haar');
figure , imshow(invca2);
title("invDWT of level 2");

fprintf("PSNR Ratio :%0.10f",psnr(m,invca));

function psnr2 = psnr(orgimg,invimg)
    [height,width] = size(orgimg);
    result = 0;
    for i = 1:height
       for j = 1:width
           result = result+ (uint8(orgimg(i,j))-uint8(invimg(i,j)))^2;
       end    
    end
    psnr2 = double(result) / (height*width);
    psnr2 = 10*log10(255^2/psnr2);
end
