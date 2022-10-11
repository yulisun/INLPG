# INLPG
Structure Consistency based Graph for Unsupervised Change Detection with Homogeneous and Heterogeneous Remote Sensing Images

Code: INLPG - 2021
This is a test program for the Improved NonLocal Patch based Graph (INLPG) for change detection, which
detects changes by comparing the structures of two images, rather than comparing the pixel values of images.

INLPG is an improved version of our previous work NPSG (https://github.com/yulisun/NPSG):
Sun, Yuli, et al."Nonlocal patch similarity based heterogeneous
remote sensing change detection." Pattern Recognition, 2021, 109, 107598.

The computational time of INLPG can be reduced by using the
Kgraph (http://www.kgraph.org) to replace the "knnsearch" in the function
"INLPG_mappedKNN.m", or using a larger opt.delt_s and opt.delt_p, which may slightly affect the detection accuracy.

Another better suggestion is to use the IRG-McS algorithm (https://github.com/yulisun/IRG-McS), which is a superpixel-based heterogeneous CD method.

===================================================

If you use this code for your research, please cite our papers.

Sun, Yuli, et al. "Nonlocal patch similarity based heterogeneous remote sensing change detection." 
Pattern Recognition 109 (2021): 107598.

Sun, Yuli, et al. "Structure Consistency based Graph for Unsupervised
Change Detection with Homogeneous and Heterogeneous Remote Sensing Images."
IEEE Transactions on Geoscience and Remote Sensing, Early Access, 2021,
doi:10.1109/TGRS.2021.3053571.

===================================================

If you have any queries, please do not hesitate to contact me (sunyuli@mail.ustc.edu.cn ).

