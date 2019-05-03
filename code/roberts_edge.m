function roberts_image=roberts_edge(input_image,theta)
[row,column,depth]=size(input_image);
image_gray=zeros(row,column,depth);
if depth>1
    image_gray=rgb2gray(input_image);
else
    image_gray=input_image;
end
roberts_kernel_x=[0,0,0;0,1,0;0,0,-1];
roberts_kernel_y=[0,0,0;0,0,1;0,-1,0];
roberts_x_image=filter2(roberts_kernel_x,image_gray);
roberts_y_image=filter2(roberts_kernel_y,image_gray);
roberts_image=abs(roberts_x_image+roberts_y_image);
for r=1:row
    for c=1:column
        if roberts_image(r,c)<theta
            roberts_image(r,c)=0;
        end
    end
end
roberts_image=logical(roberts_image);
figure,imshow(roberts_image);
title('Roberts算子的处理结果')