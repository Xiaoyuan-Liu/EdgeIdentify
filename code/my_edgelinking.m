function output = my_edgelinking(binary_image, row, col)
%in this function, you should finish the edge linking utility.
%the input parameters are a matrix of a binary image containing the edge
%information and coordinates of one of the edge points of a obeject
%boundary, you should run this function multiple times to find different
%ariobject boundes
%the output parameter is a Q-by-2 matrix, where Q is the number of boundary 
%pixels. B holds the row and column coordinates of the boundary pixels.
%you can use different methods to complete the edge linking function
%the better the quality of object boundary and the more the object boundaries, you will get higher scores  
[M,N]=size(binary_image);
    tmp=[];
    queue_head=1;
    queue_tail=1;
    neighbour=[-1 -1;-1 0;-1 1;0 -1;0 1;1 -1;1 0;1 1];  %8-neighbourhood
%     neighbour=[-1 0;1 0;0 1;0 -1];     %4-neighbourhood
    q{queue_tail}=[row col];
    queue_tail=queue_tail+1;
    [ser1 , ~]=size(neighbour);
    num = 1;
    while queue_head~=queue_tail
        pix=q{queue_head};
        tmp(num,1)=pix(1,1);
        tmp(num,2)=pix(1,2);
        num = num + 1;
        for i=1:ser1
            pix1=pix+neighbour(i,:);
            if pix1(1)>=1 && pix1(2)>=1 &&pix1(1)<=M && pix1(2)<=N
                if binary_image(pix1(1),pix1(2)) == true
                    binary_image(pix1(1),pix1(2)) = false;
                    q{queue_tail}=[pix1(1) pix1(2)];
                    queue_tail=queue_tail+1;

                end      
            end
        end
        queue_head=queue_head+1;
    end
    output = tmp;