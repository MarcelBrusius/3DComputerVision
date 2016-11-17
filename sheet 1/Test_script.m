image = imread('00001.jpg');
load('Calib_Results.mat');

Plane = projectPoints(X_2, KK, Rc_2, Tc_2, 'Dist',kc);

H = figure;
imagesc([-320 320], [-240 240],image);
hold on;
% H = figure;
plot(Plane(:,1),Plane(:,2),'r*');
% figure;
% plot(X_8(1,:),-X_8(2,:),'bx');
% G = H.CurrentAxes;
% G.YLim = [-240 240];
% G.XLim = [-320 320];
