function  [TPR, FPR]= Roc_plot(DIimage,GT,n)
GT = GT/max(GT(:));
GT = GT == 1; % convert to binary image
P = nnz(GT); % number of positive responses in ground truth
N = nnz(1-GT);
% responses
R = DIimage;
% your thresholds
thresholds = linspace(min(R(:)), max(R(:)),n);
% alternatively, use 100 thresholds between min(R) and max(R)
% thresholds = linspace(min(R(:)), max(R(:)));
% pre-allocate for speed
tp = nan(1, length(thresholds));
fp = nan(1, length(thresholds));
for i = 1:numel(thresholds)
  t = thresholds(end-i+1); % thresholds from high to low as i increases
  Rt = R > t; % thresholded response
  tp(i) = nnz(Rt & GT);
  fp(i) = nnz(Rt & ~GT);
end
% convert to rates
TPR = tp/P;
FPR = fp/N;
%figure;plot(FPR, TPR) % ROC