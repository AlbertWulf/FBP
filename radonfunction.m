%The program tries to repeat the Radon Transformation
P = phantom(128);
Imagesize = size(P);
ImageWidth = Imagesize(1);
ImageHeigth = Imagesize(2);
theta = 0:179;
