I=imread('./all_image/2_1.jpg');
I = rgb2gray(I);

subplot(2,2,1),imshow(I);

f=double(I);     % ��������ת��

g=fft2(f);       % ����Ҷ�任

g=fftshift(g);     % ת�����ݾ���

[N,M]=size(g);

H = fspecial('gaussian',[M,N],0.8);

Blurimage = imfilter(I,H,'replicate');

Iq=imsubtract(I,Blurimage); 

subplot(2,2,2),imshow(Blurimage);   % ��ʾ�˲�������ͼ��

subplot(2,2,3),imshow(Iq);

aa=I+2*Iq;

imwrite(Blurimage, 'um_blur_3_1.jpg')
imwrite(aa,'um_3_1.jpg')

subplot(2,2,4),imshow(aa);