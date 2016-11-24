function [ ] = projectAndDraw( image, dist, colour )
%This function takes the number of the image from 00-24 AS STRING!. It then
%loads the needed parameters and projects them on the Chessboard.

if image <=9
    img = imread(['0000',num2str(image),'.jpg']);
elseif image >=10 && image<=24
    img = imread(['000',num2str(image),'.jpg']);
else 
    error('No image found')
end
load('Calib_Results.mat');
image = num2str(image+1);

if dist == 1
Plane_Dist = projectPoints(eval(['X_',image]), KK, eval(['Rc_',image]), eval(['Tc_',image]), 'Dist',kc);
else
Plane = projectPoints(str2double(eval(['X_',image]), KK, eval(['Rc_',image]), eval(['Tc_',image])));
end

H = figure;
imagesc([-320 320], [-240 240],img);
hold on;
% H = figure;
plot(Plane_Dist(1,:),Plane_Dist(2,:),[colour,'*']);
% figure;
hold on;
plot(Plane(1,:),Plane(2,:),'bx');

end

