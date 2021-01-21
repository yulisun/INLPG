function [AUC, diag_dis] = AUC_Diagdistance(TPR,FPR)
x= FPR;
y = TPR;
t = length(FPR);
x_1 = [0 x(1:(t-1))];
y_1 = [0 y(1:(t-1))];
AUC = sum((x-x_1).*(y+y_1)/2);
if FPR(end)~=1
   AUC_temp = (1-FPR(end))* TPR(end);
   AUC = AUC + AUC_temp;
end
z = abs(1-(x + y));
[~, z_location] = min(z);
diag_dis = ((1-x(z_location))^2 +y(z_location)^2)^0.5;




