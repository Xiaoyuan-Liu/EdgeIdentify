function prewitt_image=prewitt_edge(input_image,theta)
[row,column,depth]=size(input_image);
image_gray=zeros(row,column,depth);
if depth>1
    image_gray=rgb2gray(input_image);
else
    image_gray=input_image;
end
prewitt_kernel_x=[-1,0,1;-1,0,1;-1,0,1];
prewitt_kernel_y=[-1,-1,-1;0,0,0;1,1,1];
prewitt_x_image=filter2(prewitt_kernel_x,image_gray);
prewitt_y_image=filter2(prewitt_kernel_y,image_gray);
prewitt_image=abs(prewitt_x_image+prewitt_y_image);
for r=1:row
    for c=1:column
        if prewitt_image(r,c)<theta
            prewitt_image(r,c)=0;
        end
    end
end
prewitt_image=logical(prewitt_image);
figure,imshow(prewitt_image);
title('Prewitt算子的处理结果')