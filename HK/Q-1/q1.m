clear all;
close all;

%read image
img=imread('2.jpg');
figure,imshow(img),title('Original image');

%histogram
figure,imhist(img),title('Histogram of the original image');
[x,y]=size(img);
Red = img;
Green = img;
Blue = img;

% intensity slicing 1 to 50 and 50 to 100
for i=1:50
     I = img == i;
Red(I) = 16;
Green(I) = 255;
Blue(I) =200;
end
 
for j=50:100
     J = img == j;
Red(J) = 255;
Green(J) = 0;
Blue(J) =0;
end

%Result image
Result= cat(3, Red, Green, Blue);
figure,imshow(Result),title('Resulted image');