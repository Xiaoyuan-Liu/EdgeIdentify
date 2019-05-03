%DIP16 Assignment 2
%Edge Detection
%In this assignment, you should build your own edge detection and edge linking 
%function to detect the edges of a image.
%Please Note you cannot use the build-in matlab edge and bwtraceboundary function
%We supply four test images, and you can use others to show your results for edge
%detection, but you just need do edge linking for rubberband_cap.png.
clc; clear all;
% Load the test image
imgTest = im2double(imread('bird.png'));
imgTestGray = rgb2gray(imgTest);
imgTestGray=medfilt2(imgTestGray,[2,2]);
figure; clf;
imshow(imgTestGray);

%now call your function my_edge, you can use matlab edge function to see
%the last result as a reference first
img_edge = edge(imgTestGray);
figure,imshow(img_edge);
title('库函数处理结果')
my_edge=roberts_edge(imgTestGray,0.12);
my_edge=prewitt_edge(imgTestGray,0.3);
my_edge=sobel_edge(imgTestGray,0.4);
my_edge=laplacian_edge(imgTestGray,0.1);
my_edge=canny_edge(imgTestGray, 1.4, 5, 5, 0.25, 0.1);%第二个参数为高斯滤波的Sigma值，但是在实际实现中并未用到该值
%now call your function my_edgelinking, you can use matlab bwtraceboundary 
%function to see the last result as a reference first. please trace as many 
%different object boundaries as you can, and choose different start edge points.
%figure;clf;
%imshow(img_edge);
%imshow(canny_edge);
background = im2bw(img_edge, 1);
figure,imshow(background)
title('库函数边缘链接');
%using imtool, you select a object boundary to trace, and choose
%an appropriate edge point as the start point 
%imtool(img_edge);
dim=size(img_edge);
connectivity=8; 
num_points=180;
for row=1:dim(1)  
    for col=1:dim(2)     
        if img_edge(row,col)     
            break;      
        end
    end
    contour =bwtraceboundary(img_edge,[row, col],'N');
        %检测是否为边界  
    if(~isempty(contour))    
        hold on;      
        plot(contour(:,2),contour(:,1),'rx','LineWidth',1); 
        %画出边界     
    end
        
end

background = im2bw(img_edge, 1);
figure,imshow(background)
title('我的边缘链接');
dim=size(img_edge);
connectivity=8; 
num_points=180;
for row=1:dim(1)  
    for col=1:dim(2)     
        if img_edge(row,col)     
            break;      
        end
    end
    contour =my_edgelinking2(img_edge, row, col);
    if(~isempty(contour))    
        hold on;      
        plot(contour(:,2),contour(:,1),'rx','LineWidth',1); 
    end
        
end




clc; clear all;
% Load the test image
imgTest = im2double(imread('giraffe.png'));
imgTestGray = rgb2gray(imgTest);
%imgTestGray=medfilt2(imgTestGray,[2,2]);
figure; clf;
imshow(imgTestGray);

%now call your function my_edge, you can use matlab edge function to see
%the last result as a reference first
img_edge = edge(imgTestGray);
figure,imshow(img_edge);
title('库函数处理结果')
my_edge=roberts_edge(imgTestGray,0.12);
my_edge=prewitt_edge(imgTestGray,0.3);
my_edge=sobel_edge(imgTestGray,0.4);%Roberts's theta is 0.15;Prewitt 0.3;Sobel 0.4
my_edge=laplacian_edge(imgTestGray,0.05);%Roberts's theta is 0.15;Prewitt 0.3;Sobel 0.4
my_edge=canny_edge(imgTestGray, 1.4, 5, 5, 0.25, 0.1);
%now call your function my_edgelinking, you can use matlab bwtraceboundary 
%function to see the last result as a reference first. please trace as many 
%different object boundaries as you can, and choose different start edge points.
%figure;clf;
%imshow(img_edge);
%imshow(canny_edge);
background = im2bw(img_edge, 1);
figure,imshow(background)
title('库函数边缘链接');
%using imtool, you select a object boundary to trace, and choose
%an appropriate edge point as the start point 
%imtool(img_edge);
dim=size(img_edge);
connectivity=8; 
num_points=180;
for row=1:dim(1)  
    for col=1:dim(2)     
        if img_edge(row,col)     
            break;      
        end
    end
    contour =bwtraceboundary(img_edge,[row, col],'N');
        %检测是否为边界  
    if(~isempty(contour))    
        hold on;      
        plot(contour(:,2),contour(:,1),'rx','LineWidth',1); 
        %画出边界     
    end
        
end

background = im2bw(img_edge, 1);
figure,imshow(background)
title('我的边缘链接');
dim=size(img_edge);
connectivity=8; 
num_points=180;
for row=1:dim(1)  
    for col=1:dim(2)     
        if img_edge(row,col)     
            break;      
        end
    end
    contour =my_edgelinking2(img_edge, row, col);
    if(~isempty(contour))    
        hold on;      
        plot(contour(:,2),contour(:,1),'rx','LineWidth',1); 
    end
        
end




clc; clear all;
% Load the test image
imgTest = im2double(imread('rubberband_cap.png'));
imgTestGray = rgb2gray(imgTest);
imgTestGray=medfilt2(imgTestGray,[2,2]);
figure; clf;
imshow(imgTestGray);

%now call your function my_edge, you can use matlab edge function to see
%the last result as a reference first
img_edge = edge(imgTestGray);
figure,imshow(img_edge);
title('库函数处理结果')
my_edge=roberts_edge(imgTestGray,0.12);
my_edge=prewitt_edge(imgTestGray,0.3);
my_edge=sobel_edge(imgTestGray,0.4);%Roberts's theta is 0.15;Prewitt 0.3;Sobel 0.4
my_edge=laplacian_edge(imgTestGray,0.05);%Roberts's theta is 0.15;Prewitt 0.3;Sobel 0.4
my_edge=canny_edge(imgTestGray, 1.4, 5, 5, 0.25, 0.1);
%now call your function my_edgelinking, you can use matlab bwtraceboundary 
%function to see the last result as a reference first. please trace as many 
%different object boundaries as you can, and choose different start edge points.
%figure;clf;
%imshow(img_edge);
%imshow(canny_edge);
background = im2bw(img_edge, 1);
figure,imshow(background)
title('库函数边缘链接');
%using imtool, you select a object boundary to trace, and choose
%an appropriate edge point as the start point 
%imtool(img_edge);
dim=size(img_edge);
connectivity=8; 
num_points=180;
for row=1:dim(1)  
    for col=1:dim(2)     
        if img_edge(row,col)     
            break;      
        end
    end
    contour =bwtraceboundary(img_edge,[row, col],'N');
        %检测是否为边界  
    if(~isempty(contour))    
        hold on;      
        plot(contour(:,2),contour(:,1),'rx','LineWidth',1); 
        %画出边界     
    end
        
end

background = im2bw(img_edge, 1);
figure,imshow(background)
title('我的边缘链接');
dim=size(img_edge);
connectivity=8; 
num_points=180;
for row=1:dim(1)  
    for col=1:dim(2)     
        if img_edge(row,col)     
            break;      
        end
    end
    contour =my_edgelinking2(img_edge, row, col);
    if(~isempty(contour))    
        hold on;      
        plot(contour(:,2),contour(:,1),'rx','LineWidth',1); 
    end
        
end


clc; clear all;
% Load the test image
imgTest = im2double(imread('noise.png'));
imgTestGray = rgb2gray(imgTest);
imgTestGray=medfilt2(imgTestGray,[2,2]);
figure; clf;
imshow(imgTestGray);

%now call your function my_edge, you can use matlab edge function to see
%the last result as a reference first
img_edge = edge(imgTestGray);
figure,imshow(img_edge);
title('库函数处理结果')
my_edge=roberts_edge(imgTestGray,0.12);
my_edge=prewitt_edge(imgTestGray,0.3);
my_edge=sobel_edge(imgTestGray,0.4);%Roberts's theta is 0.15;Prewitt 0.3;Sobel 0.4
my_edge=laplacian_edge(imgTestGray,0.05);%Roberts's theta is 0.15;Prewitt 0.3;Sobel 0.4
my_edge=canny_edge(imgTestGray, 1.4, 5, 5, 0.25, 0.1);
%now call your function my_edgelinking, you can use matlab bwtraceboundary 
%function to see the last result as a reference first. please trace as many 
%different object boundaries as you can, and choose different start edge points.
%figure;clf;
%imshow(img_edge);
%imshow(canny_edge);
background = im2bw(img_edge, 1);
figure,imshow(background)
title('库函数边缘链接');
%using imtool, you select a object boundary to trace, and choose
%an appropriate edge point as the start point 
%imtool(img_edge);
dim=size(img_edge);
connectivity=8; 
num_points=180;
for row=1:dim(1)  
    for col=1:dim(2)     
        if img_edge(row,col)     
            break;      
        end
    end
    contour =bwtraceboundary(img_edge,[row, col],'N');
        %检测是否为边界  
    if(~isempty(contour))    
        hold on;      
        plot(contour(:,2),contour(:,1),'rx','LineWidth',1); 
        %画出边界     
    end
        
end

background = im2bw(img_edge, 1);
figure,imshow(background)
title('我的边缘链接');
dim=size(img_edge);
connectivity=8; 
num_points=180;
for row=1:dim(1)  
    for col=1:dim(2)     
        if img_edge(row,col)     
            break;      
        end
    end
    contour =my_edgelinking2(img_edge, row, col);
    if(~isempty(contour))    
        hold on;      
        plot(contour(:,2),contour(:,1),'rx','LineWidth',1); 
    end
        
end



clc; clear all;
% Load the test image
imgTest = im2double(imread('noise2.png'));
imgTestGray = rgb2gray(imgTest);
imgTestGray=medfilt2(imgTestGray,[2,2]);
figure; clf;
imshow(imgTestGray);

%now call your function my_edge, you can use matlab edge function to see
%the last result as a reference first
img_edge = edge(imgTestGray);
figure,imshow(img_edge);
title('库函数处理结果')
my_edge=roberts_edge(imgTestGray,0.12);
my_edge=prewitt_edge(imgTestGray,0.3);
my_edge=sobel_edge(imgTestGray,0.4);%Roberts's theta is 0.15;Prewitt 0.3;Sobel 0.4
my_edge=laplacian_edge(imgTestGray,0.05);%Roberts's theta is 0.15;Prewitt 0.3;Sobel 0.4
my_edge=canny_edge(imgTestGray, 1.4, 5, 5, 0.25, 0.1);
%now call your function my_edgelinking, you can use matlab bwtraceboundary 
%function to see the last result as a reference first. please trace as many 
%different object boundaries as you can, and choose different start edge points.
%figure;clf;
%imshow(img_edge);
%imshow(canny_edge);
background = im2bw(img_edge, 1);
figure,imshow(background)
title('库函数边缘链接');
%using imtool, you select a object boundary to trace, and choose
%an appropriate edge point as the start point 
%imtool(img_edge);
dim=size(img_edge);
connectivity=8; 
num_points=180;
for row=1:dim(1)  
    for col=1:dim(2)     
        if img_edge(row,col)     
            break;      
        end
    end
    contour =bwtraceboundary(img_edge,[row, col],'N');
        %检测是否为边界  
    if(~isempty(contour))    
        hold on;      
        plot(contour(:,2),contour(:,1),'rx','LineWidth',1); 
        %画出边界     
    end
        
end

background = im2bw(img_edge, 1);
figure,imshow(background)
title('我的边缘链接');
dim=size(img_edge);
connectivity=8; 
num_points=180;
for row=1:dim(1)  
    for col=1:dim(2)     
        if img_edge(row,col)     
            break;      
        end
    end
    contour =my_edgelinking2(img_edge, row, col);
    if(~isempty(contour))    
        hold on;      
        plot(contour(:,2),contour(:,1),'rx','LineWidth',1); 
    end
        
end



clc; clear all;
% Load the test image
imgTest = im2double(imread('1.bmp'));
imgTestGray = rgb2gray(imgTest);
%imgTestGray=medfilt2(imgTestGray,[2,2]);
figure; clf;
imshow(imgTestGray);

%now call your function my_edge, you can use matlab edge function to see
%the last result as a reference first
img_edge = edge(imgTestGray);
figure,imshow(img_edge);
title('库函数处理结果')
my_edge=roberts_edge(imgTestGray,0.12);
my_edge=prewitt_edge(imgTestGray,0.3);
my_edge=sobel_edge(imgTestGray,0.4);%Roberts's theta is 0.15;Prewitt 0.3;Sobel 0.4
my_edge=laplacian_edge(imgTestGray,0.05);%Roberts's theta is 0.15;Prewitt 0.3;Sobel 0.4
my_edge=canny_edge(imgTestGray, 1.4, 5, 5, 0.25, 0.1);
%now call your function my_edgelinking, you can use matlab bwtraceboundary 
%function to see the last result as a reference first. please trace as many 
%different object boundaries as you can, and choose different start edge points.
%figure;clf;
%imshow(img_edge);
%imshow(canny_edge);
background = im2bw(img_edge, 1);
figure,imshow(background)
title('库函数边缘链接');
%using imtool, you select a object boundary to trace, and choose
%an appropriate edge point as the start point 
%imtool(img_edge);
dim=size(img_edge);
connectivity=8; 
num_points=180;
for row=1:dim(1)  
    for col=1:dim(2)     
        if img_edge(row,col)     
            break;      
        end
    end
    contour =bwtraceboundary(img_edge,[row, col],'N');
        %检测是否为边界  
    if(~isempty(contour))    
        hold on;      
        plot(contour(:,2),contour(:,1),'rx','LineWidth',1); 
        %画出边界     
    end
        
end

background = im2bw(img_edge, 1);
figure,imshow(background)
title('我的边缘链接');
dim=size(img_edge);
connectivity=8; 
num_points=180;
for row=1:dim(1)  
    for col=1:dim(2)     
        if img_edge(row,col)     
            break;      
        end
    end
    contour =my_edgelinking2(img_edge, row, col);
    if(~isempty(contour))    
        hold on;      
        plot(contour(:,2),contour(:,1),'rx','LineWidth',1); 
    end
        
end



clc; clear all;
% Load the test image
imgTest = im2double(imread('2.bmp'));
imgTestGray = rgb2gray(imgTest);
%imgTestGray=medfilt2(imgTestGray,[2,2]);
figure; clf;
imshow(imgTestGray);

%now call your function my_edge, you can use matlab edge function to see
%the last result as a reference first
img_edge = edge(imgTestGray);
figure,imshow(img_edge);
title('库函数处理结果')
my_edge=roberts_edge(imgTestGray,0.12);
my_edge=prewitt_edge(imgTestGray,0.3);
my_edge=sobel_edge(imgTestGray,0.4);%Roberts's theta is 0.15;Prewitt 0.3;Sobel 0.4
my_edge=laplacian_edge(imgTestGray,0.05);%Roberts's theta is 0.15;Prewitt 0.3;Sobel 0.4
my_edge=canny_edge(imgTestGray, 1.4, 5, 5, 0.25, 0.1);
%now call your function my_edgelinking, you can use matlab bwtraceboundary 
%function to see the last result as a reference first. please trace as many 
%different object boundaries as you can, and choose different start edge points.
%figure;clf;
%imshow(img_edge);
%imshow(canny_edge);
background = im2bw(img_edge, 1);
figure,imshow(background)
title('库函数边缘链接');
%using imtool, you select a object boundary to trace, and choose
%an appropriate edge point as the start point 
%imtool(img_edge);
dim=size(img_edge);
connectivity=8; 
num_points=180;
for row=1:dim(1)  
    for col=1:dim(2)     
        if img_edge(row,col)     
            break;      
        end
    end
    contour =bwtraceboundary(img_edge,[row, col],'N');
        %检测是否为边界  
    if(~isempty(contour))    
        hold on;      
        plot(contour(:,2),contour(:,1),'rx','LineWidth',1); 
        %画出边界     
    end
        
end

background = im2bw(img_edge, 1);
figure,imshow(background)
title('我的边缘链接');
dim=size(img_edge);
connectivity=8; 
num_points=180;
for row=1:dim(1)  
    for col=1:dim(2)     
        if img_edge(row,col)     
            break;      
        end
    end
    contour =my_edgelinking2(img_edge, row, col);
    if(~isempty(contour))    
        hold on;      
        plot(contour(:,2),contour(:,1),'rx','LineWidth',1); 
    end
        
end



clc; clear all;
% Load the test image
imgTest = im2double(imread('3.bmp'));
imgTestGray = rgb2gray(imgTest);
%imgTestGray=medfilt2(imgTestGray,[2,2]);
figure; clf;
imshow(imgTestGray);

%now call your function my_edge, you can use matlab edge function to see
%the last result as a reference first
img_edge = edge(imgTestGray);
figure,imshow(img_edge);
title('库函数处理结果')
my_edge=roberts_edge(imgTestGray,0.12);
my_edge=prewitt_edge(imgTestGray,0.3);
my_edge=sobel_edge(imgTestGray,0.4);%Roberts's theta is 0.15;Prewitt 0.3;Sobel 0.4
my_edge=laplacian_edge(imgTestGray,0.05);%Roberts's theta is 0.15;Prewitt 0.3;Sobel 0.4
my_edge=canny_edge(imgTestGray, 1.4, 5, 5, 0.25, 0.1);
%now call your function my_edgelinking, you can use matlab bwtraceboundary 
%function to see the last result as a reference first. please trace as many 
%different object boundaries as you can, and choose different start edge points.
%figure;clf;
%imshow(img_edge);
%imshow(canny_edge);
background = im2bw(img_edge, 1);
figure,imshow(background)
title('库函数边缘链接');
%using imtool, you select a object boundary to trace, and choose
%an appropriate edge point as the start point 
%imtool(img_edge);
dim=size(img_edge);
connectivity=8; 
num_points=180;
for row=1:dim(1)  
    for col=1:dim(2)     
        if img_edge(row,col)     
            break;      
        end
    end
    contour =bwtraceboundary(img_edge,[row, col],'N');
        %检测是否为边界  
    if(~isempty(contour))    
        hold on;      
        plot(contour(:,2),contour(:,1),'rx','LineWidth',1); 
        %画出边界     
    end
        
end

background = im2bw(img_edge, 1);
figure,imshow(background)
title('我的边缘链接');
dim=size(img_edge);
connectivity=8; 
num_points=180;
for row=1:dim(1)  
    for col=1:dim(2)     
        if img_edge(row,col)     
            break;      
        end
    end
    contour =my_edgelinking2(img_edge, row, col);
    if(~isempty(contour))    
        hold on;      
        plot(contour(:,2),contour(:,1),'rx','LineWidth',1); 
    end
        
end
