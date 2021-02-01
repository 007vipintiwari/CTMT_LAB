% 2. Write a MATLAB program to implement Wavelet Transform for any image and obtain the
%  original image by implementing inverse Wavelet Transform m with updation or noise in the
%  wavelet deatailed horoizontal, vertical and diagonal coefficients.
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
fprintf("PSNR Ratio :%0.10f\n",psnr(m,invca));


invca2 = idwt2(ca1,ch1,cv1,cd1,'haar');
figure , imshow(invca2);
title("invDWT of level 2");

caInv = idwt2(ca,[],[],[],'haar');
figure, imshow(caInv);
title("IDWT level 1");
fprintf("PSNR Ratio of Level 1 :%0.10f\n",psnr(m,caInv));

caInv1 = idwt2(ca1,[],[],[],'haar');
figure,imshow(caInv1);
title("IDWT level 2")

figure ,imshow(uint8([caInv1]));
title("IDWT level  2 inverse image");

caInv1Inv = idwt2(caInv1,[],[],[],'haar');
fprintf("PSNR Ratio of level 2:%0.10f",psnr(m,caInv1Inv));

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
