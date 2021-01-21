if strcmp(dataset,'yellow_A') == 1 % Homogeneous CD of SAR images
    image_t1 = imread('yellow_A_1.bmp');
    image_t2 = imread('yellow_A_2.bmp');
    gt = imread('yellow_A_gt.bmp');
    Ref_gt = gt(:,:,1);
    opt.type_t1 = 'sar';
    opt.type_t2 = 'sar';
    figure;
    subplot(131);imshow(image_t1,[]);title('imaget1')
    subplot(132);imshow(image_t2,[]);title('imaget2')
    subplot(133);imshow(Ref_gt,[]);title('Refgt')
elseif strcmp(dataset,'yellow_B') == 1 % Homogeneous CD of SAR images
    image_t1 = imread('yellow_B_1.bmp');
    image_t2 = imread('yellow_B_2.bmp');
    gt = imread('yellow_B_gt.bmp');
    Ref_gt = gt(:,:,1);
    opt.type_t1 = 'sar';
    opt.type_t2 = 'sar';
    figure;
    subplot(131);imshow(image_t1,[]);title('imaget1')
    subplot(132);imshow(image_t2,[]);title('imaget2')
    subplot(133);imshow(Ref_gt,[]);title('Refgt')
elseif strcmp(dataset,'yellow_C') == 1 % Homogeneous CD of SAR images
    image_t1 = imread('yellow_C_1.bmp');
    image_t2 = imread('yellow_C_2.bmp');
    gt = imread('yellow_C_gt.bmp');
    Ref_gt = gt(:,:,1);
    opt.type_t1 = 'sar';
    opt.type_t2 = 'sar';
    figure;
    subplot(131);imshow(image_t1,[]);title('imaget1')
    subplot(132);imshow(image_t2,[]);title('imaget2')
    subplot(133);imshow(Ref_gt,[]);title('Refgt')
elseif strcmp(dataset,'yellow_D') == 1 % Homogeneous CD of SAR images
    image_t1 = imread('yellow_D_1.bmp');
    image_t2 = imread('yellow_D_2.bmp');
    gt = imread('yellow_D_gt.bmp');
    Ref_gt = gt(:,:,1);
    opt.type_t1 = 'sar';
    opt.type_t2 = 'sar';
    figure;
    subplot(131);imshow(image_t1,[]);title('imaget1')
    subplot(132);imshow(image_t2,[]);title('imaget2')
    subplot(133);imshow(Ref_gt,[]);title('Refgt')
elseif strcmp(dataset,'UAVSAR_A') == 1 % Homogeneous CD of PolSAR images
    load('UAVSARSceneA.mat')
    opt.type_t1 = 'sar';
    opt.type_t2 = 'sar';
    figure;
    subplot(131);imshow(image_t1,[]);title('imaget1')
    subplot(132);imshow(image_t2,[]);title('imaget2')
    subplot(133);imshow(Ref_gt,[]);title('Refgt')
elseif strcmp(dataset,'UAVSAR_B') == 1 % Homogeneous CD of PolSAR images
    load('UAVSARSceneB.mat')
    opt.type_t1 = 'sar';
    opt.type_t2 = 'sar';
    figure;
    subplot(131);imshow(image_t1,[]);title('imaget1')
    subplot(132);imshow(image_t2,[]);title('imaget2')
    subplot(133);imshow(Ref_gt,[]);title('Refgt')
elseif strcmp(dataset,'beijing_A') == 1 % Homogeneous CD of Optical images
    image_t1 = imread('beijing_A_1.jpg');
    image_t2 = imread('beijing_A_2.jpg');
    gt = imread('beijing_A_gt.jpg');
    Ref_gt = gt(:,:,1);
    Ref_gt (find(Ref_gt>128)) = 255;Ref_gt (find(Ref_gt<129)) = 0;
    opt.type_t1 = 'optical';
    opt.type_t2 = 'optical';
    figure;
    subplot(131);imshow(image_t1,[]);title('imaget1')
    subplot(132);imshow(image_t2,[]);title('imaget2')
    subplot(133);imshow(Ref_gt,[]);title('Refgt')
elseif strcmp(dataset,'beijing_B') == 1 % Homogeneous CD of Optical images
    image_t1 = imread('beijing_B_1.jpg');
    image_t2 = imread('beijing_B_2.jpg');
    gt = imread('beijing_B_gt.jpg');
    Ref_gt = gt(:,:,1);
    Ref_gt (find(Ref_gt>128)) = 255;Ref_gt (find(Ref_gt<129)) = 0;
    opt.type_t1 = 'optical';
    opt.type_t2 = 'optical';
    figure;
    subplot(131);imshow(image_t1,[]);title('imaget1')
    subplot(132);imshow(image_t2,[]);title('imaget2')
    subplot(133);imshow(Ref_gt,[]);title('Refgt')
elseif strcmp(dataset,'shuguang') == 1 % Heterogeneous CD of SAR VS. Optical
    image_t1 = imread('shuguang_1.bmp');
    image_t1 = rgb2gray(image_t1);
    image_t2 = imread('shuguang_2.bmp');
    gt = imread('shuguang_gt.bmp');
    Ref_gt = gt(:,:,1);
    opt.type_t1 = 'sar';
    opt.type_t2 = 'optical';
    figure;
    subplot(131);imshow(image_t1,[]);title('imaget1')
    subplot(132);imshow(image_t2,[]);title('imaget2')
    subplot(133);imshow(Ref_gt,[]);title('Refgt')
elseif strcmp(dataset,'wuhan') == 1 % Heterogeneous CD of SAR VS. Optical
    image_t1 = imread('wuhan_1.bmp');
    image_t1 = rgb2gray(image_t1);
    image_t2 = imread('wuhan_2.bmp');
    gt = imread('wuhan_gt.bmp');
    opt.type_t1 = 'sar';
    opt.type_t2 = 'optical';
    Ref_gt = gt(:,:,1);
    figure;
    subplot(131);imshow(image_t1,[]);title('imaget1')
    subplot(132);imshow(image_t2,[]);title('imaget2')
    subplot(133);imshow(Ref_gt,[]);title('Refgt')
elseif strcmp(dataset,'California') == 1 % Heterogeneous CD of SAR VS. Optical
    load('California.mat')
    Ref_gt = gt(:,:,1);
    opt.type_t1 = 'optical';% the SAR image have been Log transformed
    opt.type_t2 = 'optical';
    figure;
    subplot(131);imshow(image_t1,[-1 1]);title('imaget1')
    subplot(132);imshow(image_t2(:,:,[4 3 2])+1,[]);title('imaget2')
    subplot(133);imshow(Ref_gt,[]);title('Refgt')
elseif strcmp(dataset,'Italy') == 1 % Heterogeneous CD of multispectral VS. multispectral
    image_t1 = imread('Italy_1.bmp');
    image_t1 = rgb2gray(image_t1);
    image_t2 = imread('Italy_2.bmp');
    gt = imread('Italy_gt.bmp');
    Ref_gt = gt(:,:,1);
    opt.type_t1 = 'optical';
    opt.type_t2 = 'optical';
    figure;
    subplot(131);imshow(image_t1,[]);title('imaget1')
    subplot(132);imshow(image_t2,[]);title('imaget2')
    subplot(133);imshow(Ref_gt,[]);title('Refgt')
elseif strcmp(dataset,'Texas') == 1 % Heterogeneous CD of multispectral VS. multispectral
    load('Cross-sensor-Bastrop-data.mat')
    opt.type_t1 = 'optical';
    opt.type_t2 = 'optical';
    t = 96;
    brightnessScaling_t1_L5 = max(t1_L5(:)) / double(prctile(t1_L5(:), t));
    brightnessScaling_t2_ALI = max(t2_ALI(:)) / double(prctile(t2_ALI(:), t));
    figure;subplot(131);imshow(2*t1_L5(:,:,[4 3 2]),[])
    subplot(132);imshow(2*t2_L5(:,:,[4 3 2]),[])
    subplot(133);imshow(ROI_1,[])
    image_t1 = double(t1_L5);
    image_t2 = double(t2_ALI);
    gt = double(ROI_1);
    Ref_gt = gt(:,:,1);
end
