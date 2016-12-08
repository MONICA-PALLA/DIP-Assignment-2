img=imread('2.jpg');%figure,imshow(input);
%input=rgb2gray(input);
input_1=img(:,:,1);
input_2=img(:,:,2);
input_3=img(:,:,3);
a = zeros(size(img,1),size(img,2));
%input_1 = cat(3,red,a,a);
r=size(input_1,1);
c=size(input_1,2);
S=zeros(1,9);
for i=1:r-2
    for j=1:c-2
        seg=input_1(i:i+2,j:j+2);
        S(1,1:3)=seg(1,1:3);
        S(1,4:6)=seg(2,1:3);
        S(1,7:9)=seg(3,1:3);
        for k=1:9
            min=k;
            for l=k:9
                if(S(1,l)<S(1,min))
                    min=l;
                end
            end
            temp=S(1,k);
            S(1,k)=S(1,min);
            S(1,min)=temp;
        end
        mid=S(1,5);
        input_1(i+1,j+1)=mid;
    end
end
%input_2 = cat(3,a,green,a);
r=size(input_2,1);
c=size(input_2,2);
S=zeros(1,9);
for i=1:r-2
    for j=1:c-2
        seg=input_2(i:i+2,j:j+2);
        S(1,1:3)=seg(1,1:3);
        S(1,4:6)=seg(2,1:3);
        S(1,7:9)=seg(3,1:3);
        for k=1:9
            min=k;
            for l=k:9
                if(S(1,l)<S(1,min))
                    min=l;
                end
            end
            temp=S(1,k);
            S(1,k)=S(1,min);
            S(1,min)=temp;
        end
        mid=S(1,5);
        input_2(i+1,j+1)=mid;
    end
end

%input_3 = cat(3,a,a,blue);
r=size(input_3,1);
c=size(input_3,2);
S=zeros(1,9);
for i=1:r-2
    for j=1:c-2
        seg=input_3(i:i+2,j:j+2);
        S(1,1:3)=seg(1,1:3);
        S(1,4:6)=seg(2,1:3);
        S(1,7:9)=seg(3,1:3);
        for k=1:9
            min=k;
            for l=k:9
                if(S(1,l)<S(1,min))
                    min=l;
                end
            end
            temp=S(1,k);
            S(1,k)=S(1,min);
            S(1,min)=temp;
        end
        mid=S(1,5);
        input_3(i+1,j+1)=mid;
    end
end
rimg=cat(3,input_1,input_2,input_3);
figure,imshow(rimg);
%figure,imshow(input_2);
%figure,imshow(input_3);