function output = my_edgelinking(binary_image, row, col)
[M,N]=size(binary_image);
queue{1}=[row,col];%��̬���飬����ʵ���������������ջ����˴�Ҳ�����ö���ʵ�ֹ����������
num=1;
qtail=2;
neighbor_location=[
    -1,-1;
    -1,0;
    -1,1;
    0,-1;
    0,1;
    1,-1;
    1,0;
    1,1];
while qtail>1
    qtail=qtail-1;
    center=queue{qtail};
    output(num,1)=center(1);
    output(num,2)=center(2);
    num=num+1;
    for i=1:8
        neighbor=center+neighbor_location(i,:);
        if neighbor(1,1)>0 && neighbor(1,1)<=M && neighbor(1,2)>0 && neighbor(1,2)<=N
            if binary_image(neighbor(1,1),neighbor(1,2))==1
                binary_image(neighbor(1,1),neighbor(1,2))=0;
                queue{qtail}=neighbor;
                qtail=qtail+1;
            end
        end
    end
end
