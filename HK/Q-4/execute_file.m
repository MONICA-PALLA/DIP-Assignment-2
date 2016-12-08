
x=imread('2.jpg');
x=imresize(x,[100 100]);
%t=rgb2gray(x);
figure,
imshow(x);
y=x(:,:,2);
L=length(y);
j=1;
k=1;
i=1;
while i<2*L
    comp=1;
    for j=j:L
        if j==L 
            break
        end;  
         if y(j)==y(j+1)
            comp=comp+1;
        else
            break
        end;
    end;
        Output(k+1)=comp;
        Output(k)=y(j);
        if j==L && y(j-1)==y(j) 
            break
        end;  
        i=i+1;
        k=k+2;
        j=j+1;
        if j==L 
            if mod(L,2)==0 
            Output(k+1)=1;
            Output(k)=y(j);
            else
            Output(k+1)=1;    
            Output(k)=y(j);
                       end;
             break
        end;
    end;
    Output;
    
    p=uint8(Output);
    figure,
    imshow(p);
chari=imread('puffy.jpg');

I=Output;
figure,imshow(I)
%I=rgb2gray(a);
[m,n]=size(I);
Totalcount=m*n;
cnt=1;
sigma=0;
for i=0:255
k=I==i;
count(cnt)=sum(k(:))
pro(cnt)=count(cnt)/Totalcount;
sigma=sigma+pro(cnt);
cumpro(cnt)=sigma;
cnt=cnt+1;
end;
symbols = [0:255];
dict = makedict(symbols,pro);
vec_size = 1;
for p = 1:m
for q = 1:n
newvec(vec_size) = I(p,q);
vec_size = vec_size+1;
end
end
hcode = Henco(newvec,dict);
dhsig1 = Hdeco(hcode,dict);
dhsig = uint8(dhsig1);
dec_row=sqrt(length(dhsig));
dec_col=dec_row;
arr_row = 1;
arr_col = 1;
vec_si = 1;
for x = 1:m
for y = 1:n
back(x,y)=dhsig(vec_si);
arr_col = arr_col+1;
vec_si = vec_si + 1;
end
arr_row = arr_row+1;
end
[deco, map] = gray2ind(back,256);
RGB = ind2rgb(deco,map);
imwrite(RGB,'decoded.JPG');
figure,imshow(RGB);

%rle=imread('c:/compressed.jpg','jpg');
rle=imread('decoded.JPG');
% loop to calculate length of binary data matrix
l=0;
for t=2:length(rle)
l=l+rle(t);
end
%qw=chari;
%figure,imshow(qw);
a=false(1,l); % preallocate array

a(1)=rle(1);
m=2;n=1;
for i = 2:length(rle)-1
for j=1:rle(m)
a(n+1)=a(n); n=n+1;
end
m=m+1;a(n)=~a(n);
end
qw=chari;

figure,imshow(chari); %ignore if u want output matrix as logical
title('original Image');
%end of the huffman coding
