clc
close all;
clear all;
warning off

v = VideoReader('Input.mp4');
vidOut = VideoWriter('Output');
open(vidOut)
disp(v.NumFrames);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Single Frame %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% frame = read(v,6);
% f = figure(2);
% imshow(frame);
% [centers, radii] = imfindcircles(frame,[5 25]);
% hold on;
% disp(centers(1,1));
% disp(radii(3,1));
% viscircles(centers, radii,'EdgeColor','b');
% rectangle('Position', [centers(1,1)-radii(1,1), centers(1,2)-radii(1,1), (radii(1,1)*2+4), (radii(1,1)*2+4)],'EdgeColor','r','LineWidth',2)
% rectangle('Position', [centers(2,1)-radii(2,1), centers(2,2)-radii(2,1), (radii(2,1)*2+4), (radii(2,1)*2+4)],'EdgeColor','r','LineWidth',2)
% rectangle('Position', [centers(3,1)-radii(3,1), centers(3,2)-radii(3,1), (radii(3,1)*2+4), (radii(3,1)*2+4)],'EdgeColor','r','LineWidth',2)  
% 
% ImgName = strcat(int2str(6),'.jpg');
% saveas(f, ImgName);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Multiple Frames %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for ii = 1:v.NumFrames
  frame = read(v, ii);
  f = figure(2);
  imshow(frame);
%%%%% d = imdistline; %% To estimate the radius by dragging 
  [centers, radii] = imfindcircles(frame,[5 25]);
  viscircles(centers, radii,'EdgeColor','r');
  sz = size(centers);
  disp(ii);
  if sz ~= 0
      x1 = centers(1)- 12;
      y1 = centers(4)- 12;
      x2 = centers(2)- 12; 
      y2 = centers(5)- 12;
      x3 = centers(3)- 12; 
      y3 = centers(6)- 12;
      
      w1 = (12*2)+4;
      h1 = (12*2)+4;
      w2 = (12*2)+4;
      h2 = (12*2)+4;
      w3 = (12*2)+4;
      h3 = (12*2)+4;

      rectangle('Position', [x1, y1, w1, h1],'EdgeColor','c','LineWidth',2)
      rectangle('Position', [x2, y2, w2, h2],'EdgeColor','c','LineWidth',2)
      rectangle('Position', [x3, y3, w3, h3],'EdgeColor','c','LineWidth',2)  
      ImgName = strcat(int2str(ii),'.jpg');
      ImgName = strcat("D:\User Documents\Downloads\Advanced Media Lab MatLab (DMET1002)\Mini Project 2\Output Images/", ImgName);
      saveas(f, ImgName); 
  end
end

for iii = 1:v.NumFrames
  ImgName = strcat(int2str(iii),'.jpg');
  ImgName = strcat("D:\User Documents\Downloads\Advanced Media Lab MatLab (DMET1002)\Mini Project 2\Output Images/", ImgName);
  frame = imread(ImgName);
  writeVideo(vidOut, frame);
end
    
close(vidOut)
