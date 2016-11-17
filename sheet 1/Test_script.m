image = imread('00001.jpg');
load('Calib_Results.mat');

Plane_Dist = projectPoints(X_2, KK, Rc_2, Tc_2, 'Dist',kc);
Plane = projectPoints(X_2, KK, Rc_2, Tc_2);

H = figure;
imagesc([-320 320], [-240 240],image);
% hold on;
H = figure;
plot(Plane_Dist(1,:),Plane_Dist(2,:),'r*');
% figure;
% hold on;
% plot(Plane(:,1),Plane(:,2),'bx');
% G = H.CurrentAxes;
% G.YLim = [-240 240];
% G.XLim = [-320 320];