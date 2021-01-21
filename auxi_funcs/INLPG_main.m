function [DIfw_dist,DIbw_dist,DIfw_sim,DIbw_sim] = INLPG_main(image_t1,image_t2,opt)
%% patch group matrix
PGM_t1 = imageTodata(image_t1,opt.p_s,opt.delt_p);
PGM_t2 = imageTodata(image_t2,opt.p_s,opt.delt_p);
%% structure difference calculation
K =round(size(PGM_t1,2)*opt.k_ratio);
[fx_dist, fy_dist, fx_sim, fy_sim] = INLPG_mappedKNN(PGM_t1,PGM_t2,K);
fprintf(['\n Structure difference calculation is completed...... ' '\n'])
%% DI generation
DIbw_dist  = dataToimage(fx_dist,opt.p_s,opt.delt_p,image_t1);
DIfw_dist = dataToimage(fy_dist,opt.p_s,opt.delt_p,image_t1);
DIbw_sim = dataToimage(fx_sim,opt.p_s,opt.delt_p,image_t1);
DIfw_sim = dataToimage(fy_sim,opt.p_s,opt.delt_p,image_t1);
