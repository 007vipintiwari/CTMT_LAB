%1D DCT_IDCT
a=[1:6];
Fk = dct1(a);
new_a = idct1(Fk);
z = psnr1d(a, real(new_a));
fprintf("PSNR_1D:%.4f\n", z);


%2D_DCT_IDCT
img=imread('lena_gray_small.jpg');
gimg=double(rgb2gray(img));
F_uv = dct2(gimg);
iF_uv = idct2(F_uv);

figure, imshow(uint8(gimg))
figure, imshow(abs(F_uv))
figure, imshow(uint8(abs(iF_uv)))

z = psnr2d(gimg, real(iF_uv));
fprintf("PSNR_2D:%.4f\n", z);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Fk = dct1(a)
    Fk = zeros(1,length(a));
    fprintf("\n1D_DCT\n");
    for u=1:length(a)
        if(u==1)
            cu = 1/sqrt(2);
        else
            cu = 1;
        end
        result = 0;
        for i=1:length(a)
            result = result + cu * a(i) * cos(pi*u*(2*i+1)/(2*length(a)));
        end
        Fk(u)  = result * sqrt(2/length(a));
        fprintf("F(%d)=%3f\n",a(u), real(Fk(u)));
    end
end

function new_a = idct1(Fk)
    fprintf("\n1D_IDCT\n");
    %1D IFT
    new_a = zeros(1,length(Fk));
    for i=1:length(Fk)
        result = 0;
        for u=1:length(Fk)
            if(u==1)
                cu = 1/sqrt(2);
            else
                cu = 1;
            end
            result = result + cu * Fk(u) * cos(pi*u*(2*i+1)/(2*length(Fk)));
        end
        new_a(i)  = result * sqrt(2/length(Fk));
        fprintf("F(%d)=%3f\n",i, real(new_a(i)));
    end
end

function F_uv = dct2(gimg)
    F_uv = zeros(size(gimg));
    [Iheight, Iwidth] = size(gimg);
    for u=1:Iheight
        if(u==1)
            cu = 1/sqrt(2);
        else
            cu = 1;
        end
%         disp(u);
        for v=1:Iwidth
            if(v==1)
                cv = 1/sqrt(2);
            else
                cv = 1;
            end
            result = 0;
            for m=1:Iheight
                for n=1:Iwidth
                    result = result + gimg(m,n)*cos(((2*m+1)*u*pi)/(2*Iheight))*cos(((2*n+1)*v*pi)/(2*Iheight));
                end
            end
            F_uv(u,v) = (2*cu*cv*result)/Iheight;
        end
    end
end

function iF_uv = idct2(F_uv)
    [Iheight, Iwidth] = size(F_uv);
    iF_uv = zeros(size(F_uv));
    for m=1:Iheight
%         disp(m);
        for n=1:Iwidth
            result = 0;
            for u=1:Iheight
                if(u==1)
                    cu = 1/sqrt(2);
                else
                    cu = 1;
                end
                for v=1:Iwidth
                    if(v==1)
                        cv = 1/sqrt(2);
                    else
                        cv = 1;
                    end
                    result = result + cu*cv*F_uv(u,v)*cos(((2*m+1)*u*pi)/(2*Iheight))*cos(((2*n+1)*v*pi)/(2*Iheight));
                end
            end
            iF_uv(m,n) = 2*result/Iheight;
        end
    end
end

function psnrV = psnr2d(orgImg, invImg)
    [Iheight, Iwidth] = size(orgImg);
    result = 0;
    for i=1:Iheight
        for j=1:Iwidth
            result = result+ (uint8(orgImg(i,j))-uint8(invImg(i,j)))^2;
        end
    end
    psnrV = double(result) / (Iheight*Iwidth);
    psnrV = 10*log10(255^2/psnrV);
end

function psnrV = psnr1d(fx, iFx)
    Iheight = length(fx);
    result = 0;
    for i=1:Iheight
        result = result+ (uint8(fx(i))-uint8(iFx(i)))^2;
    end
    psnrV = double(result) / (Iheight);
    psnrV = 10*log10(255^2/psnrV);
end