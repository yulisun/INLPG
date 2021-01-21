function [PGM] = imageTodata(image,ps,ss)
[H, W, B] = size(image);
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
        i_x_d = i_x(i)-ps;
        i_x_u = i_x(i)+ps;
        j_y_d = j_y(j)-ps;
        j_y_u = j_y(j)+ps;
        data = image(i_x_d:i_x_u,j_y_d:j_y_u,1:B);
        PGM(:,k) = data(:);
        k = k + 1;
    end
end