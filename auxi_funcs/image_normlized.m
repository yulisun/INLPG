function imnor = image_normlized(image,type)
image = double (image);
%image(find(isnan(image)==1)) = 0;
if strcmp(type,'optical')
  imnor = (image - min(image(:)))./(max(image(:))-min(image(:)));
  elseif strcmp(type,'sar')
      image(abs(image)<=0) = min(image(abs(image)>0));
      image = log(image+1);
      imnor = (image - min(image(:)))./(max(image(:))-min(image(:)));
end      
  