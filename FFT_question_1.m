%1. Write a MATLAB program to implement One dimensional and two-dimensional Fourier
%   Transform
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1-d fast fourier transform
clc;
x = [1,2,3,4,5,6];
fx = [1,2,3,4,5,6];
N = 6;
Fk = fft1d(fx,N);
fprintf("%0.2f",real(Fk));
iFk = ifft1d(Fk,N);
fprintf("PSNR Ratio : %0.10f\n",psnr1d(fx,iFk));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%x is input data
%Fk is output after 2D FFT
x=fx;
X=Fk;
N=length(fx);
f=0:N-1;
subplot(311)
stem(0:N-1,x)
title('Sequence x (in time domain)')
xlabel('time')
ylabel('Amplitude')
grid;
subplot(323)
stem(f,abs(X))
title('Magnitude of Fourier Coeffients using function')
ylabel('|X|')
grid;
subplot(325)
stem(f,angle(X))
title('Angle of Fourier Coeffients using function')
xlabel('Frquency coefficients')
ylabel('<X')
grid;
subplot(324)
stem(f,abs(fft(x)))
title('Magnitude of Fourier Coeffients using fft function')
ylabel('|X|')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2-d fast fourier transform
img = imread("Horse.jpg");
gimg = rgb2gray(img);
mygimg = double(gimg);
Fuv = fft2d(mygimg);

plot(Fuv);
figure,plot(abs(Fuv));
imshow(Fuv);
iFuv = ifft2d(Fuv);
Image = uint8(real(iFuv));
imshow(Image);
figure, imshow(uint8(gimg))
figure, imshow(abs(F_uv))
figure, imshow(uint8(abs(iF_uv)))
fprintf("PSNR2D Ratio: %0.5f",psnr2d(gimg,Image));
rgbimg = Image(:,:,[1,1,1]);
imshow(rgbimg);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2- D fast fourier transform
function Fuv = fft2d(mygimg)
        [x,y] = size(mygimg);
        Fuv = zeros(x,y);
        for u = 1:x
            for v = 1:y
            prod = 0;
                for m = 1:x
                    for n = 1:y
                        prod = prod + mygimg(m,n)*exp((-2*pi*j*((m*u)/x + (n*v)/y)));   
                    end
                end 
            Fuv(u,v) = prod/(x*y);
            end    
        end 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%inverse 2-D fast fourier transform
function iFuv = ifft2d(Fuv)
        [x,y] = size(Fuv);
        iFuv = zeros(x,y);
        for u = 1:x
            for v = 1:y
            prod = 0;
                 for m = 1:x
                     for n = 1:y
                         prod = prod + Fuv(m,n)*exp((2*pi*j*((m*u)/x + (n*v)/y)));   
                     end
                 end 
            iFuv(u,v) = prod;
            end    
         end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%one dimensional fast fourier transform
function Fk = fft1d(fx,N)
            Fk = zeros(1,N);
            for k = 1:6
                    prod = 0;
                    for i = 1:6
                            prod = prod + fx(i)*exp((-2*pi*j*i*k)/N);
                    end    
              Fk(k) = prod/N;
            end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%inverse fourier transform
function iFk = ifft1d(Fk,N)
            iFk = zeros(1,N);
            for x = 1:6
                prod = 0;
                for k = 1:6
                    prod = prod + Fk(k)*exp((2*pi*j*k*x)/N);
                end    
            iFk(1,x) = prod;
            end 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%
%PSNR ratio of one dimensional fast fourier transform
function psnrV = psnr1d(orgImg, invImg)
    len = length(orgImg);
    result = 0;
    for i=1:len
        result = result+ (uint8(orgImg(i))-uint8(invImg(i)))^2;
    end
    psnrV = double(result) / (len);
    psnrV = 10*log10(255^2/psnrV);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PSNR ratio of two dimensional fast fourier transform
function psnr2V = psnr2d(orgimg,invimg)
        [height,width] = size(orgimg);
         result = 0;
    for i=1:height
        for j=1:width
            result = result+ (uint8(orgimg(i,j))-uint8(invimg(i,j)))^2;
        end
    end
    psnr2V = double(result) / (height*width);
    psnr2V = 10*log10(255^2/psnr2V);
end
