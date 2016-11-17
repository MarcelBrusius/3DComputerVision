image = imread('00007.jpg');
load('Calib_Results.mat');

Plane = projectPoints(X_8, KK, inv_KK, Rc_8, Tc_8, 'Dist',kc);

imagesc(image);
% hold on;
H = figure;
plot(Plane(:,1),-Plane(:,2),'r*');
% figure;
% plot(X_8(1,:),-X_8(2,:),'bx');
% G = H.CurrentAxes;
% G.YLim = [-240 240];
% G.XLim = [-320 320];
