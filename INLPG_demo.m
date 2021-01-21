%%  Structure Consistency based Graph for Unsupervised Change Detection with Homogeneous and Heterogeneous Remote Sensing Images
%{
Code: INLPG - 2021
This is a test program for the Improved NonLocal Patch based Graph (INLPG) for change detection, which
detects changes by comparing the structures of two images, rather than comparing the pixel values of images.

INLPG is an improved version of our previous work NPSG (https://github.com/yulisun/NPSG):
Sun, Yuli, et al."Nonlocal patch similarity based heterogeneous
remote sensing change detection. Pattern Recognition," 2021, 109, 107598.

The computational time of INLPG can be reduced by using the
Kgraph (http://www.kgraph.org/) to replace the "knnsearch" in the function
"INLPG_mappedKNN.m", or using a larger opt.delt_s and opt.delt_p, which may slightly affect the detection accuracy.

Another better suggestion is to use the IRG-McS algorithm (https://github.com/yulisun/IRG-McS), 
which is a superpixel-based heterogeneous CD method.
===================================================

If you use this code for your research, please cite our papers.

Sun, Yuli, et al. "Nonlocal patch similarity based heterogeneous remote sensing change detection." Pattern Recognition 109 (2021): 107598.

Sun, Yuli, et al. "Structure Consistency based Graph for Unsupervised
Change Detection with Homogeneous and Heterogeneous Remote Sensing Images."
IEEE Transactions on Geoscience and Remote Sensing, Early Access, 2021,
doi:10.1109/TGRS.2021.3053571.
===================================================
%}
clc;
clear;
close all
addpath('auxi_funcs')
%% load dataset
addpath('datasets')
dataset = 'yellow_A';
% For other datasets, we recommend down sampling the image to make
% it less than 800 in length and width to reduce the computational time.
Load_dataset
fprintf(['\n Data loading is completed...... ' '\n'])
%% image normalization
image_t1 = image_normlized(image_t1,opt.type_t1);
image_t2 = image_normlized(image_t2,opt.type_t2);
%% Parameter setting
% With different parameter settings, the results will be a little different
% p_s=2 for yellow, California and wuhan; p_s=3 for Italy, Texas and shuguang;
% p_s=4 for beijing; p_s=6 for UAVSAR;
opt.p_s = 2;
opt.delt_p = opt.p_s; % opt.p_s <= opt.delt_p <= 2 * opt.p_s +1; suggest delt_p = p_s.
opt.k_ratio = 0.01;
%% INLPG
%-------------------------------------------------%
t0 = clock;
fprintf(['\n INLPG is running...... ' '\n'])
[DIfw_dist,DIbw_dist,DIfw_sim,DIbw_sim] = INLPG_main(image_t1,image_t2,opt);
%% fuse the forward and backward DIs
[DIfusion_dist] = DWT_fusionforDI(DIbw_dist,DIfw_dist,opt.delt_p);
[DIfusion_sim] = DWT_fusionforDI(DIbw_sim,DIfw_sim,opt.delt_p);
fprintf('\n');fprintf('The computational time of INLPG without Kgraph acceleration is %i \n', etime(clock, t0));
%% display result
fprintf(['\n Displaying the results...... ' '\n'])
figure;
subplot(231);imshow(DIfw_dist,[]);title('DIfw-dist');colormap('jet')
subplot(232);imshow(DIbw_dist,[]);title('DIbw-dist');colormap('jet')
subplot(233);imshow(DIfusion_dist,[]);title('DIfusion-dist');colormap('jet')
subplot(234);imshow(DIfw_sim,[]);title('DIfw-sim');colormap('jet')
subplot(235);imshow(DIbw_sim,[]);title('DIbw-sim');colormap('jet')
subplot(236);imshow(DIfusion_sim,[]);title('DIfusion-sim');colormap('jet')

n=500;
[TPR_fw_dist, FPR_fw_dist]= Roc_plot(DIfw_dist,Ref_gt,n);
[TPR_bw_dist, FPR_bw_dist]= Roc_plot(DIbw_dist,Ref_gt,n);
[TPR_fusion_dist, FPR_fusion_dist]= Roc_plot(DIfusion_dist,Ref_gt,n);
[TPR_fw_sim, FPR_fw_sim]= Roc_plot(DIfw_sim,Ref_gt,n);
[TPR_bw_sim, FPR_bw_sim]= Roc_plot(DIbw_sim,Ref_gt,n);
[TPR_fusion_sim, FPR_fusion_sim]= Roc_plot(DIfusion_sim,Ref_gt,n);

figure; plot(FPR_fw_dist,TPR_fw_dist);
hold on ; plot(FPR_bw_dist,TPR_bw_dist);
hold on ; plot(FPR_fusion_dist,TPR_fusion_dist);
hold on ; plot(FPR_fw_sim,TPR_fw_sim);
hold on ; plot(FPR_bw_sim,TPR_bw_sim);
hold on ; plot(FPR_fusion_sim,TPR_fusion_sim);
legend('DIfw-dist','DIbw-dist','DIfusion-dist','DIfw-sim','DIbw-sim','DIfusion-sim')

[AUC_fw_dist, Ddist_fw_dist] = AUC_Diagdistance(TPR_fw_dist, FPR_fw_dist);
[AUC_bw_dist, Ddist_bw_dist] = AUC_Diagdistance(TPR_bw_dist, FPR_bw_dist);
[AUC_fusion_dist, Ddist_fusion_dist] = AUC_Diagdistance(TPR_fusion_dist, FPR_fusion_dist);
[AUC_fw_sim, Ddist_fw_sim] = AUC_Diagdistance(TPR_fw_sim, FPR_fw_sim);
[AUC_bw_sim, Ddist_bw_sim] = AUC_Diagdistance(TPR_bw_sim, FPR_bw_sim);
[AUC_fusion_sim, Ddist_fusion_sim] = AUC_Diagdistance(TPR_fusion_sim, FPR_fusion_sim);
fprintf(['\n The AUC and Ddist of forward, backward, and fused DIs are' '\n'])
AUC_diagdis_dist = [AUC_fw_dist, AUC_bw_dist, AUC_fusion_dist;Ddist_fw_dist, Ddist_bw_dist, Ddist_fusion_dist]
AUC_diagdis_sim = [AUC_fw_sim, AUC_bw_sim, AUC_fusion_sim;Ddist_fw_sim, Ddist_bw_sim, Ddist_fusion_sim]



