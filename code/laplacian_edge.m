function laplacian_image=laplacian_edge(input_image,theta)
input_image=medfilt2(input_image,[2,2]);
[row,column,depth]=size(input_image);
image_gray=zeros(row,column,depth);
if depth>1
    image_gray=rgb2gray(input_image);
else
    image_gray=input_image;
end
%生成高斯核
gaussian_kernel = fspecial('gaussian',[3,3],1.4);
%高斯滤波
gaussian_image = filter2(gaussian_kernel,input_image);
%laplacian_kernel=[0,1,0;1,-4,1;0,1,0];
laplacian_kernel=[1,1,1;1,-8,1;1,1,1];
%laplacian_kernel_x=[-1,0,1;-1,0,1;-1,0,1];
%laplacian_kernel_y=[-1,-1,-1;0,0,0;1,1,1];
%laplacian_x_image=filter2(laplacian_kernel_x,gaussian_image);
%laplacian_y_image=filter2(laplacian_kernel_y,gaussian_image);
laplacian_image=filter2(laplacian_kernel,gaussian_image);
for r=1:row
    for c=1:column
        if laplacian_image(r,c)<theta
            laplacian_image(r,c)=0;
        end
    end
end
laplacian_image=logical(laplacian_image);
figure,imshow(laplacian_image);
title('Laplacian算子的处理结果')