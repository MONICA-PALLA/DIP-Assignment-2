img=imread('2.jpg');
a = zeros(size(img,1),size(img,2));
input_1=img(:,:,1);
input_2=img(:,:,2);
input_3=img(:,:,3);
input=double(input_1);
r=size(input,1);
c=size(input,2);
Fx=[-1 -2 -1;0 0 0; 1 2 1];
Fy=[-1 0 1;-2 0 2; -1 0 1];
for i=1:r-2
    for j=1:c-2
        X=sum(sum(Fx.*input(i:i+2,j:j+2)));
        Y=sum(sum(Fy.*input(i:i+2,j:j+2)));
        input_1(i,j)=sqrt(X^2+Y^2);
    end
end

input=double(input_2);
for i=1:r-2
    for j=1:c-2
        X=sum(sum(Fx.*input(i:i+2,j:j+2)));
        Y=sum(sum(Fy.*input(i:i+2,j:j+2)));
        input_2(i,j)=sqrt(X^2+Y^2);
    end
end

input=double(input_3);
for i=1:r-2
    for j=1:c-2
        X=sum(sum(Fx.*input(i:i+2,j:j+2)));
        Y=sum(sum(Fy.*input(i:i+2,j:j+2)));
        input_3(i,j)=sqrt(X^2+Y^2);
    end
end
final_image = cat(3,input_1,input_2,input_3);
figure,imshow(final_image);