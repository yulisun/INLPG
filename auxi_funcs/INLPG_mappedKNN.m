function [fx_dist, fy_dist, fx_sim, fy_sim] = INLPG_mappedKNN(X,Y,k)
X = X';
Y = Y';
k = k+1;
%% using kgraph to accelerate the algorithm
% [idx, distX] = kgraph(X,X,'k',k);
% [idy, distY] = kgraph(Y,Y,'k',k);
%% without the kgraph
[idx, distX] = knnsearch(X,X,'k',k);
[idy, distY] = knnsearch(Y,Y,'k',k);
%% calculate the forward and backward structure difference using distance or similarity criteria
[N,D] = size(X);
fx_dist = zeros(N,1);
fy_dist = zeros(N,1);
fx_sim = zeros(N,1);
fy_sim = zeros(N,1);
for i = 1:N
    di_x = distX(i,2:k).^2;
    id_x = idx(i,2:k);
    di_y = distY(i,2:k).^2;
    id_y = idy(i,2:k);
    di_x_y = pdist2(X(idy(i,2:k),:),X(i,:)).^2;
    di_y_x = pdist2(Y(idx(i,2:k),:),Y(i,:)).^2;
    fx_dist (i) = abs(mean(di_x)-mean(di_x_y));
    fy_dist (i) = abs(mean(di_y)-mean(di_y_x));
    fx_sim (i) =  abs(mean(exp(-di_x/D))-mean(exp(-di_x_y/D)));
    fy_sim (i) =  abs(mean(exp(-di_y/D))-mean(exp(-di_y_x/D)));
end
