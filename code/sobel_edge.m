function sobel_image=sobel_edge(input_image,theta)
[row,column,depth]=size(input_image);
image_gray=zeros(row,column,depth);
if depth>1
    image_gray=rgb2gray(input_image);
else
    image_gray=input_image;
end
sobel_kernel_x=[-1,0,1;-2,0,2;-1,0,1];
sobel_kernel_y=[-1,-2,-1;0,0,0;1,2,1];
sobel_x_image=filter2(sobel_kernel_x,image_gray);
sobel_y_image=filter2(sobel_kernel_y,image_gray);
sobel_image=abs(sobel_x_image+sobel_y_image);
for r=1:row
    for c=1:column
        if sobel_image(r,c)<theta
            sobel_image(r,c)=0;
        end
    end
end
sobel_image=logical(sobel_image);
figure,imshow(sobel_image);
title('Soebl算子的处理结果')