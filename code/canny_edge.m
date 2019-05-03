function output = canny_edge(input_image, sigma, gaussian_kernel_row, gaussian_kernel_column, high, low)
if(mod(gaussian_kernel_row,2)==0||mod(gaussian_kernel_column,2)==0)
    error('The dimensionality of Gaussian must be odd');
end
[row,column,depth]=size(input_image);
if depth>1
    input_image=rgb2gray(input_image);
end
output = zeros(row,column);
%生成高斯核
gaussian_kernel = fspecial('gaussian',[gaussian_kernel_row,gaussian_kernel_column],sigma);
%高斯滤波
gaussian_image = filter2(gaussian_kernel,input_image);
%
%Sobel卷积运算
Sobel_kernel_x=[-1,0,1;-2,0,2;-1,0,1];
Sobel_kernel_y=[-1,-2,-1;0,0,0;1,2,1];
Sobel_x_image=filter2(Sobel_kernel_x,gaussian_image);
Sobel_y_image=filter2(Sobel_kernel_y,gaussian_image);
Sobel_image=zeros(row,column);
tan_Sobel_image=zeros(row,column);
theta_Sobel_image=zeros(row,column);
for r=1:row
    for c=1:column
        Sobel_image(r,c)=sqrt(Sobel_x_image(r,c).^2+Sobel_y_image(r,c).^2);
        tan_Sobel_image(r,c)=tan(Sobel_y_image(r,c)./Sobel_x_image(r,c));
        if tan_Sobel_image(r,c)>=0&&tan_Sobel_image(r,c)<1
            theta_Sobel_image(r,c)=2;
        elseif tan_Sobel_image(r,c)>=1
            theta_Sobel_image(r,c)=3;
        elseif tan_Sobel_image(r,c)<-1
            theta_Sobel_image(r,c)=0;
        else
            theta_Sobel_image(r,c)=1;
        end
    end
end
%非极大值抑制
for r=2:row-1
    for c=2:column-1
        
        switch theta_Sobel_image(r,c)
            case 0
                abstan=abs(tan_Sobel_image(r,c));
                g1=Sobel_image(r,c+1).*(1-abstan)+Sobel_image(r-1,c+1).*abstan;
                g2=Sobel_image(r,c-1).*(1-abstan)+Sobel_image(r+1,c-1).*abstan;
            case 1
                abstan=abs(1./tan_Sobel_image(r,c));
                g1=Sobel_image(r-1,c).*(1-abstan)+Sobel_image(r-1,c+1).*abstan;
                g2=Sobel_image(r+1,c).*(1-abstan)+Sobel_image(r+1,c-1).*abstan;
            case 2
                abstan=abs(1./tan_Sobel_image(r,c));
                g1=Sobel_image(r-1,c).*(1-abstan)+Sobel_image(r-1,c-1).*abstan;
                g2=Sobel_image(r+1,c).*(1-abstan)+Sobel_image(r+1,c+1).*abstan;
            otherwise
                abstan=abs(tan_Sobel_image(r,c));
                g1=Sobel_image(r,c-1).*(1-abstan)+Sobel_image(r-1,c-1).*abstan;
                g2=Sobel_image(r,c+1).*(1-abstan)+Sobel_image(r+1,c+1).*abstan;
        end
        if Sobel_image(r,c)>=g1&&Sobel_image(r,c)>=g2
            if Sobel_image(r,c)>=high
                output(r,c)=1;
            elseif Sobel_image(r,c)>=low
                output(r,c)=0;
            end
        end
    end
end
%双阈值检测
for r=2;row-1
    for c=2:column-1
        if output(r,c)==low
            eight_neighbor=[output(r-1,c-1),output(r-1,c),output(r-1,c+1);
                output(r,c-1),output(r,c),output(r,c+1);
                output(r+1,c-1),output(r+1,c),output(r+1,c+1)];
            if ~isempty(find(eight_neighbor,high))
                output(r,c)=1;
            end
        end
    end
end
output=logical(output);
figure,imshow(output);
title('Canny算子的处理结果')