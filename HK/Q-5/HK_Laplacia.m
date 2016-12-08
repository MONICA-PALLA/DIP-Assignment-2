img=imread('2.jpg');
figure,imshow(img);
a = zeros(size(img,1),size(img,2));
input_1 = img(:,:,1);
input_2 = img(:,:,2);
input_3 = img(:,:,3);
r=size(input_1,1);
c=size(input_1,2);
J=zeros(size(input_1));
F2=[1 1 1;1 -8 1; 1 1 1]; %8 neighbours
input_1=double(input_1);

for i=1:r-2
    for j=1:c-2
        J(i,j)=sum(sum(F2.*input_1(i:i+2,j:j+2)));
    end
end
J=uint8(J);

R=zeros(size(input_2));
F2=[1 1 1;1 -8 1; 1 1 1]; %8 neighbours
input_2=double(input_2);
for i=1:r-2
    for j=1:c-2
        R(i,j)=sum(sum(F2.*input_2(i:i+2,j:j+2)));
    end
end
R=uint8(R);

M=zeros(size(input_3));
F2=[1 1 1;1 -8 1; 1 1 1]; %8 neighbours
input_3=double(input_3);
for i=1:r-2
    for j=1:c-2
        M(i,j)=sum(sum(F2.*input_3(i:i+2,j:j+2)));
    end
end
M=uint8(M);
final = cat(3,J,R,M);
figure,imshow(final);