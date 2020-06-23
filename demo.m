% read images 
% im = double(imread('./all_image/2_1.jpg'));
im = double(imread('./all_image/10_1.jpg'));
hsv = rgb2hsv(im);
v = hsv(:, :, 3);

% USM
Y3 = GUM( v./255);
hsv( :, :, 3 )= Y3.*255;
im_usm = hsv2rgb(hsv);

% Gamma Trans
a= 1;
Gamma = 0.95;
im_result = a * (im_usm.^Gamma);

% img2=imread('./18_1.jpg');
% I=rgb2gray(img2);
% I2=0.5*I+55/255;
% hist_img = histeq(I2);

% show imgaes
figure,imshow(uint8(im)),title('Original');
figure,imshow(uint8(im_usm)),title('USM Enhanced');
% figure,imshow(uint8(hist_img)),title('hist');
figure,imshow(uint8(im_result)),title('Result');
imwrite(uint8(im_result),'./result_10.jpg');
% imwrite(uint8(hist_img),'./demo/hist_72_1.png');
