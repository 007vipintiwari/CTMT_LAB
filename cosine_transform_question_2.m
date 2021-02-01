%Question 2 cosine transform

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% one dimensional discrete cosine transform
clc;
x = [1,2,3,4,5,6];
fx = [1,2,3,4,5,6];
N = 6;
Fx = dct_1d(fx,N);
fprintf("%0.5f\n",Fx);
iFx = idct_1d(Fx,N);
fprintf("%0.5f\n",iFx);
fprintf("PSNR Ratio : %0.10f\n",psnr1d(fx,iFx));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% two dimensional discrete cosine transform
img = imread('bike.jpg');
gimg = rgb2gray(img);
mygimg = double(gimg);
[height,width] = size(mygimg);
Fk = dct2d(mygimg,height,width);

iFk = idct2d(Fk,height,width);

figure, imshow(uint8(gimg))
figure, imshow(abs(Fk))
figure, imshow(uint8(abs(iFk)))

fprintf("psnr2d ratio : %0.10f",psnr2d(gimg,uint8(iFk)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%one dimensional discrete cosine transform
function Fx = dct_1d(fx,N)
         Fx = zeros(1,N);
         for i = 1:N
              if i == 1
                 c = 1/sqrt(2); 
              end
              if i ~= 1
                 c = 1; 
              end 
              prod = 0;
              for x = 1:N
                  prod = prod + c*fx(x)*cos((pi*(2*x + 1)*i)/(2*N)); 
              end 
            Fx(i) = prod*sqrt(2/N);
         end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%inverse of one dimensional discrete cosine transform
function iFx = idct_1d(Fx,N)
          iFx = zeros(1,N);
         for i = 1:N
             prod = 0;
              for x = 1:N
                  if x == 1
                    c = 1/sqrt(2); 
                  end
                  if x ~= 1
                    c = 1; 
                  end 
                  prod = prod + c * Fx(x) * cos((pi*x*(2*i + 1)/(2*N))); 
              end 
            iFx(i) = prod* sqrt(2/N);
         end 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%two dimensional discrete cosine transform
function Fk = dct2d(mygimg,height,width)
            Fk = zeros(height,width);
            for u = 1:height
                for v = 1:width
                    prod = 0;
                   for i = 1:height
                       if(i ==1)
                               ca = 1/sqrt(2);
                           else
                               ca = 1;
                       end
                       for j = 1:width
                           if(j == 1)
                               cj = 1/sqrt(2);
                           else
                               cj = 1;
                           end
                           prod = prod + ca*cj*mygimg(i,j)*cos((pi*u*(2*i + 1))/2*height)*cos((pi*v*(2*j + 1))/2*width);
                       end    
                   end 
                   Fk(u,j) = prod/(sqrt(2/height)*sqrt(2/width));
                end    
            end    

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%inverse of 2-d discrete cosine transform
function iFk = idct2d(Fk,height,width)
         iFk = zeros(height,width);
         for u = 1:height
             for v = 1:width
                 prod = 0;
                 for i = 1:height
                     if i == 1
                         ca = sqrt(1/height);
                     else
                         ca = sqrt(2/height);
                     end
                     for j = 1:width
                         if j == 1
                             cb = sqrt(1/width);
                         else
                             cb = sqrt(2/width);
                         end
                         prod = prod + ca*cb*Fk(i,j)*cos((pi*i*(2*u + 1))/(2*height))*cos((pi*j*(2*v + 1))/(2*width));
                     end
                 end    
                        iFk(u,v) = prod;
             end
         end    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% one PSNR ratio
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