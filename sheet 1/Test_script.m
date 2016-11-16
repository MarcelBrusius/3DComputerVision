image = imread('00001.jpg');
load('Calib_Results.mat');

Plane = projectPoints(X_2, KK, inv_KK, Rc_2, Tc_2, 'Dist',kc);

imagesc(image);
% hold on;
plot(Plane(:,1),Plane(:,2),'r*');