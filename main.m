clc;
clear all;
close all;

ALL_IMAGE = './all_image/';
USM_IMAGE = './gum_denoise_image/';
RESULT_IMAGE = './gum_denoise_gamma_image/';

% read all image's name
image_name = dir([ALL_IMAGE '*.jpg']);
image_name = {image_name.name};

for i = 1:1:length(image_name)
    im_path  = [ALL_IMAGE image_name{i}];
    im = double(imread(im_path));
    
    % USM
    hsv = rgb2hsv(im);
    v = hsv(:, :, 3); 
    Y3 = GUM( v./255);
    hsv( :, :, 3 )= Y3.*255;
    im_usm = hsv2rgb(hsv);
    
    % Gamma Trans
    a= 1;
    Gamma = 0.9;
    im_result = a * (im_usm.^Gamma);
    
    % store 
    out_path_usm = [USM_IMAGE 'gum_denoise_' image_name{i}];
    out_path_result = [RESULT_IMAGE 'gum_denoise_gamma_' image_name{i}];
    imwrite(uint8(im_usm), out_path_usm);
    imwrite(uint8(im_result), out_path_result);
end