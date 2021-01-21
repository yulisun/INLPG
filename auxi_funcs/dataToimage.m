function [DI] = dataToimage(data,ps,ss,image)
[H, W, ~] = size(image);
image_re = zeros(H,W);
i_x = (1+ps):ss:(H-ps);
if i_x(end) ~= (H-ps)
    i_x(length(i_x)+1) = (H-ps);
end
j_y = (1+ps):ss:(W-ps);
if j_y(end) ~= (W-ps)
    j_y(length(j_y)+1) = (W-ps);
end
k = 1;
for i = 1:length(i_x)
    for j = 1:length(j_y)
        image_re(i_x(i),j_y(j)) = data(k);
        k = k+1;
    end
end
for i = 1:H
    for j = 1:W
        local_i = local_index(i,ps,ss,H);
        local_j = local_index(j,ps,ss,W);
        DI(i,j) = mean(mean(image_re(local_i,local_j)));
    end
end

function local_x = local_index(i,ps,ss,H)
if i<1+ss
    local_x = 1+ps;
elseif i>=(floor((H-2*ps-1)/ss)*ss+1+2*ps)
    local_x = (H-ps);
else
    local_x = (1+ps+max(0,ceil((i-2*ps-1)/ss))*ss):ss:min((1+ps+floor((i-1)/ss)*ss),H);
end