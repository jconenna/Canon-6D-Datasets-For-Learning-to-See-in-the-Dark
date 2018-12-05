clear all
close all
clc

%read all the files in current folder into a well named structure 'files'
Files=dir('*.*');
for k=1:length(Files)
   FileNames=Files(k).name
end
[size_files ~] = size(Files);

%number of total image groups to process (dark, gt, scaled, nn) = 1 group

num_images = 63;
%number of images per group
num_images_in_subset = 4;
%structure index for location of first GT image
first_image_offset = 19;
%step size to jump to next GT image
step_size = 6*num_images_in_subset;

snr_results = [0 0];
ssim_results = [0 0];

%loop the remaining code
for i = 1:num_images
    %convert into a cell, this allows indexing into structure
    Files_cell = struct2cell(Files);

    %grab image names, then read the image
    image_ground_truth = Files_cell{first_image_offset};
    image_ground_truth = imread(image_ground_truth);

    image_nn_out = Files_cell{first_image_offset+6};
    image_nn_out = imread(image_nn_out);

    image_scaled = Files_cell{first_image_offset+12};
    image_scaled = imread(image_scaled);

    %calculate psnr
    [peaksnr_nn, snr_nn] = psnr(image_nn_out, image_ground_truth);
    [peaksnr_scaled, snr_scaled] = psnr(image_scaled, image_ground_truth);
    snr_results = [snr_results; peaksnr_scaled peaksnr_nn];

    %calcualte ssim
    %[ssimval_nn ,ssimmap_nn ] = ssim(image_nn_out, image_ground_truth);
    %[ssimval_scaled ,ssimmap_scaled ] = ssim(image_scaled, image_ground_truth);
    %ssim_results = [ssim_results; ssimval_scaled ssimval_nn];

    first_image_offset = first_image_offset + step_size;
end

snr_results(1,:)=[];
ssim_results(1,:)=[];

snr_mean = mean(snr_results,1);
