clc;
clear all;
close all;
 
 Image=imread('C:\Users\hp pc\Pictures\6.jpe');
 I=rgb2gray(Image);
 I=double(I);
 
 [r,c]=size(I);
 code=cell(r,c);
 decoded=zeros(size(I));
 prime=randint(r,c,[1,max(max(I(:,:)))]);

 for i=1:r
     for j=1:c
         value=I(i,j);
         code{i,j} = Q3_enc(value,prime(i,j));  
     end
 end
 for i=1:r
     for j=1:c
         decoded(i,j) = Q3_dec(code{i,j}, prime(i,j));
     end
 end
 k=0;
 for i=1:r
     for j=1:c
         if decoded(i,j)~=I(i,j)
             k=1;
         end
     end
 end
 if k==0
     figure,imshow(uint8(decoded));
 end